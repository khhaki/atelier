import 'package:fltratl/auth.dart';
import 'package:fltratl/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import '../constant/colors.dart';

import '../shared/txtfield.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _emailcontroller = TextEditingController();
  final _confrmpass = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _userncontroller = TextEditingController();
  Future SignUp() async {
    if (passcnfrmd()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailcontroller.text.trim(),
          password: _passwordcontroller.text.trim());
      final User? user = FirebaseAuth.instance.currentUser;
      await user!.updateDisplayName(_userncontroller.text.trim());
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Auth()));
    }
  }

  bool passcnfrmd() {
    if (_passwordcontroller.text.trim() == _confrmpass.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 252, 252, 249),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyTextfld(
                  cntrlr: _userncontroller,
                  textInputTypee: TextInputType.text,
                  obsc: false,
                  hinttxt: "enter username:",
                ),
                SizedBox(
                  height: 25,
                ),
                MyTextfld(
                  cntrlr: _emailcontroller,
                  textInputTypee: TextInputType.text,
                  obsc: false,
                  hinttxt: "enter your email:",
                ),
                SizedBox(
                  height: 25,
                ),
                MyTextfld(
                  cntrlr: _passwordcontroller,
                  textInputTypee: TextInputType.text,
                  obsc: true,
                  hinttxt: "enter password:",
                ),
                SizedBox(
                  height: 25,
                ),
                MyTextfld(
                  cntrlr: _confrmpass,
                  textInputTypee: TextInputType.text,
                  obsc: true,
                  hinttxt: "confirm password:",
                ),
                SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Btnblue)),
                  onPressed: SignUp,
                  child: Text(
                    "Register",
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
                      "Do you have an account?",
                      style: TextStyle(fontSize: 18),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: Text(
                          "Sign in",
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
