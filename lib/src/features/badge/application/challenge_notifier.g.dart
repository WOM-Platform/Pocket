// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getChallengeHash() => r'0e424cc41f14e427a7a295dc550f633247249728';

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

/// See also [getChallenge].
@ProviderFor(getChallenge)
const getChallengeProvider = GetChallengeFamily();

/// See also [getChallenge].
class GetChallengeFamily extends Family<AsyncValue<ChallengeData>> {
  /// See also [getChallenge].
  const GetChallengeFamily();

  /// See also [getChallenge].
  GetChallengeProvider call(
    String challengeId,
  ) {
    return GetChallengeProvider(
      challengeId,
    );
  }

  @override
  GetChallengeProvider getProviderOverride(
    covariant GetChallengeProvider provider,
  ) {
    return call(
      provider.challengeId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getChallengeProvider';
}

/// See also [getChallenge].
class GetChallengeProvider extends AutoDisposeFutureProvider<ChallengeData> {
  /// See also [getChallenge].
  GetChallengeProvider(
    String challengeId,
  ) : this._internal(
          (ref) => getChallenge(
            ref as GetChallengeRef,
            challengeId,
          ),
          from: getChallengeProvider,
          name: r'getChallengeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getChallengeHash,
          dependencies: GetChallengeFamily._dependencies,
          allTransitiveDependencies:
              GetChallengeFamily._allTransitiveDependencies,
          challengeId: challengeId,
        );

  GetChallengeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.challengeId,
  }) : super.internal();

  final String challengeId;

  @override
  Override overrideWith(
    FutureOr<ChallengeData> Function(GetChallengeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetChallengeProvider._internal(
        (ref) => create(ref as GetChallengeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        challengeId: challengeId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ChallengeData> createElement() {
    return _GetChallengeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetChallengeProvider && other.challengeId == challengeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, challengeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetChallengeRef on AutoDisposeFutureProviderRef<ChallengeData> {
  /// The parameter `challengeId` of this provider.
  String get challengeId;
}

class _GetChallengeProviderElement
    extends AutoDisposeFutureProviderElement<ChallengeData>
    with GetChallengeRef {
  _GetChallengeProviderElement(super.provider);

  @override
  String get challengeId => (origin as GetChallengeProvider).challengeId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
