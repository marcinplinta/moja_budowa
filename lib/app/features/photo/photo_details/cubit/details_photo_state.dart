part of 'details_photo_cubit.dart';

class DetailsPhotoState {
  final Status status;
  final String? errorMessage;

  final PhotoNoteModel? photoNoteModel;
  final bool removingErrorOccured;

  DetailsPhotoState({
    this.removingErrorOccured = false,
    this.photoNoteModel,
    this.status = Status.initial,
    this.errorMessage = '',
  });
}
