import 'dart:developer';

import '../../data/datasources/push_service.dart';

class InitNotifications {
  final PushService pushService;

  InitNotifications(this.pushService);

  Future<void> call() async {
    log("InitNotifications: Initialization started");
    try {
      await pushService.init();
      log("InitNotifications: PushService initialized successfully");
    } catch (e, stack) {
      log("InitNotifications: Error initializing PushService → $e");
      log("Stack trace: $stack");
    } finally {
      log("InitNotifications: Initialization finished");
    }
  }
}
