import 'package:flutter/material.dart';
import '../../domain/usecases/init_notifications.dart';

class NotificationProvider extends ChangeNotifier {
  final InitNotifications initNotifications;

  NotificationProvider({required this.initNotifications});

  bool _initialized = false;
  bool get initialized => _initialized;

  Future<void> initialize() async {
    await initNotifications(); // usecase call
    _initialized = true;
    notifyListeners();
  }
}
