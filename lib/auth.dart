import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fltratl/screens/home.dart';
import 'package:fltratl/screens/hometw.dart';
import 'package:fltratl/screens/loading.dart';
import 'package:fltratl/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

Map? admi;

class _AuthState extends State<Auth> {
  Future getdat(AsyncSnapshot<User?> snapshot) async {
    await FirebaseFirestore.instance.collection("users").doc();
    await FirebaseFirestore.instance
        .collection("users")
        .doc(snapshot.data!.uid)
        .get()
        .then(
          (value) => admi = value.data() as Map,
        );

    return admi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return FutureBuilder(
              future: getdat(snapshot),
              builder: (context, snapshot1) {
                if (snapshot1.hasData) {
                  if (admi!['admin']) {
                    return Home();
                  } else {
                    return Hometwo();
                  }
                } else {
                  return LoadingScreen();
                }
              });
        } else {
          print("===================");
          print(snapshot);
          return Login();
        }
      }),
    ));
  }
}
