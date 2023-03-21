import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moja_budowa/data/photo_remote_data_source.dart';
import 'package:moja_budowa/models/photo_note_model.dart';

class PhotoRepository {
  PhotoRepository(this.photoRemoteDataSources);
  final PhotoRemoteDataSources photoRemoteDataSources;

  Future<void> addPhotos(
    XFile image,
  ) async {
    return photoRemoteDataSources.addPhotos(image);
  }

  Future<List<PhotoNoteModel>> getPhotos() async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    return photoRemoteDataSources.getPhotos();
  }

  Future<void> deletePhoto({
    required String id,
  }) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }

    return photoRemoteDataSources.deletePhoto(id: id);
  }

  Future<PhotoNoteModel> getDetalisPhotoNote({required String id}) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    return photoRemoteDataSources.getDetalisPhotoNote(id: id);
  }
}
