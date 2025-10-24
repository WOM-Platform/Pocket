// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TransactionNotifier)
const transactionProvider = TransactionNotifierFamily._();

final class TransactionNotifierProvider
    extends $AsyncNotifierProvider<TransactionNotifier, TransactionState> {
  const TransactionNotifierProvider._({
    required TransactionNotifierFamily super.from,
    required TransactionNotifierParams super.argument,
  }) : super(
         retry: null,
         name: r'transactionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$transactionNotifierHash();

  @override
  String toString() {
    return r'transactionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TransactionNotifier create() => TransactionNotifier();

  @override
  bool operator ==(Object other) {
    return other is TransactionNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$transactionNotifierHash() =>
    r'25dd90250d6bf9bc9b19d9352ee1af317975ee2b';

final class TransactionNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          TransactionNotifier,
          AsyncValue<TransactionState>,
          TransactionState,
          FutureOr<TransactionState>,
          TransactionNotifierParams
        > {
  const TransactionNotifierFamily._()
    : super(
        retry: null,
        name: r'transactionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TransactionNotifierProvider call(TransactionNotifierParams arg) =>
      TransactionNotifierProvider._(argument: arg, from: this);

  @override
  String toString() => r'transactionProvider';
}

abstract class _$TransactionNotifier extends $AsyncNotifier<TransactionState> {
  late final _$args = ref.$arg as TransactionNotifierParams;
  TransactionNotifierParams get arg => _$args;

  FutureOr<TransactionState> build(TransactionNotifierParams arg);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref as $Ref<AsyncValue<TransactionState>, TransactionState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<TransactionState>, TransactionState>,
              AsyncValue<TransactionState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
