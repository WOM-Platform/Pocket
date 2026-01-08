// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getExchangeTransactions)
final getExchangeTransactionsProvider = GetExchangeTransactionsProvider._();

final class GetExchangeTransactionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TransactionModel>>,
          List<TransactionModel>,
          FutureOr<List<TransactionModel>>
        >
    with
        $FutureModifier<List<TransactionModel>>,
        $FutureProvider<List<TransactionModel>> {
  GetExchangeTransactionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getExchangeTransactionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getExchangeTransactionsHash();

  @$internal
  @override
  $FutureProviderElement<List<TransactionModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<TransactionModel>> create(Ref ref) {
    return getExchangeTransactions(ref);
  }
}

String _$getExchangeTransactionsHash() =>
    r'0054bebe291f17c0d1a233c0b1553c639af8975c';

@ProviderFor(ExchangeNotifier)
final exchangeProvider = ExchangeNotifierProvider._();

final class ExchangeNotifierProvider
    extends $NotifierProvider<ExchangeNotifier, ExchangeState> {
  ExchangeNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'exchangeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$exchangeNotifierHash();

  @$internal
  @override
  ExchangeNotifier create() => ExchangeNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ExchangeState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ExchangeState>(value),
    );
  }
}

String _$exchangeNotifierHash() => r'093160512b698db0e1804cdf898d197480b8616b';

abstract class _$ExchangeNotifier extends $Notifier<ExchangeState> {
  ExchangeState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ExchangeState, ExchangeState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ExchangeState, ExchangeState>,
              ExchangeState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(NewExchangeNotifier)
final newExchangeProvider = NewExchangeNotifierFamily._();

final class NewExchangeNotifierProvider
    extends $NotifierProvider<NewExchangeNotifier, NewExchangeState> {
  NewExchangeNotifierProvider._({
    required NewExchangeNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'newExchangeProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$newExchangeNotifierHash();

  @override
  String toString() {
    return r'newExchangeProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  NewExchangeNotifier create() => NewExchangeNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NewExchangeState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NewExchangeState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is NewExchangeNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$newExchangeNotifierHash() =>
    r'2ed5ec0acf287b1f02b85bff06251b55ecfac68b';

final class NewExchangeNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          NewExchangeNotifier,
          NewExchangeState,
          NewExchangeState,
          NewExchangeState,
          int
        > {
  NewExchangeNotifierFamily._()
    : super(
        retry: null,
        name: r'newExchangeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  NewExchangeNotifierProvider call(int womCount) =>
      NewExchangeNotifierProvider._(argument: womCount, from: this);

  @override
  String toString() => r'newExchangeProvider';
}

abstract class _$NewExchangeNotifier extends $Notifier<NewExchangeState> {
  late final _$args = ref.$arg as int;
  int get womCount => _$args;

  NewExchangeState build(int womCount);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<NewExchangeState, NewExchangeState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<NewExchangeState, NewExchangeState>,
              NewExchangeState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
