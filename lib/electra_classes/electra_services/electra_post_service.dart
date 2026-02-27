import 'dart:convert';

import 'package:http/http.dart' as http;

class ElectraPostService {
  String domainUrl = "https://electra-beta.redik.in/api/v2/restapi";

  Future<void> postUser(String mobile) async {
    final response = await http.post(
      Uri.parse("$domainUrl/login"),
      headers: {
        "Content-Type": "application/json",
        'Api-Key': '551ed832-e8b2-48ab-bd32-5ebd7814c634',
      },
      body: jsonEncode({"mobile": mobile, "device_id": mobile, "hash": "-"}),
    );
    print(response.body);
    if (response.statusCode == 200) {
      final user = jsonDecode(response.body);
      print("Create New User Successfully");
    } else {
      print("Failed To Create New User");
    }
  }

  Future<bool> verifyUser(String mobile, String otp, String fcmToken) async {
    final verificationResponse = await http.post(
      Uri.parse("$domainUrl/otp-verification"),
      headers: {
        "Content-Type": "application/json",
        'Api-Key': '551ed832-e8b2-48ab-bd32-5ebd7814c634',
      },
      body: jsonEncode({
        "mobile": mobile,
        "otp": otp,
        "device_id": mobile,
        "fcm_token": fcmToken,
      }),
    );
    print(verificationResponse.body);
    if (verificationResponse.statusCode == 200) {
      final verify = jsonDecode(verificationResponse.body);
      print("OTP sent Successfully");
      return true;
    } else {
      print("Failed To Create New User");
      return false;
    }
  }
}
