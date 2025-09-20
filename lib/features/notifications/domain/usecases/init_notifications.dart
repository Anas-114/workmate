import '../../data/datasources/push_service.dart';

class InitNotifications {
  final PushService pushService;

  InitNotifications(this.pushService);

  Future<void> call() async {
    await pushService.init();
  }
}
