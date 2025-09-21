import 'package:flutter/material.dart';
import '../../domain/entities/profile.dart';
import '../../domain/usecases/get_profile.dart';
import '../../domain/usecases/save_profile.dart';

class ProfileProvider extends ChangeNotifier {
  final GetProfile getProfileUsecase;
  final SaveProfile saveProfileUsecase;

  Profile? _profile;
  bool _isLoading = false;
  String? _errorMessage;

  ProfileProvider({
    required this.getProfileUsecase,
    required this.saveProfileUsecase,
  });

  Profile? get profile => _profile;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> loadProfile() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _profile = await getProfileUsecase();
    } catch (e) {
      _errorMessage = 'Failed to load profile';
      _profile = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> saveProfile(Profile profile) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await saveProfileUsecase(profile);
      _profile = profile;
    } catch (e) {
      _errorMessage = 'Failed to save profile';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _profile = null;
    notifyListeners();
  }
}
