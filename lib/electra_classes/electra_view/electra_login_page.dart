import 'package:api_demo/electra_classes/electra_services/electra_post_service.dart';

import 'package:flutter/material.dart';

import 'electra_otp_page.dart';

class ElectraLoginPage extends StatefulWidget {
  const ElectraLoginPage({super.key});

  @override
  State<ElectraLoginPage> createState() => _ElectraLoginPageState();
}

class _ElectraLoginPageState extends State<ElectraLoginPage> {
  TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Login"), centerTitle: true),



      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          spacing: 20,
          children: [
            TextFormField(
              keyboardType: TextInputType.number,
              controller: mobileController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.call),
                hintText: "Enter Mobile Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (mobileController.text.trim().isNotEmpty) {
                  await ElectraPostService().postUser(mobileController.text);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ElectraOtpPage(mobile: mobileController.text),
                    ),
                    (route) => false,
                  );
                }
              },
              child: Text("Send OTP"),
            ),
          ],
        ),
      ),
    );
  }
}
