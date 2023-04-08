import 'package:bloc/bloc.dart';
import 'package:moja_budowa/app/core/enums.dart';
import 'package:moja_budowa/models/photo_note_model.dart';
import 'package:moja_budowa/repositories/photo_repository.dart';

part 'details_photo_state.dart';

class DetailsPhotoCubit extends Cubit<DetailsPhotoState> {
  DetailsPhotoCubit(this._photoRepository) : super(DetailsPhotoState());

  final PhotoRepository _photoRepository;

  Future<void> getPhotoWithID(String id) async {
    emit(
      DetailsPhotoState(status: Status.loading, photoNoteModel: null),
    );
    try {
      final photoNoteModel = await _photoRepository.getDetalisPhotoNote(id: id);
      emit(DetailsPhotoState(
          status: Status.success, photoNoteModel: photoNoteModel));
    } catch (error) {
      emit(
        DetailsPhotoState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> removePhotoStorage({
    required String photo,
  }) async {
    try {
      await _photoRepository.deletePhotoStorage(photo: photo);
    } catch (error) {
      emit(
        DetailsPhotoState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> remove({
    required String documentID,
    // required String photo,
  }) async {
    try {
      await _photoRepository.deletePhoto(
        id: documentID,
        // photo: photo,
      );
    } catch (error) {
      emit(
        DetailsPhotoState(removingErrorOccured: true),
      );
    }
  }
}
