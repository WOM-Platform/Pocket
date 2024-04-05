import 'dart:convert';
import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/src/models/totem_data.dart';

part 'nfc_notifier.freezed.dart';

part 'nfc_notifier.g.dart';

@freezed
class NFCState with _$NFCState {
  const factory NFCState.data({
    required TotemData totemData,
  }) = NFCStateData;

  const factory NFCState.listening() = NFCStateListening;

  const factory NFCState.unavailable() = NFCStateUnavailable;

  const factory NFCState.loading() = NFCStateLoading;

  const factory NFCState.invalidData() = NFCStateInvalidData;

  const factory NFCState.error(Object error, StackTrace st) = NFCStateError;
}

@riverpod
class NFCNotifier extends _$NFCNotifier {
  @override
  NFCState build() {
    ref.onDispose(() {
      dispose();
    });
    init();
    return NFCState.loading();
  }

  dispose() async {
    await NfcManager.instance.stopSession().catchError((_) {
      /* no op */
    });
  }

  init() async {
    if (!(await NfcManager.instance.isAvailable())) {
      state = NFCState.unavailable();
      return;
    }
    state = NFCState.listening();
    NfcManager.instance.startSession(
      onDiscovered: (tag) async {
        try {
          final t = processNFC(tag);
          if (t == null) {
            state = NFCStateInvalidData();
          } else {
            state = NFCStateData(totemData: t);
          }
          await NfcManager.instance.stopSession();
        } catch (e) {
          state = NFCStateError(e, StackTrace.empty);
          await NfcManager.instance.stopSession().catchError((_) {
            /* no op */
          });
        }
      },
    ).catchError((e) => state = NFCStateError(e, StackTrace.empty));
  }

  TotemData? processNFC(NfcTag tag) {
    final tech = Ndef.from(tag);
    TotemData? _t;
    if (tech is Ndef) {
      final cachedMessage = tech.cachedMessage;
      if (cachedMessage != null) {
        for (int i = 0; i < cachedMessage.records.length; i++) {
          final record = cachedMessage.records[i];
          final _record = Record.fromNdef(record);
          if (_record is WellknownUriRecord) {
            final link = _record.uri.toString();
            final totemData = validateTotemQrCodeWithRegex(link);
            if (totemData != null) {
              _t = totemData;
              break;
            }
          }
        }
      }
    }
    return _t;
  }
}

abstract class Record {
  NdefRecord toNdef();

  static Record fromNdef(NdefRecord record) {
    if (record.typeNameFormat == NdefTypeNameFormat.nfcWellknown &&
        record.type.length == 1 &&
        record.type.first == 0x55) return WellknownUriRecord.fromNdef(record);
    // if (record.typeNameFormat == NdefTypeNameFormat.nfcWellknown &&
    //     record.type.length == 1 &&
    //     record.type.first == 0x54) return WellknownTextRecord.fromNdef(record);
    // if (record.typeNameFormat == NdefTypeNameFormat.media)
    //   return MimeRecord.fromNdef(record);
    // if (record.typeNameFormat == NdefTypeNameFormat.absoluteUri)
    //   return AbsoluteUriRecord.fromNdef(record);
    // if (record.typeNameFormat == NdefTypeNameFormat.nfcExternal)
    //   return ExternalRecord.fromNdef(record);
    throw Exception('Unsupported record');
  }
}

class WellknownUriRecord implements Record {
  WellknownUriRecord({this.identifier, required this.uri});

  final Uint8List? identifier;

  final Uri uri;

  static WellknownUriRecord fromNdef(NdefRecord record) {
    final prefix = NdefRecord.URI_PREFIX_LIST[record.payload.first];
    final bodyBytes = record.payload.sublist(1);
    return WellknownUriRecord(
      identifier: record.identifier,
      uri: Uri.parse(prefix + utf8.decode(bodyBytes)),
    );
  }

  @override
  NdefRecord toNdef() {
    var prefixIndex = NdefRecord.URI_PREFIX_LIST
        .indexWhere((e) => uri.toString().startsWith(e), 1);
    if (prefixIndex < 0) prefixIndex = 0;
    final prefix = NdefRecord.URI_PREFIX_LIST[prefixIndex];
    return NdefRecord(
      typeNameFormat: NdefTypeNameFormat.nfcWellknown,
      type: Uint8List.fromList([0x55]),
      identifier: Uint8List(0),
      payload: Uint8List.fromList([
        prefixIndex,
        ...utf8.encode(uri.toString().substring(prefix.length)),
      ]),
    );
  }
}

class UnsupportedRecord implements Record {
  UnsupportedRecord(this.record);

  final NdefRecord record;

  static UnsupportedRecord fromNdef(NdefRecord record) {
    return UnsupportedRecord(record);
  }

  @override
  NdefRecord toNdef() => record;
}
