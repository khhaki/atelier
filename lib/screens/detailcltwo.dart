import 'package:fltratl/screens/clientslist.dart';
import 'package:fltratl/screens/detailcom.dart';
import 'package:fltratl/screens/detailcomtwo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../constant/colors.dart';
import '../model/client.dart';
import '../model/comand.dart';
import '../shared/txtfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class detailcltwo extends StatefulWidget {
  Client detcl;
  detailcltwo({required this.detcl});

  @override
  State<detailcltwo> createState() => _detailcltwoState();
}

class _detailcltwoState extends State<detailcltwo> {
  List comnds = [];

  getData() async {
    CollectionReference comndsref = FirebaseFirestore.instance
        .collection("clients")
        .doc(widget.detcl.idcl.toString())
        .collection('cmnds');
    QuerySnapshot cmnquery =
        await comndsref.orderBy('date', descending: false).get();
    var Listcmn = cmnquery.docs;

    Listcmn.forEach((element) {
      setState(() {
        comnds.add(element.data());
        print(comnds);
        print("=========================");
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
                  context,
                  MaterialPageRoute(
                      builder: (context) => detailcom(
                            detcl: widget.detcl,
                          )));
            },
            child: Icon(Icons.add),
          ),
          appBar: AppBar(
            title: Center(child: Text("client's comands")),
          ),
          body: ListView.builder(
            itemCount: comnds.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Comand cmlst = Comand(
                    title: comnds[index]["title"],
                    description: comnds[index]["description"],
                    image: comnds[index]["image"],
                    frstq: comnds[index]["frstq"],
                    scndq: comnds[index]["scndq"],
                    thrdq: comnds[index]["thrdq"],
                    ran: comnds[index]["rand"],
                    sndid: comnds[index]["sndid"],
                  );

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => detcomtwo(
                                detcom: cmlst,
                              )));
                },
                child: ListTile(
                  autofocus: true,
                  leading: CircleAvatar(
                    child: Text(comnds[index]["title"]
                        .toString()
                        .split('')[0]
                        .toUpperCase()),
                  ),
                  title: Text(comnds[index]['title'].toString()),
                ),
              );
            },
          )),
    );
  }
}
