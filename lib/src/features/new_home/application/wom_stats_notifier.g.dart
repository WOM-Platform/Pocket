// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wom_stats_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fetchAimInPercentage)
final fetchAimInPercentageProvider = FetchAimInPercentageProvider._();

final class FetchAimInPercentageProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<AimInPercentage>>,
          List<AimInPercentage>,
          FutureOr<List<AimInPercentage>>
        >
    with
        $FutureModifier<List<AimInPercentage>>,
        $FutureProvider<List<AimInPercentage>> {
  FetchAimInPercentageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchAimInPercentageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchAimInPercentageHash();

  @$internal
  @override
  $FutureProviderElement<List<AimInPercentage>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<AimInPercentage>> create(Ref ref) {
    return fetchAimInPercentage(ref);
  }
}

String _$fetchAimInPercentageHash() =>
    r'58aadd4b2b649596aa2a8957ef1fd25e611d3a1c';

@ProviderFor(fetchWomCountEarnedInTheLastWeek)
final fetchWomCountEarnedInTheLastWeekProvider =
    FetchWomCountEarnedInTheLastWeekProvider._();

final class FetchWomCountEarnedInTheLastWeekProvider
    extends $FunctionalProvider<AsyncValue<int>, int, FutureOr<int>>
    with $FutureModifier<int>, $FutureProvider<int> {
  FetchWomCountEarnedInTheLastWeekProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchWomCountEarnedInTheLastWeekProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchWomCountEarnedInTheLastWeekHash();

  @$internal
  @override
  $FutureProviderElement<int> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<int> create(Ref ref) {
    return fetchWomCountEarnedInTheLastWeek(ref);
  }
}

String _$fetchWomCountEarnedInTheLastWeekHash() =>
    r'9ba3165a9ae6d69b205e244744df9093411200c5';

@ProviderFor(fetchWomCountSpentInTheLastWeek)
final fetchWomCountSpentInTheLastWeekProvider =
    FetchWomCountSpentInTheLastWeekProvider._();

final class FetchWomCountSpentInTheLastWeekProvider
    extends $FunctionalProvider<AsyncValue<int>, int, FutureOr<int>>
    with $FutureModifier<int>, $FutureProvider<int> {
  FetchWomCountSpentInTheLastWeekProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchWomCountSpentInTheLastWeekProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchWomCountSpentInTheLastWeekHash();

  @$internal
  @override
  $FutureProviderElement<int> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<int> create(Ref ref) {
    return fetchWomCountSpentInTheLastWeek(ref);
  }
}

String _$fetchWomCountSpentInTheLastWeekHash() =>
    r'3fbb1a2cfb7bf4bd89c6ad65c5c84e9612b17107';

@ProviderFor(fetchWomSpent)
final fetchWomSpentProvider = FetchWomSpentProvider._();

final class FetchWomSpentProvider
    extends $FunctionalProvider<AsyncValue<int>, int, FutureOr<int>>
    with $FutureModifier<int>, $FutureProvider<int> {
  FetchWomSpentProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchWomSpentProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchWomSpentHash();

  @$internal
  @override
  $FutureProviderElement<int> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<int> create(Ref ref) {
    return fetchWomSpent(ref);
  }
}

String _$fetchWomSpentHash() => r'fd7a5225c7897335d94fff37503e7893932b4334';

@ProviderFor(TransactionCountNotifier)
final transactionCountProvider = TransactionCountNotifierProvider._();

final class TransactionCountNotifierProvider
    extends $AsyncNotifierProvider<TransactionCountNotifier, int> {
  TransactionCountNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transactionCountProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transactionCountNotifierHash();

  @$internal
  @override
  TransactionCountNotifier create() => TransactionCountNotifier();
}

String _$transactionCountNotifierHash() =>
    r'aa4c0756de8b5fbf3a6d6f7245ae2e0156d1b531';

abstract class _$TransactionCountNotifier extends $AsyncNotifier<int> {
  FutureOr<int> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<int>, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<int>, int>,
              AsyncValue<int>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(getBadgesStats)
final getBadgesStatsProvider = GetBadgesStatsProvider._();

final class GetBadgesStatsProvider
    extends $FunctionalProvider<(int, int), (int, int), (int, int)>
    with $Provider<(int, int)> {
  GetBadgesStatsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getBadgesStatsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getBadgesStatsHash();

  @$internal
  @override
  $ProviderElement<(int, int)> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  (int, int) create(Ref ref) {
    return getBadgesStats(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue((int, int) value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<(int, int)>(value),
    );
  }
}

String _$getBadgesStatsHash() => r'5e1255af7fb3317633da4271f28e7324f248ce37';
