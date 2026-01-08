// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fetchTransactions)
final fetchTransactionsProvider = FetchTransactionsProvider._();

final class FetchTransactionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<TransactionsState>,
          TransactionsState,
          FutureOr<TransactionsState>
        >
    with
        $FutureModifier<TransactionsState>,
        $FutureProvider<TransactionsState> {
  FetchTransactionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchTransactionsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchTransactionsHash();

  @$internal
  @override
  $FutureProviderElement<TransactionsState> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<TransactionsState> create(Ref ref) {
    return fetchTransactions(ref);
  }
}

String _$fetchTransactionsHash() => r'3bc02dc855f16984166436cb5b8539038446cfd5';
