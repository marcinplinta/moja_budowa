import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:moja_budowa/models/photo_note_model.dart';
import 'package:path/path.dart' as path;
import 'dart:io';

class PhotoRemoteDataSources {
  Stream<List<PhotoNoteModel>> getPhotosStream() {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('Jesteś niezalogowany');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('photo_note')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map(
        (doc) {
          return PhotoNoteModel(
            id: doc.id,
            photo: doc['photo'],
          );
        },
      ).toList();
    });
  }

  Future<void> addPhotos(
    XFile image,
  ) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    final ref = FirebaseStorage.instance
        .ref()
        .child('photo_note')
        .child(path.basename(image.path));
    await ref.putFile(File(image.path));
    final url = await ref.getDownloadURL();
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('photo_note')
        .add({'photo': url});
  }

  Future<void> deletePhotoStorage({
    required String photo,
  }) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    firebase_storage.Reference photoRef = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .storage
        .refFromURL(photo);
    await photoRef.delete();
  }

  Future<void> deletePhoto({
    required String id,
  }) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }

    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('photo_note')
        .doc(id)
        .delete();
  }

  Future<PhotoNoteModel> getDetalisPhotoNote({required String id}) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('photo_note')
        .doc(id)
        .get();
    return PhotoNoteModel(
      id: doc.id,
      photo: doc['photo'],
    );
  }
}

// Stream<List<Map<String, dynamic>>> getPhotosStream() {
//     final userID = FirebaseAuth.instance.currentUser?.uid;
//     if (userID == null) {
//       throw Exception('User is not logged in');
//     }
//     return FirebaseFirestore.instance
//         .collection('users')
//         .doc(userID)
//         .collection('photo_note')
//         .snapshots()
//         .map((querySnapshot) {
//       return querySnapshot.docs.map((doc) {
//         final json = doc.data();
//         json['id'] = doc.id;
//         return json;
//       }).toList();
//     });
//   }
