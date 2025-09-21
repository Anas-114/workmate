import 'package:firebase_messaging/firebase_messaging.dart';

class PushService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<void> init() async {
    // Request permission (iOS only)
    await _messaging.requestPermission();

    // Get FCM token
    String? token = await _messaging.getToken();
    print('FCM Token: $token');

    // Foreground listener
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Received message: ${message.notification?.title}');
    });
  }
}
