import 'package:flutter/cupertino.dart';

import 'lunar_solar_converter.dart';

class SolarLunarUtil {
  static int getBirthDayStatus(int year, int month, int day) {
    int timer = getTimer(year, month, day);
    if (timer < 0) {
      return 2;
    }
    if (timer > 0) {
      return 3;
    }
    return 1;
  }

  static int getTimer(int year, int month, int day) {
    DateTime now = DateTime.now();

    DateTime nowTime = new DateTime(now.year, now.month, now.day);
    DateTime targetTime = new DateTime(year, month, day);
    return targetTime.millisecondsSinceEpoch - nowTime.millisecondsSinceEpoch;
  }

  static String getRemainDayInfo(String type, int month, int day) {
    String prefix = '还剩';
    String countDown = '';
    DateTime time = DateTime.now();
    int currYear = time.year;
    if (type == 'lunar') {
      // 农历
      Lunar lunar = Lunar(lunarYear: currYear, lunarMonth: month, lunarDay: day, isLeap: false);
      var date = LunarSolarConverter.lunarToSolar(lunar);
      int solarMonth = date.solarMonth;
      int solarDay = date.solarDay;
      int birthdayStatus = SolarLunarUtil.getBirthDayStatus(currYear, solarMonth, solarDay);
      if (birthdayStatus == 1) {
        countDown = '生日快乐';
      }
      if (birthdayStatus == 2) {
        lunar = Lunar(lunarYear: currYear + 1, lunarMonth: month, lunarDay: day, isLeap: false);
        date = LunarSolarConverter.lunarToSolar(lunar);
        solarMonth = date.solarMonth;
        solarDay = date.solarDay;
        int timer = SolarLunarUtil.getTimer(currYear + 1, solarMonth, solarDay);
        double test = timer / 1000 / 60 / 60 / 24;
        countDown = '$prefix${test.floor()}天';
      }
      if (birthdayStatus == 3) {
        int timer = SolarLunarUtil.getTimer(currYear, solarMonth, solarDay);
        double test = timer / 1000 / 60 / 60 / 24;
        countDown = '$prefix${test.floor()}天';
      }
    } else {
      int birthdayStatus = SolarLunarUtil.getBirthDayStatus(currYear, month, day);
      if (birthdayStatus == 1) {
        countDown = '生日快乐';
      }
      if (birthdayStatus == 2) {
        int timer = SolarLunarUtil.getTimer(currYear + 1, month, day);
        double test = timer / 1000 / 60 / 60 / 24;
        countDown = '$prefix${test.floor()}天';
      }
      if (birthdayStatus == 3) {
        int timer = SolarLunarUtil.getTimer(currYear, month, day);
        double test = timer / 1000 / 60 / 60 / 24;
        countDown = '$prefix${test.floor()}天';
      }
    }
    return countDown;
  }

}