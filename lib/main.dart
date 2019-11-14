import 'package:flutter/material.dart';
import 'package:birthday/solar_lunar_util.dart';

import 'lunar_solar_converter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Welcome to birthday",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Welcome to birthday"),
        ),
        body: new Center(
          child: new BirthdayList(),
        ),
      ),
    );
  }
}

class BirthdayList extends StatefulWidget {
  @override
  createState() => new BirthdayListState();
}

class BirthdayListState extends State<BirthdayList> {
  final List<String> persons = <String>['宝宝','我','老爸','姑姑','妈','大爸爸','韵姐姐','姑爹','李阿姨'];
  final List<String> birthday = <String>['8.2','8.7','1.28', '10.15', '1.29','1.24','12.14','10.29','2.14'];
  final List<String> birthdayType = <String>['lunar','lunar','lunar','lunar','lunar', 'lunar','lunar','lunar','lunar'];
  final List<int> colorCodes = <int>[600, 500, 400];

  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: persons.length,
      itemBuilder: (BuildContext context, int index) {
        String name = '${persons[index]}';
        String type = '${birthdayType[index]}';
        String dayInfo = '${birthday[index]}';

        List<String> days = dayInfo.split('.');
        int month = int.tryParse(days[0]);
        int day = int.tryParse(days[1]);

        String countDown = SolarLunarUtil.getRemainDayInfo(type, month, day);
        return Container(
          height: 50,
//          color: Colors.amber[colorCodes[index]],
          child: Center(child: Text('$name $countDown')),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}