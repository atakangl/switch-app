import 'package:flutter/material.dart';
import 'package:flutter_switch_app/widgets/card_container.dart';

class MyBodyPage extends StatelessWidget {
  const MyBodyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.orange.shade300,
        Colors.purple.shade300,
        Colors.cyan.shade300
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Center(child: MyCardContainer()),
    );
  }
}
