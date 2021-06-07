import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch_app/bloc/save_bloc.dart';
import 'package:flutter_switch_app/widgets/column.dart';

class MyCardContainer extends StatefulWidget {
  const MyCardContainer({Key? key}) : super(key: key);

  @override
  _MyCardContainerState createState() => _MyCardContainerState();
}

class _MyCardContainerState extends State<MyCardContainer> {
  @override
  void initState() {
    super.initState();
    loadBloc();
  }

  loadBloc() async {
    BlocProvider.of<SaveBloc>(context).add(ReadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      width: 300,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        elevation: 8,
        //margin: EdgeInsets.all(5),
        child: BlocBuilder(
          bloc: BlocProvider.of<SaveBloc>(context),
          builder: (context, SaveState state) {
            if (state is FirstState) {
              return MyColumn(
                isSwitched: state.isSwitched,
                time: state.time,
              );
            } else if (state is CachedState) {
              return MyColumn(
                isSwitched: state.isSwitched,
                time: state.time,
              );
            } else
              return Text("daha neee");
          },
        ),
      ),
    );
  }
}
