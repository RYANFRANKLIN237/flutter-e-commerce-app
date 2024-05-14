import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';
import 'package:firebase_storage/firebase_storage.dart';

class TFirebaseStorageService extends GetxController{
  static TFirebaseStorageService get instance => Get.find();

  final _firebaseStorage = FirebaseStorage.instance;

  ///upload local assets from IDE
  Future<Uint8List> getImageDataFromAssets(String path) async {
    try{
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      return imageData;
    } catch (e) {
      throw 'Error loading image data: $e';
    }
  }

  ///upload image using image data on cloud firebase storage
  ///returns the downloaded url of the uploaded image
  Future<String> uploadImageData(String path, Uint8List image, String name) async {
    try{
      final ref = _firebaseStorage.ref(path).child(name);
      await ref.putData(image);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      if(e is FirebaseException) {
        throw 'Firebase Exception : ${e.message}';
      } else if (e is SocketException) {
        throw 'Network error : ${e.message}';
      } else if (e is PlatformException) {
        throw 'Platform Exception : ${e.message}';
      } else{
        throw 'Something went wrong, Please try again';
      }
    }
  }

  ///upload image of cloud firebase storage
  /// returns the download url of the uploaded file
  Future<String> uploadImageFile(String path, XFile image) async {
    try {
      final ref = _firebaseStorage.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;

    } catch (e) {
      if(e is FirebaseException) {
        throw 'Firebase Exception : ${e.message}';
      } else if (e is SocketException) {
        throw 'Network error : ${e.message}';
      } else if (e is PlatformException) {
        throw 'Platform Exception : ${e.message}';
      } else{
        throw 'Something went wrong, Please try again';
      }
    }
  }
}