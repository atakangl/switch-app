import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch_app/bloc/save_bloc.dart';
import 'package:flutter_switch_app/injectable.dart';
import 'package:flutter_switch_app/widgets/body.dart';

main(List<String> args) {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: "Merriweather"),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: BlocProvider<SaveBloc>(
              create: (context) => locator<SaveBloc>()..add(ReadEvent()),
              child: MyBodyPage()),
        ));
  }
}
