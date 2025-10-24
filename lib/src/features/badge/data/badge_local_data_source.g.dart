// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'badge_local_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getBadgeLocalDataSource)
const getBadgeLocalDataSourceProvider = GetBadgeLocalDataSourceProvider._();

final class GetBadgeLocalDataSourceProvider
    extends
        $FunctionalProvider<
          BadgeLocalDataSource,
          BadgeLocalDataSource,
          BadgeLocalDataSource
        >
    with $Provider<BadgeLocalDataSource> {
  const GetBadgeLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getBadgeLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getBadgeLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<BadgeLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  BadgeLocalDataSource create(Ref ref) {
    return getBadgeLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BadgeLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BadgeLocalDataSource>(value),
    );
  }
}

String _$getBadgeLocalDataSourceHash() =>
    r'8e1928292cd962e492962b9358e3597c4dadf343';
