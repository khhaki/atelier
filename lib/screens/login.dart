import 'package:fltratl/screens/register.dart';
import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../shared/txtfield.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 252, 252, 249),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Btnblue)),
                  onPressed: () {},
                  child: Text(
                    "Sign in",
                    style: TextStyle(fontSize: 19),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Dont have an account?",
                      style: TextStyle(fontSize: 18),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()));
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
