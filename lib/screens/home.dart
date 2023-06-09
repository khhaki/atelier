import 'package:fltratl/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/rendering.dart';
import '../constant/colors.dart';
import 'clientslist.dart';
import 'dart:ui' as ui;

class clitem {
  String? imgpath;
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  UserAccountsDrawerHeader(
                    currentAccountPicture: CircleAvatar(
                        backgroundImage:
                            AssetImage('lib/assets/imgs/images.png')),
                    accountEmail: Text(user!.email.toString()),
                    accountName: Text(user!.displayName.toString()),
                  ),
                  ListTile(
                    title: Text("Home"),
                    leading: Icon(Icons.home),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("About"),
                    leading: Icon(Icons.help_center),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("Logout"),
                    leading: Icon(Icons.exit_to_app),
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Developed by ABDELHAK KHERFI "),
              )
            ],
          ),
        ),
        appBar: AppBar(
          actions: [],
          title: Text("Home"),
          backgroundColor: appbarblue,
        ),
        body: GridView(
            children: [
              GridTile(
                  child:
                      Image(image: AssetImage('lib/assets/imgs/contable.png'))),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ClientLst()));
                },
                child: GridTile(
                    child: Stack(
                  children: [
                    Positioned(
                      top: 1,
                      bottom: 1,
                      left: 1,
                      right: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image(
                            image: AssetImage('lib/assets/imgs/6009864.png')),
                      ),
                    ),
                  ],
                )),
              ),
              GridTile(
                  child: Icon(
                Icons.currency_exchange,
                size: 150,
              )),
            ],
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 33)),
      ),
    );
  }
}
