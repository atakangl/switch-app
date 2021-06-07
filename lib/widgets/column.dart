import 'package:flutter/material.dart';
import 'package:flutter_switch_app/widgets/switch.dart';
import 'package:flutter_switch_app/widgets/text.dart';

class MyColumn extends StatelessWidget {
  final bool isSwitched;
  final String time;
  const MyColumn({Key? key, required this.isSwitched, required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MyText(time: time),
        MySwitch(isSwitched: isSwitched),
      ],
    );
  }
}
