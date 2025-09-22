 
import 'package:workmate/features/no_network/data/datasources/check_connectivity.dart';
import 'package:workmate/features/no_network/data/repositories/connectivity_repository.dart';

class ConnectivityRepositoryImpl implements ConnectivityRepository {
  final ConnectivityService service;

  ConnectivityRepositoryImpl({required this.service});

  @override
  Future<bool> isConnected() async {
    return await service.isConnected();
  }
}