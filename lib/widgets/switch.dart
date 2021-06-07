import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch_app/bloc/save_bloc.dart';

class MySwitch extends StatelessWidget {
  final bool isSwitched;
  const MySwitch({Key? key, required this.isSwitched}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
        activeColor: Colors.green,
        inactiveThumbColor: Colors.red.shade300,
        inactiveTrackColor: Colors.red.shade300,
        value: isSwitched,
        onChanged: (value) {
          BlocProvider.of<SaveBloc>(context).add(SaveAndReadEvent(
            value: value,
          ));
        });
  }
}
