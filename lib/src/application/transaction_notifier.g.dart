// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$transactionNotifierHash() =>
    r'e28f3fa5211a8a8c12ffdea566fb16f15a2021ec';

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

abstract class _$TransactionNotifier
    extends BuildlessAutoDisposeAsyncNotifier<TransactionState> {
  late final TransactionNotifierParams arg;

  FutureOr<TransactionState> build(
    TransactionNotifierParams arg,
  );
}

/// See also [TransactionNotifier].
@ProviderFor(TransactionNotifier)
const transactionNotifierProvider = TransactionNotifierFamily();

/// See also [TransactionNotifier].
class TransactionNotifierFamily extends Family<AsyncValue<TransactionState>> {
  /// See also [TransactionNotifier].
  const TransactionNotifierFamily();

  /// See also [TransactionNotifier].
  TransactionNotifierProvider call(
    TransactionNotifierParams arg,
  ) {
    return TransactionNotifierProvider(
      arg,
    );
  }

  @override
  TransactionNotifierProvider getProviderOverride(
    covariant TransactionNotifierProvider provider,
  ) {
    return call(
      provider.arg,
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
  String? get name => r'transactionNotifierProvider';
}

/// See also [TransactionNotifier].
class TransactionNotifierProvider extends AutoDisposeAsyncNotifierProviderImpl<
    TransactionNotifier, TransactionState> {
  /// See also [TransactionNotifier].
  TransactionNotifierProvider(
    TransactionNotifierParams arg,
  ) : this._internal(
          () => TransactionNotifier()..arg = arg,
          from: transactionNotifierProvider,
          name: r'transactionNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$transactionNotifierHash,
          dependencies: TransactionNotifierFamily._dependencies,
          allTransitiveDependencies:
              TransactionNotifierFamily._allTransitiveDependencies,
          arg: arg,
        );

  TransactionNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.arg,
  }) : super.internal();

  final TransactionNotifierParams arg;

  @override
  FutureOr<TransactionState> runNotifierBuild(
    covariant TransactionNotifier notifier,
  ) {
    return notifier.build(
      arg,
    );
  }

  @override
  Override overrideWith(TransactionNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: TransactionNotifierProvider._internal(
        () => create()..arg = arg,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        arg: arg,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<TransactionNotifier, TransactionState>
      createElement() {
    return _TransactionNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TransactionNotifierProvider && other.arg == arg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arg.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TransactionNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<TransactionState> {
  /// The parameter `arg` of this provider.
  TransactionNotifierParams get arg;
}

class _TransactionNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<TransactionNotifier,
        TransactionState> with TransactionNotifierRef {
  _TransactionNotifierProviderElement(super.provider);

  @override
  TransactionNotifierParams get arg =>
      (origin as TransactionNotifierProvider).arg;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
