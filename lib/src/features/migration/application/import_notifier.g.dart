// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'import_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ImportNotifier)
const importProvider = ImportNotifierFamily._();

final class ImportNotifierProvider
    extends $NotifierProvider<ImportNotifier, ImportState> {
  const ImportNotifierProvider._({
    required ImportNotifierFamily super.from,
    required DeepLinkModel super.argument,
  }) : super(
         retry: null,
         name: r'importProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$importNotifierHash();

  @override
  String toString() {
    return r'importProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ImportNotifier create() => ImportNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ImportState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ImportState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ImportNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$importNotifierHash() => r'd72501fc210d9590ff62f46e4f1f776b70b4e0eb';

final class ImportNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          ImportNotifier,
          ImportState,
          ImportState,
          ImportState,
          DeepLinkModel
        > {
  const ImportNotifierFamily._()
    : super(
        retry: null,
        name: r'importProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ImportNotifierProvider call(DeepLinkModel deepLinkModel) =>
      ImportNotifierProvider._(argument: deepLinkModel, from: this);

  @override
  String toString() => r'importProvider';
}

abstract class _$ImportNotifier extends $Notifier<ImportState> {
  late final _$args = ref.$arg as DeepLinkModel;
  DeepLinkModel get deepLinkModel => _$args;

  ImportState build(DeepLinkModel deepLinkModel);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<ImportState, ImportState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ImportState, ImportState>,
              ImportState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
