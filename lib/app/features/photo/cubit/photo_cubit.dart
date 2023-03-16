import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moja_budowa/app/core/enums.dart';
import 'package:moja_budowa/models/photo_model.dart';
import 'package:moja_budowa/repositories/photo_repository.dart';
part 'photo_state.dart';

class PhotoCubit extends Cubit<PhotoState> {
  PhotoCubit(this._photoRepository) : super(PhotoState());

  final PhotoRepository _photoRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    _streamSubscription = _photoRepository.getPhotosStream().listen(
      (photos) {
        emit(
          PhotoState(
            photos: photos,
            status: Status.success,
          ),
        );
      },
    )..onError(
        (error) {
          emit(
            PhotoState(
              status: Status.error,
              errorMessage: error.toString(),
            ),
          );
        },
      );
  }

  Future<void> remove({required String documentID}) async {
    try {
      await _photoRepository.delete(id: documentID);
    } catch (error) {
      emit(
        PhotoState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
      start();
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
