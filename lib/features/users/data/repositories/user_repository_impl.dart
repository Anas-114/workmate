import 'package:workmate/core/error/failure.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_remote_datasource.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<User>> getUsers({int page = 1}) async {
    return await remoteDataSource.getUsers(page: page);
  }

  @override
  Future<User> createUser({required String name, required String job}) async {
    return await remoteDataSource.createUser(name, job);
  }

  @override
  Future<User> updateUser({required int id, required String name, required String job}) async {
    return await remoteDataSource.updateUser(id, name, job);
  }

  @override
  Future<void> deleteUser({required int id}) async {
    await remoteDataSource.deleteUser(id);
  }
}