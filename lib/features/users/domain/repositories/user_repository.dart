import '../entities/user.dart';

abstract class UserRepository {
  Future<List<User>> getUsers({int page = 1});
  Future<User> createUser({required String name, required String job});
  Future<User> updateUser({required int id, required String name, required String job});
  Future<void> deleteUser({required int id});
}
