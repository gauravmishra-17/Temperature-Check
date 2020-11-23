import 'package:flutter/material.dart';
import 'package:temperature_check/services/auth_services.dart';

class SignIn extends StatelessWidget {
  AuthService _authservice = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign In",
          style: TextStyle(color: Colors.grey),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () async {
            dynamic response = await _authservice.signinAnonmously();
            print(response.runtimeType);
            Navigator.popAndPushNamed(context, '/homePage');
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Text("Sign In Anonmously"),
        ),
      ),
    );
  }
}
