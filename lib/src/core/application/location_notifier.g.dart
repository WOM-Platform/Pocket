// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getPositionHash() => r'66f90c4c5cf459d3824e00dc43a1e04e5f693682';

/// See also [getPosition].
@ProviderFor(getPosition)
final getPositionProvider = AutoDisposeFutureProvider<Position>.internal(
  getPosition,
  name: r'getPositionProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getPositionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetPositionRef = AutoDisposeFutureProviderRef<Position>;
String _$locationNotifierHash() => r'92ca4046f01f889752e6cdc494899c804f6c3341';

/// See also [LocationNotifier].
@ProviderFor(LocationNotifier)
final locationNotifierProvider =
    AsyncNotifierProvider<LocationNotifier, Position>.internal(
  LocationNotifier.new,
  name: r'locationNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locationNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LocationNotifier = AsyncNotifier<Position>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
