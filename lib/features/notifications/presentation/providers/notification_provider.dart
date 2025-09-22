import 'dart:developer';

import 'package:flutter/material.dart';
import '../../domain/usecases/init_notifications.dart';

class NotificationProvider extends ChangeNotifier {
  final InitNotifications initNotifications;

  NotificationProvider({required this.initNotifications});

  bool _initialized = false;
  bool get initialized => _initialized;

  Future<void> initialize() async {
    log("NotificationProvider: Initialization started");
    try {
      await initNotifications(); // call the usecase
      _initialized = true;
      log("NotificationProvider: Initialization successful");
    } catch (e, stack) {
      log("NotificationProvider: Error during initialization → $e");
      log("Stack trace: $stack");
    } finally {
      notifyListeners();
      log("NotificationProvider: Initialization finished (notifier updated)");
    }
  }
}
