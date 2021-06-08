import 'package:flutter/material.dart';
import 'package:flutter_switch_app/models/cache_data.dart';
import 'package:flutter_switch_app/widgets/switch.dart';
import 'package:flutter_switch_app/widgets/text.dart';

class MyColumn extends StatelessWidget {
  final CacheData cacheData;
  const MyColumn({Key? key, required this.cacheData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MyText(time: cacheData.now),
        MySwitch(isSwitched: cacheData.isSwitch),
      ],
    );
  }
}
