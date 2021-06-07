import 'package:dartz/dartz.dart';
import 'package:flutter_switch_app/models/exceptions.dart';
import 'package:flutter_switch_app/models/failure.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyRepo {
  Future<Either<Failure, String>> readNow() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String now = pref.getString('now') ?? 'Hi';
      return Right(now);
    } on CacheException {
      //null falan?
      return Left(CacheFailure());
    }
  }

  Future<bool> readSwitch() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    bool isSwitched = pref.getBool('isSwitched') ?? false;
    return isSwitched;
  }

  Future saveAll(bool value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    String hour = DateTime.now().hour.toString();
    String minute = DateTime.now().minute.toString();
    if (hour.length == 1) hour = "0" + hour;
    if (minute.length == 1) minute = "0" + minute;
    String now = hour.toString() + ":" + minute.toString();

    await pref.setString('now', now);
    await pref.setBool('isSwitched', value);
  }
}
