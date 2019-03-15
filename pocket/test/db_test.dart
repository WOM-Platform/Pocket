import 'package:pocket/src/db/aim_db.dart';
import 'package:pocket/src/models/aim_model.dart';
import "package:test/test.dart";

void main() {

  test("should be return an aim object", () async{

    final String id = "1/1/2";
    final AimDB aimDb = AimDB.get();

    final aim = AimModel.fromMap({
      AimModel.ID : id,
      AimModel.SHORT_TITLE : "Simple AIM",
      AimModel.DESCRIPTION : "description",
      AimModel.ICON_URL : "iconUrl",
    });

    await aimDb.insert(aim);

    final queryAim = await aimDb.getAim(id);
    print(aim == queryAim);
    expect(aim, queryAim);
  });

}