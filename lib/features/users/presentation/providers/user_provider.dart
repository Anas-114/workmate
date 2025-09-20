import 'package:flutter/material.dart';
import 'package:workmate/core/error/failure.dart';
import 'package:workmate/features/users/domain/usecases/get_user.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/create_user.dart';
import '../../domain/usecases/update_user.dart';
import '../../domain/usecases/delete_user.dart';

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
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _users = await getUsersUsecase(page: page);
    } on Failure catch (f) {
      _errorMessage = f.message;
    } catch (e) {
      _errorMessage = 'Unexpected error: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Create User
  Future<void> addUser(String name, String job) async {
    _isLoading = true;
    notifyListeners();

    try {
      final newUser = await createUserUsecase(name: name, job: job);
      _users.add(newUser);
    } on Failure catch (f) {
      _errorMessage = f.message;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Update User
  Future<void> editUser(int id, String name, String job) async {
    _isLoading = true;
    notifyListeners();

    try {
      final updatedUser = await updateUserUsecase(id: id, name: name, job: job);
      final index = _users.indexWhere((u) => u.id == id);
      if (index != -1) _users[index] = updatedUser;
    } on Failure catch (f) {
      _errorMessage = f.message;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Delete User
  Future<void> removeUser(int id) async {
    _isLoading = true;
    notifyListeners();

    try {
      await deleteUserUsecase(id: id);
      _users.removeWhere((u) => u.id == id);
    } on Failure catch (f) {
      _errorMessage = f.message;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
