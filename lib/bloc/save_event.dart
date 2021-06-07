part of 'save_bloc.dart';

abstract class SaveEvent extends Equatable {
  const SaveEvent();
  List<Object> get props => [];
}

class ReadEvent extends SaveEvent {
  List<Object> get props => [];
}

class SaveAndReadEvent extends SaveEvent {
  final bool value;
  SaveAndReadEvent({
    required this.value,
  });
  List<Object> get props => [value];
}
