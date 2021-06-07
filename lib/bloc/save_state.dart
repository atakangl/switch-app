part of 'save_bloc.dart';

abstract class SaveState extends Equatable {
  const SaveState();
}

class SaveInitial extends SaveState {
  @override
  List<Object> get props => [];
}

class FirstState extends SaveState {
  final bool isSwitched;

  final time;

  FirstState({required this.isSwitched, required this.time});

  List<Object> get props => [isSwitched, time];
}

class CachedState extends SaveState {
  final bool isSwitched;
  final time;

  CachedState({required this.isSwitched, required this.time});

  List<Object> get props => [isSwitched, time];
}
