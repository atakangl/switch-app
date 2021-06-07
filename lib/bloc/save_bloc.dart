import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch_app/infrastructure/save_repo.dart';
import 'package:flutter_switch_app/injectable.dart';
import 'package:flutter_switch_app/models/failure.dart';
import 'package:dartz/dartz.dart';

part 'save_event.dart';
part 'save_state.dart';

class SaveBloc extends Bloc<SaveEvent, SaveState> {
  SaveBloc() : super(SaveInitial());
  final MyRepo _myRepo = locator<MyRepo>();

  @override
  Stream<SaveState> mapEventToState(SaveEvent event) async* {
    if (event is ReadEvent) {
      try {
        Either<Failure, String> now = await _myRepo.readNow();
        String time = now.fold((l) => 'Hiiii Eitherdan ilk', (r) => r);
        bool value = await _myRepo.readSwitch();

        yield FirstState(time: time, isSwitched: value);
      } catch (e) {
        debugPrint("HATAA" + e.toString() + state.toString());
      }
    } else if (event is SaveAndReadEvent) {
      try {
        await _myRepo.saveAll(event.value);
        Either<Failure, String> now = await _myRepo.readNow();
        String time = now.fold((l) => 'Hiiii (burası ilk olamaz ki)', (r) => r);

        yield CachedState(isSwitched: event.value, time: time);
      } catch (e) {
        debugPrint("HATAA" + e.toString() + state.toString());
      }
    }
  }
}
