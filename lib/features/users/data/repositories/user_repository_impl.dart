import 'package:workmate/core/error/failure.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_remote_datasource.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<User>> getUsers({int page = 1}) async {
    try {
      return await remoteDataSource.getUsers(page: page);
    } on Failure catch (f) {
      throw f; // propagate Failure
    }
  }

  @override
  Future<User> createUser({required String name, required String job}) async {
    try {
      return await remoteDataSource.createUser(name, job);
    } on Failure catch (f) {
      throw f;
    }
  }

  @override
  Future<User> updateUser({required int id, required String name, required String job}) async {
    try {
      return await remoteDataSource.updateUser(id, name, job);
    } on Failure catch (f) {
      throw f;
    }
  }

  @override
  Future<void> deleteUser({required int id}) async {
    try {
      await remoteDataSource.deleteUser(id);
    } on Failure catch (f) {
      throw f;
    }
  }
}
