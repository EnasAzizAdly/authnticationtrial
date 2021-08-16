
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';

class FirebaseStorage extends StatefulWidget {
  const FirebaseStorage({Key? key}) : super(key: key);

  @override
  _FirebaseStorageState createState() => _FirebaseStorageState();
}

class _FirebaseStorageState extends State<FirebaseStorage> {
  late File file;
   var imagepicker =ImagePicker();
   uploadImages()async{
     var pickedimage= await imagepicker.pickImage(source: ImageSource.camera);

   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: RaisedButton(
              onPressed:
                  () async{
                 await uploadImages();
              },
              child: Text("upload image"),
            ),
          )
        ],
      ),
    );
  }
}
