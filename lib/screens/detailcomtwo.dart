import 'package:fltratl/screens/bigimg.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/comand.dart';

class detcomtwo extends StatefulWidget {
  Comand detcom;

  detcomtwo({
    Key? key,
    required this.detcom,
  }) : super(key: key);

  @override
  State<detcomtwo> createState() => _detcomtwoState();
}

class _detcomtwoState extends State<detcomtwo> {
  getda() async {
    /*wait FirebaseFirestore.instance
        .collection("clients")
        .doc(widget.dtcl.idcl.toString())
        .collection('cmnds')
        .doc(widget.rann)
        .set({'image': downloadUrl}, SetOptions(merge: true));*/
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                child: (widget.detcom.image == null)
                    ? Text("no image")
                    : Image.network(widget.detcom.image.toString()),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyWidget(
                                detcom: widget.detcom,
                              )));
                },
              ),
              SizedBox(
                height: 10,
              ),
              Text(widget.detcom.title.toString()),
              SizedBox(
                height: 10,
              ),
              Text(widget.detcom.description.toString()),
              Row(
                children: [
                  Text(
                    '  The order has been completed',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      Switch(
                        value: widget.detcom.frstq,
                        onChanged: (value) {
                          setState(() {
                            widget.detcom.changef();
                            FirebaseFirestore.instance
                                .collection("clients")
                                .doc(widget.detcom.sndid)
                                .collection('cmnds')
                                .doc(widget.detcom.ran)
                                .update({'frstq': value});
                          });
                        },
                        activeTrackColor: Colors.lightGreenAccent,
                        activeColor: Colors.green,
                        inactiveTrackColor: Colors.grey,
                        inactiveThumbColor: Colors.white,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('No'),
                          SizedBox(width: 20),
                          Text('Yes'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '  Order delivered:',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      Switch(
                        value: widget.detcom.scndq,
                        onChanged: (value) {
                          setState(() {
                            widget.detcom.changes();
                            FirebaseFirestore.instance
                                .collection("clients")
                                .doc(widget.detcom.sndid)
                                .collection('cmnds')
                                .doc(widget.detcom.ran)
                                .update({'scndq': value});
                          });
                        },
                        activeTrackColor: Colors.lightGreenAccent,
                        activeColor: Colors.green,
                        inactiveTrackColor: Colors.grey,
                        inactiveThumbColor: Colors.white,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('No'),
                          SizedBox(width: 20),
                          Text('Yes'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '  Order cancelled:',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      Switch(
                        value: widget.detcom.thrdq,
                        onChanged: (value) {
                          setState(() {
                            widget.detcom.changet();
                            FirebaseFirestore.instance
                                .collection("clients")
                                .doc(widget.detcom.sndid)
                                .collection('cmnds')
                                .doc(widget.detcom.ran)
                                .update({'thrdq': value});
                          });
                        },
                        activeTrackColor: Colors.lightGreenAccent,
                        activeColor: Colors.green,
                        inactiveTrackColor: Colors.grey,
                        inactiveThumbColor: Colors.white,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('No'),
                          SizedBox(width: 20),
                          Text('Yes'),
                        ],
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
