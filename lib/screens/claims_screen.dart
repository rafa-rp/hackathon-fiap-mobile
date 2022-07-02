import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hackathon_fiap_mobile/models/claim.dart';
import 'package:http/http.dart';

class ClaimsScreen extends StatefulWidget {
  static const String id = '/claims';

  ClaimsScreen({Key? key}) : super(key: key);

  @override
  State<ClaimsScreen> createState() => _ClaimsScreenState();
}

class _ClaimsScreenState extends State<ClaimsScreen>{
  List<Claim> claimsList = [];

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
        body: ListView.separated(
          itemCount: claimsList.length,
          itemBuilder: (context, index) {
            final claim = claimsList[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 150,
                child: Material(
                  elevation: 8,
                  borderRadius: BorderRadius.circular(16),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                        ),
                        child: Image.network(claim.image),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              claim.title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              claim.description,
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const Divider(),
        ));
  }

  void fetchClaims() async {
    final uri = Uri.parse('https://demo7206081.mockable.io/movies');
    Response response = await Client().get(uri);

    final responseJson = jsonDecode(response.body);

    claimsList = responseJson['results']
        .map<Claim>(
          (json) => Claim(
        title: json['title'],
        author: json['author'],
        description: json['description'],
        image: json['image'],
        situation: json['situation'],
        channel: json['channel'],
        type: json['type']
      ),
    )
        .toList();

    setState(() => {});
  }
}