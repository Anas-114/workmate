import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workmate/features/notifications/data/datasources/push_service.dart';
import 'package:workmate/features/users/domain/usecases/get_user.dart';

// Providers
import 'features/auth/presentation/providers/auth_provider.dart';
import 'features/notifications/presentation/providers/notification_provider.dart';
import 'features/profile/presentation/providers/profile_provider.dart';
import 'features/users/presentation/providers/user_provider.dart';

// Usecases & services
import 'features/auth/data/datasources/google_auth_service.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/usecases/sign_in.dart';
import 'features/auth/domain/usecases/sign_out.dart';

import 'features/notifications/domain/usecases/init_notifications.dart';

import 'features/profile/data/datasources/local_db_service.dart';
import 'features/profile/data/repositories/profile_repository_impl.dart';
import 'features/profile/domain/usecases/get_profile.dart';
import 'features/profile/domain/usecases/save_profile.dart';

import 'features/users/data/datasources/user_remote_datasource.dart';
import 'features/users/data/repositories/user_repository_impl.dart';
import 'features/users/domain/usecases/create_user.dart';
import 'features/users/domain/usecases/update_user.dart';
import 'features/users/domain/usecases/delete_user.dart';
import 'core/network/dio_client.dart';

// Pages
import 'features/auth/presentation/pages/login_page.dart';
import 'features/profile/presentation/pages/profile_page.dart';
import 'features/users/presentation/pages/users_page.dart';

void main() {
  // Initialize services
  final googleAuthService = GoogleAuthService();
  final localDb = LocalDbService();
  final dioClient = DioClient(); // Your updated DioClient
  final userRemoteDataSource = UserRemoteDataSource(dioClient: dioClient);

  // Repositories
  final authRepository = AuthRepositoryImpl(googleAuthService);
  final profileRepository = ProfileRepositoryImpl(localDbService: localDb);
  final userRepository = UserRepositoryImpl(remoteDataSource: userRemoteDataSource);

  // Usecases
  final signInUsecase = SignIn(authRepository);
  final signOutUsecase = SignOut(authRepository);

  final getProfileUsecase = GetProfile(profileRepository);
  final saveProfileUsecase = SaveProfile(profileRepository);

  final getUsersUsecase = GetUsers(userRepository);
  final createUserUsecase = CreateUser(userRepository);
  final updateUserUsecase = UpdateUser(userRepository);
  final deleteUserUsecase = DeleteUser(userRepository);
  final pushService = PushService();
  final initNotificationsUsecase = InitNotifications(pushService);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(
            signInUsecase: signInUsecase,
            signOutUsecase: signOutUsecase,
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => NotificationProvider(
            initNotifications: initNotificationsUsecase,
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => ProfileProvider(
            getProfileUsecase: getProfileUsecase,
            saveProfileUsecase: saveProfileUsecase,
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => UserProvider(
            getUsersUsecase: getUsersUsecase,
            createUserUsecase: createUserUsecase,
            updateUserUsecase: updateUserUsecase,
            deleteUserUsecase: deleteUserUsecase,
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return MaterialApp(
      title: 'Workmate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: authProvider.user != null
            ? Future.value(true)
            : authProvider.login(), // Try to auto-login or check auth state
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else {
            return authProvider.isLoggedIn ? const UsersPage() : const LoginPage();
          }
        },
      ),
    );
  }
}
