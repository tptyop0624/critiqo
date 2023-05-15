import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:critiqo3/screens/shopping_tips_page.dart';


class ShoppingTipContent extends StatelessWidget {
  final int  imageIndex;



     ShoppingTipContent({Key? key, required this.imageIndex}) :super(key: key) ;


  @override
  Widget build(BuildContext context) {
    String imageRef ='gs://critiqo3.appspot.com/ShoppingTip$imageIndex.png';
    final firebase_storage.Reference ref =
    firebase_storage.FirebaseStorage.instance.refFromURL(imageRef);

    Future<String> _getImageUrl() async {
      return await ref.getDownloadURL();
    }
    return Column(
      children: [
        const Text('Title'),
        FutureBuilder(
          future: _getImageUrl(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Center(
                  child: Column(
                    children: [
                      const Text('Contents'),
                      Image.network(
                        snapshot.data!,
                        width: 200,
                        height: 300,
                      ),
                    ],
                  ),
                );
              }
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ],
    );
  }
}
