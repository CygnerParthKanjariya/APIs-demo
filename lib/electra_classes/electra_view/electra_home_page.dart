import 'package:flutter/material.dart';

class ElectraHomePage extends StatefulWidget {
  const ElectraHomePage({super.key});

  @override
  State<ElectraHomePage> createState() => _ElectraHomePageState();
}

class _ElectraHomePageState extends State<ElectraHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page"), centerTitle: true),
      body: Center(
        child: Text(
          "Verification Success!!!",
          style: TextStyle(fontSize: 30, color: Colors.green),
        ),
      ),
    );
  }
}
