// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getNFCBackgroundHash() => r'd13e770cf050f355b097c0fa67dc5defbfcdafaf';

/// See also [getNFCBackground].
@ProviderFor(getNFCBackground)
final getNFCBackgroundProvider = AutoDisposeProvider<NfcBackground>.internal(
  getNFCBackground,
  name: r'getNFCBackgroundProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getNFCBackgroundHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetNFCBackgroundRef = AutoDisposeProviderRef<NfcBackground>;
String _$getNfcIntentHash() => r'9bdb9b09c237adb2353994c3f169d35371c7fc3d';

/// See also [getNfcIntent].
@ProviderFor(getNfcIntent)
final getNfcIntentProvider = AutoDisposeStreamProvider<TotemData>.internal(
  getNfcIntent,
  name: r'getNfcIntentProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getNfcIntentHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetNfcIntentRef = AutoDisposeStreamProviderRef<TotemData>;
String _$nfcBackgroundNotifierHash() =>
    r'a10eb51d3cc82eb9f798418713034a6129742a88';

/// See also [NfcBackgroundNotifier].
@ProviderFor(NfcBackgroundNotifier)
final nfcBackgroundNotifierProvider = AutoDisposeAsyncNotifierProvider<
    NfcBackgroundNotifier, TotemData?>.internal(
  NfcBackgroundNotifier.new,
  name: r'nfcBackgroundNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$nfcBackgroundNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NfcBackgroundNotifier = AutoDisposeAsyncNotifier<TotemData?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
