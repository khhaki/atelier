import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  var detcom;
  MyWidget({required this.detcom});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Image.network(detcom.image.toString()),
    );
  }
}
