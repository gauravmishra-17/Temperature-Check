import 'package:flutter/material.dart';
import 'package:temperature_check/services/auth_services.dart';
import 'package:temperature_check/widgets/enter_temperature.dart';
import 'package:temperature_check/widgets/recordings.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Temperatures',
          style: TextStyle(color: Colors.grey),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          EnterTemperature(),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Recordings",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Recordings()),
          SizedBox(height: 50),
          RaisedButton(
              onPressed: () async {
                await _authService.signOut();
                Navigator.popAndPushNamed(context, '/signIn');
              },
              child: Text('Logout')),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
