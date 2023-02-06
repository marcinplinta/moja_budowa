import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'dart:async';

import 'package:moja_budowa/repositories/events_repository.dart';
part 'addevent_state.dart';

class AddeventCubit extends Cubit<AddeventState> {
  AddeventCubit(this._eventsRepository) : super(AddeventState());

  final EventsRepository _eventsRepository;

  Future<void> add(
    String title,
    DateTime releaseDate,
    TimeOfDay releaseTime,
  ) async {
    try {
      await _eventsRepository.add(
        title,
        releaseDate,
        releaseTime,
      );
      // throw Exception('Coś poszło nie tak');

      emit(AddeventState(saved: true));
    } catch (error) {
      emit(AddeventState(errorMessage: error.toString()));
    }
  }
}
