import '../../data/datasources/google_auth_service.dart';
import '../entities/user.dart';

class SignIn {
  final GoogleAuthService authService;

  SignIn(this.authService);

  Future<User?> call() async {
    final account = await authService.signIn();
    if (account != null) {
      return User(
        id: account.id,
        name: account.displayName ?? '',
        email: account.email,
        photoUrl: account.photoUrl ?? '',
      );
    }
    return null;
  }
}
