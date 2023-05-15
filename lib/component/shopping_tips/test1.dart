import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'dart:io';

class FirebaseImage extends StatelessWidget {
  final String? path;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final String? placeholder;
  final bool isCircular;

  const FirebaseImage({
    Key? key,
    this.path,
    this.width,
    this.height,
    this.fit,
    this.placeholder,
    this.isCircular = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (path == null) {
      if (placeholder != null) {
        return Image.asset(
          placeholder!,
          width: width,
          height: height,
          fit: fit,
        );
      }
      return SizedBox(
        width: width,
        height: height,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return CachedNetworkImage(
      imageUrl: path!,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) => placeholder != null
          ? Image.asset(
        placeholder!,
        width: width,
        height: height,
        fit: fit,
      )
          : SizedBox(
        width: width,
        height: height,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      errorWidget: (context, url, error) => placeholder != null
          ? Image.asset(
        placeholder!,
        width: width,
        height: height,
        fit: fit,
      )
          : SizedBox(
        width: width,
        height: height,
        child: const Center(
          child: Icon(Icons.error),
        ),
      ),
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
          image: DecorationImage(
            image: imageProvider,
            fit: fit!,
          ),
        ),
      ),
    );
  }

  static Future<firebase_storage.Reference?> uploadFile(
      String filePath, String fileName) async {
    try {
      final file = File(filePath);
      final firebaseStorageRef =
      firebase_storage.FirebaseStorage.instance.ref().child(fileName);
      final uploadTask = firebaseStorageRef.putFile(file);
      await uploadTask;
      final fileUrl = await firebaseStorageRef.getDownloadURL();
      return firebase_storage.FirebaseStorage.instance.refFromURL(fileUrl);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
