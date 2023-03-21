import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moja_budowa/app/core/enums.dart';
import 'package:moja_budowa/models/photo_note_model.dart';
import 'package:moja_budowa/repositories/photo_repository.dart';

part 'photo_note_state.dart';

class PhotoNoteCubit extends Cubit<PhotoNoteState> {
  PhotoNoteCubit(this._photoRepository) : super(PhotoNoteState());

  final PhotoRepository _photoRepository;

  StreamSubscription? _streamSubscription;
  Future<void> start() async {
    _streamSubscription = _photoRepository.getPhotosStream().listen(
      (photos) {
        emit(
          PhotoNoteState(
            photos: photos,
            status: Status.success,
          ),
        );
      },
    )..onError(
        (error) {
          emit(
            PhotoNoteState(
              status: Status.error,
              errorMessage: error.toString(),
            ),
          );
        },
      );
  }

  Future<void> add(
    XFile image,
  ) async {
    try {
      await _photoRepository.addPhotos(
        image,
      );
      emit(
        PhotoNoteState(saved: true),
      );
    } catch (error) {
      emit(
        PhotoNoteState(
          errorMessage: error.toString(),
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
