import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:workmate/core/error/failure.dart';
import 'package:workmate/features/users/domain/usecases/get_user.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/create_user.dart';
import '../../domain/usecases/update_user.dart';
import '../../domain/usecases/delete_user.dart';
 // Corrected import

class UserProvider extends ChangeNotifier {
  final GetUsers getUsersUsecase;
  final CreateUser createUserUsecase;
  final UpdateUser updateUserUsecase;
  final DeleteUser deleteUserUsecase;

  UserProvider({
    required this.getUsersUsecase,
    required this.createUserUsecase,
    required this.updateUserUsecase,
    required this.deleteUserUsecase,
  });

  List<User> _users = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<User> get users => _users;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  /// Fetch Users
  Future<void> fetchUsers({int page = 1}) async {
    log("UserProvider: Fetching users, page $page");
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _users = await getUsersUsecase(page: page);
      log("UserProvider: Users fetched successfully → ${_users.length} users");
    } on Failure catch (f) {
      _errorMessage = f.message;
      log("UserProvider: Failure while fetching users → ${f.message}");
    } catch (e, stack) {
      _errorMessage = 'Unexpected error: $e';
      log("UserProvider: Unexpected error while fetching users → $e");
      log("Stack trace: $stack");
    } finally {
      _isLoading = false;
      notifyListeners();
      log("UserProvider: fetchUsers() finished, isLoading = $_isLoading");
    }
  }

  /// Create User
  Future<void> addUser(String name, String job) async {
    log("UserProvider: Adding user → name: $name, job: $job");
    _isLoading = true;
    notifyListeners();

    try {
      final newUser = await createUserUsecase(name: name, job: job);
      _users.add(newUser);
      log("UserProvider: User added successfully → ${newUser.id}");
    } on Failure catch (f) {
      _errorMessage = f.message;
      log("UserProvider: Failure while adding user → ${f.message}");
    } catch (e, stack) {
      _errorMessage = 'Unexpected error: $e';
      log("UserProvider: Unexpected error while adding user → $e");
      log("Stack trace: $stack");
    } finally {
      _isLoading = false;
      notifyListeners();
      log("UserProvider: addUser() finished, isLoading = $_isLoading");
    }
  }

  /// Update User
  Future<void> editUser(int id, String name, String job) async {
    log("UserProvider: Updating user → id: $id, name: $name, job: $job");
    _isLoading = true;
    notifyListeners();

    try {
      final updatedUser = await updateUserUsecase(id: id, name: name, job: job);
      final index = _users.indexWhere((u) => u.id == id);
      if (index != -1) _users[index] = updatedUser;
      log("UserProvider: User updated successfully → id: $id");
    } on Failure catch (f) {
      _errorMessage = f.message;
      log("UserProvider: Failure while updating user → ${f.message}");
    } catch (e, stack) {
      _errorMessage = 'Unexpected error: $e';
      log("UserProvider: Unexpected error while updating user → $e");
      log("Stack trace: $stack");
    } finally {
      _isLoading = false;
      notifyListeners();
      log("UserProvider: editUser() finished, isLoading = $_isLoading");
    }
  }

  /// Delete User
  Future<void> removeUser(int id) async {
    log("UserProvider: Deleting user → id: $id");
    _isLoading = true;
    notifyListeners();

    try {
      await deleteUserUsecase(id: id);
      _users.removeWhere((u) => u.id == id);
      log("UserProvider: User deleted successfully → id: $id");
    } on Failure catch (f) {
      _errorMessage = f.message;
      log("UserProvider: Failure while deleting user → ${f.message}");
    } catch (e, stack) {
      _errorMessage = 'Unexpected error: $e';
      log("UserProvider: Unexpected error while deleting user → $e");
      log("Stack trace: $stack");
    } finally {
      _isLoading = false;
      notifyListeners();
      log("UserProvider: removeUser() finished, isLoading = $_isLoading");
    }
  }
}