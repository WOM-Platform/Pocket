// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'totem_scans_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getScannedTotemsHash() => r'e911bed4e65a16189b5333ff6109869d28d88bc3';

/// See also [getScannedTotems].
@ProviderFor(getScannedTotems)
final getScannedTotemsProvider =
    AutoDisposeStreamProvider<List<TotemRow>>.internal(
  getScannedTotems,
  name: r'getScannedTotemsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getScannedTotemsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetScannedTotemsRef = AutoDisposeStreamProviderRef<List<TotemRow>>;
String _$getEventTotemsHash() => r'e9683346efc824097906a0d753ac06bfd38c5b1b';

/// See also [getEventTotems].
@ProviderFor(getEventTotems)
final getEventTotemsProvider =
    AutoDisposeStreamProvider<Map<int, List<TotemRow>>>.internal(
  getEventTotems,
  name: r'getEventTotemsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getEventTotemsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetEventTotemsRef
    = AutoDisposeStreamProviderRef<Map<int, List<TotemRow>>>;
String _$getMyContactTotemsHash() =>
    r'e4f6ec45702b86fd5faac31681492cb07c569783';

/// See also [getMyContactTotems].
@ProviderFor(getMyContactTotems)
final getMyContactTotemsProvider =
    AutoDisposeStreamProvider<List<TotemRow>>.internal(
  getMyContactTotems,
  name: r'getMyContactTotemsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getMyContactTotemsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetMyContactTotemsRef = AutoDisposeStreamProviderRef<List<TotemRow>>;
String _$totemSearchNotifierHash() =>
    r'1c5c6ff40427f07a2e5313e0c6834912b10d5a09';

/// See also [TotemSearchNotifier].
@ProviderFor(TotemSearchNotifier)
final totemSearchNotifierProvider =
    AutoDisposeNotifierProvider<TotemSearchNotifier, SearchState>.internal(
  TotemSearchNotifier.new,
  name: r'totemSearchNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$totemSearchNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TotemSearchNotifier = AutoDisposeNotifier<SearchState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
