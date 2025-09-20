///// optional
///
///
import '../../domain/entities/user.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    String? photoUrl, // optional
  }) : super(
          photoUrl: photoUrl, // pass to the super constructor
        );

  factory UserModel.fromGoogleAccount(GoogleSignInAccount account) {
    return UserModel(
      id: account.id,
      name: account.displayName ?? '',
      email: account.email,
      photoUrl: account.photoUrl, // Google might return null
    );
  }
}
