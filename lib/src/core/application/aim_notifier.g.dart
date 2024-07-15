// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aim_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getDatabaseHash() => r'c941a17dfcdeb3c38a4b63db8f22156c675181fd';

/// See also [getDatabase].
@ProviderFor(getDatabase)
final getDatabaseProvider = Provider<MyDatabase>.internal(
  getDatabase,
  name: r'getDatabaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetDatabaseRef = ProviderRef<MyDatabase>;
String _$aimNotifierHash() => r'3fbcdc3f465164bb327782491cefd796c5ff8a5d';

/// See also [AimNotifier].
@ProviderFor(AimNotifier)
final aimNotifierProvider =
    AsyncNotifierProvider<AimNotifier, List<Aim>>.internal(
  AimNotifier.new,
  name: r'aimNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$aimNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AimNotifier = AsyncNotifier<List<Aim>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
