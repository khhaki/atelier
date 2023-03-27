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

class detailcom extends StatefulWidget {
  Client detcl;
  detailcom({required this.detcl});
  @override
  State<detailcom> createState() => _detailcomState();
}

class _detailcomState extends State<detailcom> {
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
          title: Center(child: Text('Client information')),
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
                  hinttxt: " description:",
                ),
                SizedBox(
                  height: 25,
                ),
                MyTextfld(
                  obsc: false,
                  cntrlr: _cmdimg,
                  textInputTypee: TextInputType.text,
                  hinttxt: " image:",
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Btnblue)),
                  onPressed: () {
                    setState(() {
                      getData().doc().set({
                        'title': _cmtitle.text.trim(),
                        'description': _cmdesc.text.trim(),
                        'image': _cmdimg.text.trim(),
                        'date': formatter,
                      });
                    });
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
