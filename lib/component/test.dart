import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class GalleryUploader extends StatefulWidget {
  const GalleryUploader({Key? key}) : super(key: key);

  @override
  _GalleryUploaderState createState() => _GalleryUploaderState();
}

class _GalleryUploaderState extends State<GalleryUploader> {
  List<String> _downloadURLs = [];
  File? _imageFile;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      }
    });
  }

  Future<String?> _uploadImage(File file) async {
    final ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('gallery')
        .child('${DateTime.now().millisecondsSinceEpoch}.png');

    final task = ref.putFile(file);

    try {
      final snapshot = await task;
      final downloadURL = await snapshot.ref.getDownloadURL();
      return downloadURL;
    } catch (error) {
      print(error);
      return null;
    }
  }


  Future<void> _handleUpload() async {
    if (_imageFile == null) return;
    final downloadURL = await _uploadImage(_imageFile!);
    if (downloadURL != null) {
      setState(() {
        _downloadURLs.add(downloadURL);
      });


      FirebaseFirestore.instance
          .collection('gallery')
          .add({'url': downloadURL});

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('이미지 업로드 성공')),
      );
    }
  }

  Widget _buildGridView() {
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('gallery').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final urls = snapshot.data!.docs.map((doc) => doc['url']).toList();
          print(urls);

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
            ),
            itemCount: urls.length,
            itemBuilder: (BuildContext context, int index) {
              return Image.network(
                urls[index],
                fit: BoxFit.cover,
              );
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery Uploader'),
      ),
      body: Column(
        children: <Widget>[
          if (_imageFile != null) ...[
            Expanded(
              child: Image.file(_imageFile!),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleUpload,
              child: const Text('Upload'),
            ),
          ] else ...[
            const Expanded(
              child: Center(
                child: Text('No image selected.'),
              ),
            ),
          ],
          if (_downloadURLs.isNotEmpty) ...[
            _buildGridView(),
          ],
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: const Icon(Icons.photo_library),
      ),
    );
  }
}

