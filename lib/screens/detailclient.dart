import 'package:fltratl/screens/clientslist.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../constant/colors.dart';
import '../shared/txtfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class detailcl extends StatefulWidget {
  const detailcl({super.key});

  @override
  State<detailcl> createState() => _detailclState();
}

class _detailclState extends State<detailcl> {
  final _clname = TextEditingController();
  final _clphone = TextEditingController();
  final _cladress = TextEditingController();
  final _cljob = TextEditingController();

  String formatter = DateTime.now().toString();

  CollectionReference clientsref =
      FirebaseFirestore.instance.collection("clients");

  @override
  void dispose() {
    super.dispose();
    _cladress.dispose();
    _cljob.dispose();
    _clname.dispose();
    _clphone.dispose();
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
                  cntrlr: _clname,
                  textInputTypee: TextInputType.text,
                  obsc: false,
                  hinttxt: " name:",
                ),
                SizedBox(
                  height: 25,
                ),
                MyTextfld(
                  cntrlr: _clphone,
                  textInputTypee: TextInputType.text,
                  obsc: false,
                  hinttxt: " phone:",
                ),
                SizedBox(
                  height: 25,
                ),
                MyTextfld(
                  obsc: false,
                  cntrlr: _cladress,
                  textInputTypee: TextInputType.text,
                  hinttxt: " adress:",
                ),
                SizedBox(
                  height: 25,
                ),
                MyTextfld(
                  cntrlr: _cljob,
                  textInputTypee: TextInputType.text,
                  obsc: false,
                  hinttxt: " job:",
                ),
                SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Btnblue)),
                  onPressed: () {
                    setState(() {
                      clientsref.doc().set({
                        'name': _clname.text.trim(),
                        'phone': _clphone.text.trim(),
                        'adress': _cladress.text.trim(),
                        'job': _cljob.text.trim(),
                        'date': formatter
                      });
                    });
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => ClientLst()));
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
