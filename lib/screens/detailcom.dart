import 'package:fltratl/screens/cam.dart';
import 'package:fltratl/screens/clientslist.dart';
import 'package:fltratl/screens/detailcltwo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../constant/colors.dart';
import '../model/client.dart';
import '../shared/txtfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:camera/camera.dart';
import 'package:random_string/random_string.dart';
import 'dart:math' show Random;

class detailcom extends StatefulWidget {
  Client detcl;
  String dwnurl;
  detailcom({required this.detcl, this.dwnurl = ''});
  @override
  State<detailcom> createState() => _detailcomState();
}

class _detailcomState extends State<detailcom> {
  String ran = randomAlpha(8);
  camee() async {
    final cameras = await availableCameras();

    // Get a specific camera from the list of available cameras.
    return cameras.first;
  }

  final _cmtitle = TextEditingController();
  final _cmdesc = TextEditingController();
  final _cmdimg = TextEditingController();
  String formatter = DateTime.now().toString();

  getData() {
    return FirebaseFirestore.instance
        .collection("clients")
        .doc(widget.detcl.idcl.toString())
        .collection('cmnds');
  }

  @override
  void dispose() {
    super.dispose();
    _cmtitle.dispose();
    _cmdesc.dispose();
    _cmdimg.dispose();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Command information')),
        ),
        backgroundColor: Color.fromARGB(255, 252, 252, 249),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyTextfld(
                  cntrlr: _cmtitle,
                  textInputTypee: TextInputType.text,
                  obsc: false,
                  hinttxt: " title:",
                ),
                SizedBox(
                  height: 25,
                ),
                MyTextfld(
                  cntrlr: _cmdesc,
                  textInputTypee: TextInputType.text,
                  obsc: false,
                  hinttxt: " description and price:",
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Text(
                      '  Image:  ',
                      style: TextStyle(fontSize: 20),
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          final firstCamera = await camee();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TakePictureScreen(
                                      camera: firstCamera,
                                      dtcl: widget.detcl,
                                      rann: ran)));
                        },
                        child: Text('Take a picture'))
                  ],
                ),
                SizedBox(
                  height: 300,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Btnblue)),
                  onPressed: () {
                    {
                      getData().doc(ran).set({
                        'title': _cmtitle.text.trim(),
                        'description': _cmdesc.text.trim(),
                        'date': formatter,
                        'frstq': false,
                        'scndq': false,
                        'thrdq': false,
                        'rand': ran,
                        'sndid': widget.detcl.idcl.toString()
                      }, SetOptions(merge: true));
                    }
                    ;
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => detailcltwo(
                                  detcl: widget.detcl,
                                )));
                  },
                  child: Text(
                    "Enter",
                    style: TextStyle(fontSize: 19),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
