part of 'photo_cubit.dart';

class PhotoState {
  PhotoState({
    this.photos = const [],
    this.status = Status.initial,
    this.errorMessage,
  });
  final List<PhotoModel> photos;
  final Status status;
  final String? errorMessage;
}
