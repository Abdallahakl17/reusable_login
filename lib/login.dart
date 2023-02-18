// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore, avoid_print

import 'package:flutter/material.dart';
import 'package:resable/feild.dart';

var emailcontroled = TextEditingController();
var passwordcontroled = TextEditingController();
var keyfeild = GlobalKey<FormState>();
bool ispassword = true;

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  // ignore: duplicate_ignore
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: keyfeild,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('LOGIN',
                      style: TextStyle(
                          fontSize: 40.0, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 25.0,
                  ),
                  defaulttextfield(
                    controller: emailcontroled,
                    keyboardtyp: TextInputType.emailAddress,
                    label: 'email Address',
                    perfix: Icons.email,
                    vaildat: (value) {
                      if (value.isEmpty) {
                        return 'email must not be empty';
                      }
                      return null;
                    },
                    inputDecorat: InputDecoration(),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  defaulttextfield(
                    controller: passwordcontroled,
                    keyboardtyp: TextInputType.visiblePassword,
                    label: 'Password',
                    perfix: Icons.lock,
                    suffix: ispassword? Icons.visibility:Icons.visibility_off,
                    ispassword: ispassword,
                    sufixpressed: () {
                      setState(() {
                        ispassword = !ispassword;
                      });
                    },
                    vaildat: (value) {
                      if (value.isEmpty) {
                        return 'Password must not be empty';
                      }
                      return null;
                    },
                    inputDecorat: InputDecoration(),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () {
                          if (keyfeild.currentState!.validate()) {
                            print(emailcontroled.text);
                            print(passwordcontroled.text);
                          }
                        },
                        color: Colors.blue,
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('don\'t have an account ?'),
                      SizedBox(
                        width: 15.0,
                      ),
                      TextButton(onPressed: () {}, child: Text('Register'))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
