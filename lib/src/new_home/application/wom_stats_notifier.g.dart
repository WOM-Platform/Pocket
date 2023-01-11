// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wom_stats_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String _$TransactionCountNotifierHash() =>
    r'3f1f76ca7209992ab4c0a022d5abdc6853aa7324';

/// See also [TransactionCountNotifier].
final transactionCountNotifierProvider =
    AsyncNotifierProvider<TransactionCountNotifier, int>(
  TransactionCountNotifier.new,
  name: r'transactionCountNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$TransactionCountNotifierHash,
);
typedef TransactionCountNotifierRef = AsyncNotifierProviderRef<int>;

abstract class _$TransactionCountNotifier extends AsyncNotifier<int> {
  @override
  FutureOr<int> build();
}

String _$fetchAimInPercentageHash() =>
    r'66aa16e1f3a02134dfc72d85085b8c08333d7188';

/// See also [fetchAimInPercentage].
final fetchAimInPercentageProvider =
    AutoDisposeFutureProvider<List<AimInPercentage>>(
  fetchAimInPercentage,
  name: r'fetchAimInPercentageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchAimInPercentageHash,
);
typedef FetchAimInPercentageRef
    = AutoDisposeFutureProviderRef<List<AimInPercentage>>;
String _$fetchWomCountEarnedInTheLastWeekHash() =>
    r'806e29b029c26c4e039594457bb67c5e36912dcf';

/// See also [fetchWomCountEarnedInTheLastWeek].
final fetchWomCountEarnedInTheLastWeekProvider = AutoDisposeFutureProvider<int>(
  fetchWomCountEarnedInTheLastWeek,
  name: r'fetchWomCountEarnedInTheLastWeekProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchWomCountEarnedInTheLastWeekHash,
);
typedef FetchWomCountEarnedInTheLastWeekRef = AutoDisposeFutureProviderRef<int>;
String _$fetchWomCountSpentInTheLastWeekHash() =>
    r'e0b113b39a1b2aec11d0098576ccf1b595bf36e0';

/// See also [fetchWomCountSpentInTheLastWeek].
final fetchWomCountSpentInTheLastWeekProvider = AutoDisposeFutureProvider<int>(
  fetchWomCountSpentInTheLastWeek,
  name: r'fetchWomCountSpentInTheLastWeekProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchWomCountSpentInTheLastWeekHash,
);
typedef FetchWomCountSpentInTheLastWeekRef = AutoDisposeFutureProviderRef<int>;
