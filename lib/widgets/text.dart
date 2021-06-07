import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String time;
  const MyText({Key? key, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(time,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 50,
        ));
  }
}
