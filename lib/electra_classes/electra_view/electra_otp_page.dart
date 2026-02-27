import 'package:api_demo/electra_classes/electra_services/electra_post_service.dart';
import 'package:api_demo/electra_classes/electra_view/electra_home_page.dart';
import 'package:api_demo/electra_classes/utils/app_constant.dart';
import 'package:flutter/material.dart';

class ElectraOtpPage extends StatefulWidget {
  final String mobile;

  const ElectraOtpPage({super.key, required this.mobile});

  @override
  State<ElectraOtpPage> createState() => _ElectraOtpPageState();
}

class _ElectraOtpPageState extends State<ElectraOtpPage> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("OTP Page"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          spacing: 20,
          children: [
            TextFormField(
              keyboardType: TextInputType.number,
              controller: otpController,
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
                if (otpController.text.trim().isNotEmpty) {
                  bool isVerified = await ElectraPostService().verifyUser(
                    widget.mobile,
                    otpController.text,
                    await AppConstant().getToken() as String,
                  );
                  if (isVerified) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ElectraHomePage(),
                      ),
                      (route) => false,
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Invalid Password!"),
                        duration: Duration(seconds: 3),
                      ),
                    );
                  }
                }
              },
              child: Text("Submit OTP"),
            ),
          ],
        ),
      ),
    );
  }
}
