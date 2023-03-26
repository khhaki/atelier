import 'package:fltratl/model/client.dart';
import 'package:fltratl/screens/detailclient.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ClientLst extends StatefulWidget {
  const ClientLst({super.key});

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
        clnts.add(element.data());
      });
    });
  }

  List _clientsls = [];
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
              return ListTile(
                title: Text(clnts[index]['name'].toString()),
              );
            },
          )),
    );
  }

  Future getClilst() async {
    var data = await FirebaseFirestore.instance.collection('clients').get();
    setState(() {
      _clientsls = List.from(data.docs.map((doc) => Client.fromSnapshot(doc)));
    });
  }
}
