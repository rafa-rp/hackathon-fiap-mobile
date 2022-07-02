import 'package:flutter/material.dart';

class ClaimsScreen extends StatefulWidget {
  static const String id = '/claims';

  ClaimsScreen({Key? key}) : super(key: key);

  @override
  State<ClaimsScreen> createState() => _ClaimsScreenState();
}

class _ClaimsScreenState extends State<ClaimsScreen>{
  List<Claims> claimsList = [];

  @override
  void initState(){
    super.initState();

    fetchClaims();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todas Reclamações'),
      ),
    );
  }

}