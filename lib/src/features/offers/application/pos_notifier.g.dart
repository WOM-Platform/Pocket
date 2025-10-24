// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getPos)
const getPosProvider = GetPosFamily._();

final class GetPosProvider
    extends
        $FunctionalProvider<
          AsyncValue<PhysicalPOS>,
          PhysicalPOS,
          FutureOr<PhysicalPOS>
        >
    with $FutureModifier<PhysicalPOS>, $FutureProvider<PhysicalPOS> {
  const GetPosProvider._({
    required GetPosFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'getPosProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getPosHash();

  @override
  String toString() {
    return r'getPosProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<PhysicalPOS> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PhysicalPOS> create(Ref ref) {
    final argument = this.argument as String;
    return getPos(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetPosProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getPosHash() => r'06f33b777510b92d686ff42d1176ef615dceffc6';

final class GetPosFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<PhysicalPOS>, String> {
  const GetPosFamily._()
    : super(
        retry: null,
        name: r'getPosProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  GetPosProvider call(String posID) =>
      GetPosProvider._(argument: posID, from: this);

  @override
  String toString() => r'getPosProvider';
}
