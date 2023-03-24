import 'package:flutter/material.dart';

import '../constant/txtfield.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(35),
          child: Column(
            children: [
              MyTextfld(
                textInputTypee: TextInputType.emailAddress,
                obsc: false,
                hinttxt: "enter your email:",
              ),
              SizedBox(
                height: 25,
              ),
              MyTextfld(
                textInputTypee: TextInputType.text,
                obsc: true,
                hinttxt: "enter password:",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
