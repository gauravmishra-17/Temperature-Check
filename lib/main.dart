import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temperature_check/services/auth_services.dart';
import 'package:temperature_check/wrapper/home.dart';
import 'package:temperature_check/wrapper/sign_in.dart';
import 'package:temperature_check/wrapper/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: '/home',
          routes: {
            '/home': (context) => Wrapper(),
            '/homePage': (context) => Home(),
            '/signIn': (context) => SignIn(),
          },
        ));
  }
}
