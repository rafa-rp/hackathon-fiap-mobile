import 'package:flutter/material.dart';
import 'package:hackathon_fiap_mobile/screens/claims_screen.dart';
import 'package:hackathon_fiap_mobile/screens/form_screen.dart';
import 'package:hackathon_fiap_mobile/screens/home_screen.dart';
import 'package:hackathon_fiap_mobile/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hackathon Fiap Mobile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        ClaimsScreen.id: (context) => ClaimsScreen(),
        FormScreen.id: (context) => FormScreen()
      },
    );
  }
}

