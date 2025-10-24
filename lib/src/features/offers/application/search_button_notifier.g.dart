// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_button_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EnableSearchButtonNotifier)
const enableSearchButtonProvider = EnableSearchButtonNotifierFamily._();

final class EnableSearchButtonNotifierProvider
    extends $NotifierProvider<EnableSearchButtonNotifier, ZoomStatus> {
  const EnableSearchButtonNotifierProvider._({
    required EnableSearchButtonNotifierFamily super.from,
    required LatLng? super.argument,
  }) : super(
         retry: null,
         name: r'enableSearchButtonProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$enableSearchButtonNotifierHash();

  @override
  String toString() {
    return r'enableSearchButtonProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  EnableSearchButtonNotifier create() => EnableSearchButtonNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ZoomStatus value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ZoomStatus>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is EnableSearchButtonNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$enableSearchButtonNotifierHash() =>
    r'd1a5fad07c3a523a9b3a880557a95173b5bfbc08';

final class EnableSearchButtonNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          EnableSearchButtonNotifier,
          ZoomStatus,
          ZoomStatus,
          ZoomStatus,
          LatLng?
        > {
  const EnableSearchButtonNotifierFamily._()
    : super(
        retry: null,
        name: r'enableSearchButtonProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  EnableSearchButtonNotifierProvider call(LatLng? position) =>
      EnableSearchButtonNotifierProvider._(argument: position, from: this);

  @override
  String toString() => r'enableSearchButtonProvider';
}

abstract class _$EnableSearchButtonNotifier extends $Notifier<ZoomStatus> {
  late final _$args = ref.$arg as LatLng?;
  LatLng? get position => _$args;

  ZoomStatus build(LatLng? position);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<ZoomStatus, ZoomStatus>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ZoomStatus, ZoomStatus>,
              ZoomStatus,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
