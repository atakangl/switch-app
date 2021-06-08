part of 'save_bloc.dart';

abstract class SaveEvent extends Equatable {
  const SaveEvent();
  List<Object> get props => [];
}

class ReadEvent extends SaveEvent {
  List<Object> get props => [];
}

class SaveCacheEvent extends SaveEvent {
  SaveCacheEvent();
}
