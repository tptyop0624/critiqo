import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  _ImagePickerScreenState createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  File? _image;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GestureDetector(
        onTap: () {
          if (_image == null) {
            _pickImage(ImageSource.gallery);
          } else {
            _fullScreen();
          }
        },
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: _image != null
              ? Image.file(
                  _image!,
                  fit: BoxFit.cover,
                )
              : const Center(child: Text('선택된 제품 이미지가 없습니다.')),
        ),
      ),
      const SizedBox(
        height: 15,
      ),
      ElevatedButton(
        onPressed: () => _pickImage(ImageSource.gallery),
        child: const Icon(Icons.photo_library),
      )
    ]);
  }

  void _fullScreen() {
    if (_image != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Image.file(
                _image!,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      );
    }
  }}
