import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_totem_state.freezed.dart';

@freezed
class MyTotemState with _$MyTotemState {
  const factory MyTotemState.loaded({
    required String name,
    required String totemId,
    required String totemLink,
    @Default(false) bool isRefreshing,
    String? email,
    String? phone,
    String? website,
  }) = MyTotemStateLoaded;

  const factory MyTotemState.loading() = MyTotemStateLoading;

  const factory MyTotemState.empty() = MyTotemStateEmpty;

  const factory MyTotemState.error(MyTotemError error) = MyTotemStateError;
}

enum MyTotemError {
  generic,
  gpsServiceDisabled,
  missingPermissions;

  String get translate {
    return switch (this) {
      MyTotemError.generic => 'personal_totem.errors.generic'.tr(),
      MyTotemError.gpsServiceDisabled => 'personal_totem.errors.gps_disabled'.tr(),
      MyTotemError.missingPermissions => 'personal_totem.errors.missing_permissions'.tr(),
    };
  }

  String get action {
    return switch (this) {
      MyTotemError.generic => 'personal_totem.error_actions.generic'.tr(),
      MyTotemError.gpsServiceDisabled => 'personal_totem.error_actions.gps_disabled'.tr(),
      MyTotemError.missingPermissions => 'personal_totem.error_actions.missing_permissions'.tr(),
    };
  }
}
