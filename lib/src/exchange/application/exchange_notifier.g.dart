// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getExchangeTransactionsHash() =>
    r'e70e7a2b46e89bb6e797cd9c041cec98c2b11ce7';

/// See also [getExchangeTransactions].
@ProviderFor(getExchangeTransactions)
final getExchangeTransactionsProvider =
    AutoDisposeFutureProvider<List<TransactionModel>>.internal(
  getExchangeTransactions,
  name: r'getExchangeTransactionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getExchangeTransactionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetExchangeTransactionsRef
    = AutoDisposeFutureProviderRef<List<TransactionModel>>;
String _$exchangeNotifierHash() => r'093160512b698db0e1804cdf898d197480b8616b';

/// See also [ExchangeNotifier].
@ProviderFor(ExchangeNotifier)
final exchangeNotifierProvider =
    AutoDisposeNotifierProvider<ExchangeNotifier, ExchangeState>.internal(
  ExchangeNotifier.new,
  name: r'exchangeNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$exchangeNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ExchangeNotifier = AutoDisposeNotifier<ExchangeState>;
String _$newExchangeNotifierHash() =>
    r'04d0d816fc14fce757c87eee7fc4916855205d6a';

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

abstract class _$NewExchangeNotifier
    extends BuildlessAutoDisposeNotifier<NewExchangeState> {
  late final int womCount;

  NewExchangeState build(
    int womCount,
  );
}

/// See also [NewExchangeNotifier].
@ProviderFor(NewExchangeNotifier)
const newExchangeNotifierProvider = NewExchangeNotifierFamily();

/// See also [NewExchangeNotifier].
class NewExchangeNotifierFamily extends Family<NewExchangeState> {
  /// See also [NewExchangeNotifier].
  const NewExchangeNotifierFamily();

  /// See also [NewExchangeNotifier].
  NewExchangeNotifierProvider call(
    int womCount,
  ) {
    return NewExchangeNotifierProvider(
      womCount,
    );
  }

  @override
  NewExchangeNotifierProvider getProviderOverride(
    covariant NewExchangeNotifierProvider provider,
  ) {
    return call(
      provider.womCount,
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
  String? get name => r'newExchangeNotifierProvider';
}

/// See also [NewExchangeNotifier].
class NewExchangeNotifierProvider extends AutoDisposeNotifierProviderImpl<
    NewExchangeNotifier, NewExchangeState> {
  /// See also [NewExchangeNotifier].
  NewExchangeNotifierProvider(
    int womCount,
  ) : this._internal(
          () => NewExchangeNotifier()..womCount = womCount,
          from: newExchangeNotifierProvider,
          name: r'newExchangeNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$newExchangeNotifierHash,
          dependencies: NewExchangeNotifierFamily._dependencies,
          allTransitiveDependencies:
              NewExchangeNotifierFamily._allTransitiveDependencies,
          womCount: womCount,
        );

  NewExchangeNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.womCount,
  }) : super.internal();

  final int womCount;

  @override
  NewExchangeState runNotifierBuild(
    covariant NewExchangeNotifier notifier,
  ) {
    return notifier.build(
      womCount,
    );
  }

  @override
  Override overrideWith(NewExchangeNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: NewExchangeNotifierProvider._internal(
        () => create()..womCount = womCount,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        womCount: womCount,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<NewExchangeNotifier, NewExchangeState>
      createElement() {
    return _NewExchangeNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NewExchangeNotifierProvider && other.womCount == womCount;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, womCount.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin NewExchangeNotifierRef
    on AutoDisposeNotifierProviderRef<NewExchangeState> {
  /// The parameter `womCount` of this provider.
  int get womCount;
}

class _NewExchangeNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<NewExchangeNotifier,
        NewExchangeState> with NewExchangeNotifierRef {
  _NewExchangeNotifierProviderElement(super.provider);

  @override
  int get womCount => (origin as NewExchangeNotifierProvider).womCount;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
