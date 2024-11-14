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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetNFCBackgroundRef = AutoDisposeProviderRef<NfcBackground>;
String _$getNfcIntentHash() => r'1fe3c5cab4aa2f0043da7ed0243b83da4ebaf7cb';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetNfcIntentRef = AutoDisposeStreamProviderRef<TotemData>;
String _$nfcBackgroundNotifierHash() =>
    r'282b755e1856d3ccdf339e908fb3679c5137434b';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
