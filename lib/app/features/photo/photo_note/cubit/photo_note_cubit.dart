import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moja_budowa/app/core/enums.dart';
import 'package:moja_budowa/models/photo_note_model.dart';
import 'package:moja_budowa/repositories/photo_repository.dart';

part 'photo_note_state.dart';

class PhotoNoteCubit extends Cubit<PhotoNoteState> {
  PhotoNoteCubit(this._photoRepository) : super(PhotoNoteState());

  final PhotoRepository _photoRepository;

  Future<void> start() async {
    emit(
      PhotoNoteState(
        status: Status.loading,
        photos: [],
      ),
    );
    try {
      final photos = await _photoRepository.getPhotos();
      emit(PhotoNoteState(status: Status.success, photos: photos));
    } catch (error) {
      emit(PhotoNoteState(
        status: Status.error,
        errorMessage: error.toString(),
      ));
    }
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
}
