import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
part 'addevent_state.dart';

class AddeventCubit extends Cubit<AddeventState> {
  AddeventCubit() : super(const AddeventState());

  Future<void> add(
    String title,
    DateTime releaseDate,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('events').add(
        {
          'title': title,
          'release_date': releaseDate,
        },
      );
      emit(const AddeventState(saved: true));
    } catch (error) {
      emit(AddeventState(errorMessage: error.toString()));
    }
  }
}
