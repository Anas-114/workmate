import '../entities/user.dart';
import '../repositories/user_repository.dart';

class CreateUser {
  final UserRepository repository;

  CreateUser(this.repository);

  Future<User> call({required String name, required String job}) async {
    return await repository.createUser(name: name, job: job);
  }
}
