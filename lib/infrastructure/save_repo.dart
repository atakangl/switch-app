import 'package:dartz/dartz.dart';
import 'package:flutter_switch_app/models/cache_data.dart';
import 'package:flutter_switch_app/models/exceptions.dart';
import 'package:flutter_switch_app/models/failure.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyRepo {
  Future<Either<Failure, CacheData>> readAll() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String now = pref.getString('now') ?? 'Hi';
      bool isSwitch = pref.getBool('isSwitched') ?? false;
      return Right(CacheData.initial(now, isSwitch));
    } on CacheException {
      //null falan?
      return Left(CacheFailure());
    }
  }

  Future<Either<Failure, Unit>> saveAll(CacheData cacheData) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();

      String hour = DateTime.now().hour.toString();
      String minute = DateTime.now().minute.toString();
      if (hour.length == 1) hour = "0" + hour;
      if (minute.length == 1) minute = "0" + minute;
      String now = hour.toString() + ":" + minute.toString();

      await pref.setString('now', now);
      await pref.setBool('isSwitched', !cacheData.isSwitch);

      return Right(unit);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
