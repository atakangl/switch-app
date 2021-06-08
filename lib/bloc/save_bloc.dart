import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch_app/infrastructure/save_repo.dart';
import 'package:flutter_switch_app/injectable.dart';
import 'package:flutter_switch_app/models/cache_data.dart';
import 'package:flutter_switch_app/models/failure.dart';
import 'package:dartz/dartz.dart';

part 'save_event.dart';
part 'save_state.dart';

class SaveBloc extends Bloc<SaveEvent, SaveState> {
  SaveBloc(this._myRepo) : super(SaveState.initial());
  final MyRepo _myRepo;

  @override
  Stream<SaveState> mapEventToState(SaveEvent event) async* {
    if (event is ReadEvent) {
      Either<Failure, CacheData> cacheDataOrFailure = await _myRepo.readAll();

      yield* cacheDataOrFailure.fold((failure) async* {
        yield SaveState(
          cacheDataOption: some(CacheData.initial("Hi", false)),
        );
      }, (cacheData) async* {
        yield SaveState(
          cacheDataOption: some(cacheData),
        );
      });
    } else if (event is SaveCacheEvent) {
      state.cacheDataOption.fold(() => null, (cacheData) async {
        final failureOrUnit = await _myRepo.saveAll(cacheData);
        failureOrUnit.fold((failure) => null, (_) => add(ReadEvent()));
      });
    }
  }
}
