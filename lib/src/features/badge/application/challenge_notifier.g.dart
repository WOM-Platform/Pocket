// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getChallenge)
const getChallengeProvider = GetChallengeFamily._();

final class GetChallengeProvider
    extends
        $FunctionalProvider<
          AsyncValue<ChallengeData>,
          ChallengeData,
          FutureOr<ChallengeData>
        >
    with $FutureModifier<ChallengeData>, $FutureProvider<ChallengeData> {
  const GetChallengeProvider._({
    required GetChallengeFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'getChallengeProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getChallengeHash();

  @override
  String toString() {
    return r'getChallengeProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ChallengeData> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ChallengeData> create(Ref ref) {
    final argument = this.argument as String;
    return getChallenge(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetChallengeProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getChallengeHash() => r'0e424cc41f14e427a7a295dc550f633247249728';

final class GetChallengeFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ChallengeData>, String> {
  const GetChallengeFamily._()
    : super(
        retry: null,
        name: r'getChallengeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetChallengeProvider call(String challengeId) =>
      GetChallengeProvider._(argument: challengeId, from: this);

  @override
  String toString() => r'getChallengeProvider';
}
