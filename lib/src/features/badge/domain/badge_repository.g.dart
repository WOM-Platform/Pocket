// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'badge_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getBadgeRepository)
const getBadgeRepositoryProvider = GetBadgeRepositoryProvider._();

final class GetBadgeRepositoryProvider
    extends
        $FunctionalProvider<BadgeRepository, BadgeRepository, BadgeRepository>
    with $Provider<BadgeRepository> {
  const GetBadgeRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getBadgeRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getBadgeRepositoryHash();

  @$internal
  @override
  $ProviderElement<BadgeRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BadgeRepository create(Ref ref) {
    return getBadgeRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BadgeRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BadgeRepository>(value),
    );
  }
}

String _$getBadgeRepositoryHash() =>
    r'5b10d8ea00e5ddc9e6d6ff0deeef1b09411113ea';
