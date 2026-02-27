import 'package:firebase_messaging/firebase_messaging.dart';

class AppConstant {
  Future<String?> getToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    return token;
  }
}