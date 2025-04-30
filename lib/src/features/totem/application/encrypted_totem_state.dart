import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wom_pocket/src/core/models/totem_data.dart';

part 'encrypted_totem_state.freezed.dart';

@freezed
class EncryptedTotemState with _$EncryptedTotemState {
  const factory EncryptedTotemState.loading() = EncryptedTotemStateLoading;

  const factory EncryptedTotemState.invalid() = EncryptedTotemStateInvalid;

  const factory EncryptedTotemState.failure(
      {required PersonalTotemFailure failure}) = EncryptedTotemStateFailure;

  const factory EncryptedTotemState.completed({required TotemData totemData}) =
      EncryptedTotemStateCompleted;
}

enum PersonalTotemFailure {
  gpsDisabled,
  missingPermissions,
  outOfTime,
  outOfDistance,
  generic;

  String errorAction() {
    return switch (this) {
      PersonalTotemFailure.outOfTime => 'Ok',
      PersonalTotemFailure.outOfDistance => 'Ok',
      PersonalTotemFailure.generic => 'redeem_personal_totem.error_actions.generic'.tr(),
      PersonalTotemFailure.gpsDisabled => 'redeem_personal_totem.error_actions.gps_disabled'.tr(),
      PersonalTotemFailure.missingPermissions => 'redeem_personal_totem.error_actions.missing_permissions'.tr(),
    };
  }

  String errorDescription() {
    return switch (this) {
      PersonalTotemFailure.outOfTime =>
        'redeem_personal_totem.errors.out_of_time'.tr(),
      PersonalTotemFailure.outOfDistance =>
          'redeem_personal_totem.errors.out_of_distance'.tr(),
      PersonalTotemFailure.generic => 'redeem_personal_totem.errors.generic'.tr(),
      PersonalTotemFailure.gpsDisabled => 'redeem_personal_totem.errors.gps_disabled'.tr(),
      PersonalTotemFailure.missingPermissions => 'redeem_personal_totem.errors.missing_permissions'.tr(),
    };
  }
}
