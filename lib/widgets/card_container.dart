import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch_app/bloc/save_bloc.dart';
import 'package:flutter_switch_app/widgets/column.dart';

class MyCardContainer extends StatelessWidget {
  const MyCardContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      width: 300,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        elevation: 8,
        child: BlocBuilder<SaveBloc, SaveState>(
          builder: (context, SaveState state) {
            return state.cacheDataOption.fold(() {
              return Center(child: CircularProgressIndicator());
            }, (cacheData) {
              return MyColumn(cacheData: cacheData);
            });
          },
        ),
      ),
    );
  }
}
