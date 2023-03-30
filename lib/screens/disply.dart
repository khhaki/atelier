import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:fltratl/model/client.dart';
import 'package:fltratl/screens/detailcom.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart' as p;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// A widget that displays the picture taken by the user.

class DisplayPictureScreen extends StatefulWidget {
  final String imagePath;
  Client dtcl;
  String rann;
  DisplayPictureScreen(
      {super.key,
      required this.imagePath,
      required this.dtcl,
      required this.rann});

  @override
  State<DisplayPictureScreen> createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  uptofirestore(imagep) async {
    if (imagep != '') {
      final _firebaseStorage = FirebaseStorage.instance;
      var file = File(imagep);
      var snapshot =
          await _firebaseStorage.ref().child(widget.rann).putFile(File(imagep));

      var downloadUrl = await snapshot.ref.getDownloadURL();

      await FirebaseFirestore.instance
          .collection("clients")
          .doc(widget.dtcl.idcl.toString())
          .collection('cmnds')
          .doc(widget.rann)
          .set({'image': downloadUrl}, SetOptions(merge: true));
    } else {
      print('No Image Path Received');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.file(File(widget.imagePath)),
            SizedBox(
              height: 200,
            ),
            ElevatedButton(
              child: Text("Upload Image",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              onPressed: () async {
                uptofirestore(widget.imagePath);
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blue)),
                backgroundColor: Colors.blue,
                elevation: 5.0,
                padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                splashFactory: InkRipple.splashFactory,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
