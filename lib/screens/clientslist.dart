import 'package:fltratl/model/client.dart';
import 'package:fltratl/screens/detailclient.dart';
import 'package:fltratl/screens/detailcltwo.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class ClientLst extends StatefulWidget {
  @override
  State<ClientLst> createState() => _ClientLstState();
}

class _ClientLstState extends State<ClientLst> {
  List clnts = [];
  getData() async {
    CollectionReference clientsref =
        FirebaseFirestore.instance.collection("clients");

    QuerySnapshot clquery =
        await clientsref.orderBy('date', descending: false).get();
    var Listd = clquery.docs;

    Listd.forEach((element) {
      setState(() {
        Map elll = element.data() as Map;
        elll["id"] = element.id;

        clnts.add(elll);
      });
    });
  }

  @override
  void initState() {
    getData();

    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => detailcl()));
            },
            child: Icon(Icons.add),
          ),
          appBar: AppBar(
            actions: [Icon(Icons.abc)],
          ),
          body: ListView.builder(
            itemCount: clnts.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap: () {
                    Client cllst = Client(
                        adress: clnts[index]["adress"],
                        command: clnts[index]["command"],
                        image: clnts[index]["image"],
                        job: clnts[index]["job"],
                        name: clnts[index]["name"],
                        phone: clnts[index]["phone"],
                        idcl: clnts[index]["id"]);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => detailcltwo(
                                  detcl: cllst,
                                )));
                  },
                  child: ListTile(
                    autofocus: true,
                    leading: CircleAvatar(
                      child: Text(clnts[index]['name']
                          .toString()
                          .split('')[0]
                          .toUpperCase()),
                    ),
                    title: Text(clnts[index]['name'].toString()),
                    subtitle: Text(clnts[index]["job"]),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.call),
                          onPressed: () =>
                              launch('tel:' + clnts[index]["phone"]),
                        ),
                        IconButton(
                          icon: Icon(Icons.message),
                          onPressed: () =>
                              launch('sms:' + clnts[index]["phone"]),
                        ),
                      ],
                    ),
                  ));
            },
          )),
    );
  }
}
