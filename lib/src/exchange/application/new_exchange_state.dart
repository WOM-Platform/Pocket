import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_exchange_state.freezed.dart';

@freezed
class NewExchangeState with _$NewExchangeState {
  const factory NewExchangeState.data({
    required String link,
    required String pin,
    required int womCount,
  }) = NewExchangeStateData;

  const factory NewExchangeState.loading() = NewExchangeStateLoading;

  const factory NewExchangeState.insufficientVouchers() =
      NewExchangeStateinsufficientVouchers;

  const factory NewExchangeState.error(Object error, StackTrace st) =
      NewExchangeStateError;
}

@freezed
class ExchangeState with _$ExchangeState {
  const factory ExchangeState.initial({
    required int dailyAvailableWom,
    required int totalAvailableWom,
  }) = ExchangeStateInitial;

  const factory ExchangeState.loading() = ExchangeStateLoading;

  const factory ExchangeState.error(Object error, StackTrace st) =
      ExchangeStateError;
}
