import 'package:flutter/material.dart';
import 'package:hackathon_fiap_mobile/screens/claims_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String id = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //       child: InkWell(
  //         onTap: () {
  //           Navigator.pushNamed(context, ClaimsScreen.id);
  //         },
  //         borderRadius: BorderRadius.circular(16),
  //         child: Ink(
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(16),
  //             color: Colors.lightBlue,
  //           ),
  //           padding: const EdgeInsets.all(16),
  //           child: const Text(
  //             'Abir lista de reclamações',
  //             style: TextStyle(
  //               color: Colors.white,
  //               fontWeight: FontWeight.bold,
  //             )
  //           )
  //         )
  //       )
  //     )
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kindacode.com'),
      ),
      body: const Center(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: 30,
            bottom: 20,
            child: FloatingActionButton(
              heroTag: 'back',
              onPressed: () {
                Navigator.pushNamed(context, ClaimsScreen.id);
              },
              child: const Text(
                'Abir lista de reclamações',
                style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                )
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 30,
            child: FloatingActionButton(
              heroTag: 'next',
              onPressed: () {/* Do something */},
              child: const Icon(
                Icons.arrow_right,
                size: 40,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          // Add more floating buttons if you want
          // There is no limit
        ],
      ),
    );
  }

}