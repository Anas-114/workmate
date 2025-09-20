import '../entities/user.dart';
import '../repositories/user_repository.dart';

class GetUsers {
  final UserRepository repository;

  GetUsers(this.repository);

  Future<List<User>> call({int page = 1}) async {
    // Calls the repository, not the datasource directly
    return await repository.getUsers(page: page);
  }
}
