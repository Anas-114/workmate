import 'package:dio/dio.dart';
import 'package:workmate/core/error/failure.dart';
import 'package:workmate/core/network/dio_client.dart';
import '../models/user_model.dart';

class UserRemoteDataSource {
  final DioClient dioClient;

  UserRemoteDataSource({required this.dioClient});

  /// Get users
  Future<List<UserModel>> getUsers({int page = 1}) async {
    try {
      final response = await dioClient.client.get('users?page=$page');

      if (response.statusCode == 200) {
        final data = response.data['data'] as List;
        return data.map((json) => UserModel.fromJson(json)).toList();
      } else {
        throw ServerFailure('Server returned ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw NetworkFailure('No Internet connection');
      } else {
        throw ServerFailure(e.message ?? 'Unknown Dio error');
      }
    } catch (e) {
      throw UnknownFailure('Unexpected error: $e');
    }
  }

  /// Create user
  Future<UserModel> createUser(String name, String job) async {
    try {
      final response = await dioClient.client.post('users', data: {
        'name': name,
        'job': job,
      });

      if (response.statusCode == 201) {
        return UserModel.fromJson(response.data);
      } else {
        throw ServerFailure('Server returned ${response.statusCode}');
      }
    } on DioException catch (e) {
       throw ServerFailure('Failed to create user: ${e.message}');
    } catch (e) {
      throw ServerFailure('Failed to create user: $e');
    }
  }

  /// Update user
  Future<UserModel> updateUser(int id, String name, String job) async {
    try {
      final response = await dioClient.client.put('users/$id', data: {
        'name': name,
        'job': job,
      });

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else {
        throw ServerFailure('Server returned ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw ServerFailure('Failed to update user: ${e.message}');
    } catch (e) {
      throw ServerFailure('Failed to update user: $e');
    }
  }

  /// Delete user
  Future<void> deleteUser(int id) async {
    try {
      final response = await dioClient.client.delete('users/$id');

      if (response.statusCode != 204) {
        throw ServerFailure('Server returned ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw ServerFailure('Failed to delete user: ${e.message}');
    } catch (e) {
      throw ServerFailure('Failed to delete user: $e');
    }
  }
}