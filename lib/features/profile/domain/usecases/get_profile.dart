import '../../data/datasources/local_db_service.dart';
import '../entities/profile.dart';

class GetProfile {
  final LocalDbService localDb;

  GetProfile(this.localDb);

  Future<Profile?> call() async {
    return await localDb.getProfile();
  }
}
