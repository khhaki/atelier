import 'package:flutter/material.dart';

import '../constant/colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
                    accountEmail: Text("a.a"),
                    accountName: Text("haki"),
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
                    onTap: () {},
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
      ),
    );
  }
}
