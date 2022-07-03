import 'package:flutter/material.dart';
import 'package:hackathon_fiap_mobile/screens/claims_screen.dart';
import 'package:hackathon_fiap_mobile/screens/form_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String id = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Bem vindo,'),
          ),
          body: Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
            Container(
              margin: EdgeInsets.all(25),
              child: FlatButton(
                child: Text("Listar Reclamações", style: TextStyle(fontSize: 35.0),),
                color: Colors.redAccent,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                onPressed: () {
                  Navigator.pushNamed(context, ClaimsScreen.id);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: FlatButton(
                child: Text('Cadastrar Reclamação', style: TextStyle(fontSize: 35.0),),
                color: Colors.blueAccent,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                onPressed: () {
                  Navigator.pushNamed(context, FormScreen.id);
                },
              ),
            ),
          ]
          ))
      ),
    );
  }
}