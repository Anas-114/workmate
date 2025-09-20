import '../entities/user.dart';
import '../repositories/user_repository.dart';

class UpdateUser {
  final UserRepository repository;

  UpdateUser(this.repository);

  Future<User> call({required int id, required String name, required String job}) async {
    return await repository.updateUser(id: id, name: name, job: job);
  }
}
