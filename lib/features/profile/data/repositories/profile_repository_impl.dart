import 'package:workmate/features/profile/data/models/profile_repository.dart';
import '../../domain/entities/profile.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/local_db_service.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final LocalDbService localDbService;

  ProfileRepositoryImpl({required this.localDbService});

  @override
  Future<Profile?> getProfile() async {
    final model = await localDbService.getProfile(); // returns ProfileModel?
    if (model == null) return null;

    return Profile(
      id: model.id,
      name: model.name,
      email: model.email,
      avatar: model.avatar, // <-- required
    );
  }

  @override
  Future<void> saveProfile(Profile profile) async {
    final model = ProfileModel(
      id: profile.id,
      name: profile.name,
      email: profile.email,
      avatar: profile.avatar, // <-- required
    );
    await localDbService.saveProfile(model);
  }
}
