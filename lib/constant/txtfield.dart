import 'package:flutter/material.dart';

class MyTextfld extends StatelessWidget {
  bool obsc;
  String hinttxt;
  TextInputType textInputTypee;
  MyTextfld(
      {required this.hinttxt,
      required this.obsc,
      required this.textInputTypee});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputTypee,
      obscureText: obsc,
      decoration: InputDecoration(
          filled: true,
          contentPadding: EdgeInsets.all(8),
          hintText: hinttxt,
          enabledBorder: OutlineInputBorder(
            borderSide: Divider.createBorderSide(context),
          ),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
    );
  }
}
