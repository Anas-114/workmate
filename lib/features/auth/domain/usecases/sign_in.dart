import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class SignIn {
  final AuthRepository repository;

  SignIn(this.repository);

  Future<User?> call() async {
    return await repository.signIn();
  }
}
