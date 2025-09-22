 

import 'package:workmate/features/no_network/data/repositories/connectivity_repository.dart';

class CheckConnectivity {
  final ConnectivityRepository repository;

  CheckConnectivity({required this.repository});

  Future<bool> call() async {
    return await repository.isConnected();
  }
}