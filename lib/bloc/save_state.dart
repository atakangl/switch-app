part of 'save_bloc.dart';

class SaveState extends Equatable {
  final Option<CacheData> cacheDataOption;

  const SaveState({required this.cacheDataOption});

  factory SaveState.initial() {
    return SaveState(cacheDataOption: none());
  }

  List<Object> get props => [cacheDataOption];
}
