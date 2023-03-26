import 'package:flutter/material.dart';
import 'package:newloginpage/login.dart';
import 'package:newloginpage/register.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
    routes: {
      'register': (context) => SignupPage(),
      'login': (context) => LoginPage(),
    },
  ));
}