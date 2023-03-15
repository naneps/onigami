import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class FireStorageServices extends GetxService {
  late FirebaseStorage _storage;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _storage = FirebaseStorage.instance;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
//  make function upload image reusable

  Future<String> uploadFileToFirebaseStorage(
      String fileName, String filePath) async {
    final storageReference = _storage.ref().child(filePath).child(fileName);
    final uploadTask = storageReference.putFile(File(filePath));
    await uploadTask;
    final downloadUrl = await storageReference.getDownloadURL();
    return downloadUrl;
  }
}
