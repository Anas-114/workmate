import 'package:flutter/material.dart';
import '../../domain/entities/profile.dart';
import '../../domain/usecases/get_profile.dart';
import '../../domain/usecases/save_profile.dart';

class ProfileProvider extends ChangeNotifier {
  final GetProfile getProfileUsecase;
  final SaveProfile saveProfileUsecase;

  Profile? _profile;
  bool _isLoading = false;

  ProfileProvider({
    required this.getProfileUsecase,
    required this.saveProfileUsecase,
  });

  Profile? get profile => _profile;
  bool get isLoading => _isLoading;

  Future<void> loadProfile() async {
    _isLoading = true;
    notifyListeners();

    _profile = await getProfileUsecase();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> saveProfile(Profile profile) async {
    _isLoading = true;
    notifyListeners();

    await saveProfileUsecase(profile);
    _profile = profile;

    _isLoading = false;
    notifyListeners();
  }

  Future<void> logout() async {
    _profile = null;
    notifyListeners();
  }
}
