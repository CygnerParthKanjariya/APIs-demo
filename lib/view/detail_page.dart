import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final int id;
  final String title;
  final String body;

  const DetailPage({
    super.key,
    required this.id,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Page of ID : $id"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(title, style: TextStyle(fontSize: 25),textAlign: .center,),
            SizedBox(height: 15),
            Text(body, style: TextStyle(fontSize: 15),textAlign: .center,),
          ],
        ),
      ),
    );
  }
}
