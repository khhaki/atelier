import 'package:flutter/material.dart';

import '../model/comand.dart';

class detcomtwo extends StatelessWidget {
  Comand detcom;
  detcomtwo({
    Key? key,
    required this.detcom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Text(detcom.description.toString()),
      ),
    );
  }
}
