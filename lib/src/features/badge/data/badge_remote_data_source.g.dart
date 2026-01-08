// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'badge_remote_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getBadgeRemoteDataSource)
final getBadgeRemoteDataSourceProvider = GetBadgeRemoteDataSourceProvider._();

final class GetBadgeRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          BadgeRemoteDataSource,
          BadgeRemoteDataSource,
          BadgeRemoteDataSource
        >
    with $Provider<BadgeRemoteDataSource> {
  GetBadgeRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getBadgeRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getBadgeRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<BadgeRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  BadgeRemoteDataSource create(Ref ref) {
    return getBadgeRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BadgeRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BadgeRemoteDataSource>(value),
    );
  }
}

String _$getBadgeRemoteDataSourceHash() =>
    r'd66a9ef09d10502a1840d488b983783aeb9a88a8';
