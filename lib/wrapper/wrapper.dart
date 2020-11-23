import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temperature_check/wrapper/home.dart';
import 'package:temperature_check/wrapper/sign_in.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    //return either home or authenticate widget
    if (user == null)
      return SignIn();
    else
      return Home();
  }
}
