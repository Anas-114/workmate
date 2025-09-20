import 'package:workmate/features/profile/data/models/profile_repository.dart';

import '../../data/datasources/local_db_service.dart';
import '../entities/profile.dart';
 

class SaveProfile {
  final LocalDbService localDb;

  SaveProfile(this.localDb);

  Future<void> call(Profile profile) async {
    final model = ProfileModel(
      id: profile.id,
      name: profile.name,
      email: profile.email,
      avatar: profile.avatar,
    );
    await localDb.saveProfile(model);
  }
}
