import 'package:flutter/material.dart';
import 'package:file/file.dart';


class FullScreenImage extends StatelessWidget {
  final File? image2;

  FullScreenImage({required this.image2});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Full Screen Image'),
      ),
      body: Center(
        child: Image.file(image2!, fit: BoxFit.cover),
      ),
    );
  }
}