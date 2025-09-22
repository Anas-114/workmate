// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:workmate/features/notifications/data/datasources/push_service.dart';
// import 'package:workmate/features/users/domain/usecases/get_user.dart';

// // Providers
// import 'features/auth/presentation/providers/auth_provider.dart';
// import 'features/notifications/presentation/providers/notification_provider.dart';
// import 'features/profile/presentation/providers/profile_provider.dart';
// import 'features/users/presentation/providers/user_provider.dart';

// // Pages
// import 'features/auth/presentation/pages/login_page.dart';
// import 'features/users/presentation/pages/users_page.dart';

// // Data sources & repositories
// import 'features/auth/data/datasources/google_auth_service.dart';
// import 'features/auth/data/repositories/auth_repository_impl.dart';
// import 'features/profile/data/datasources/local_db_service.dart';
// import 'features/profile/data/repositories/profile_repository_impl.dart';
// import 'features/users/data/datasources/user_remote_datasource.dart';
// import 'features/users/data/repositories/user_repository_impl.dart';
// import 'core/network/dio_client.dart';

// // Usecases
// import 'features/auth/domain/usecases/sign_in.dart';
// import 'features/auth/domain/usecases/sign_out.dart';
// import 'features/profile/domain/usecases/get_profile.dart';
// import 'features/profile/domain/usecases/save_profile.dart';
// import 'features/users/domain/usecases/create_user.dart';
// import 'features/users/domain/usecases/update_user.dart';
// import 'features/users/domain/usecases/delete_user.dart';
// import 'features/notifications/domain/usecases/init_notifications.dart';

// void main() {
//   // Initialize data sources
//   final googleAuthService = GoogleAuthService();
//   final authRepository = AuthRepositoryImpl(googleAuthService);

//   final localDbService = LocalDbService();
//   final profileRepository = ProfileRepositoryImpl(localDbService: localDbService);

//   final dioClient = DioClient();
//   final userRemoteDataSource = UserRemoteDataSource(dioClient: dioClient);
//   final userRepository = UserRepositoryImpl(remoteDataSource: userRemoteDataSource);

//   final pushService = PushService();

//   runApp(
//     MultiProvider(
//       providers: [
//         // Auth
//         ChangeNotifierProvider(
//           create: (_) => AuthProvider(
//             signInUsecase: SignIn(authRepository),
//             signOutUsecase: SignOut(authRepository),
//           ),
//         ),
//         // Profile
//         ChangeNotifierProvider(
//           create: (_) => ProfileProvider(
//             getProfileUsecase: GetProfile(profileRepository),
//             saveProfileUsecase: SaveProfile(profileRepository),
//           ),
//         ),
//         // Users
//         ChangeNotifierProvider(
//           create: (_) => UserProvider(
//             getUsersUsecase: GetUsers(userRepository),
//             createUserUsecase: CreateUser(userRepository),
//             updateUserUsecase: UpdateUser(userRepository),
//             deleteUserUsecase: DeleteUser(userRepository),
//           ),
//         ),
//         // Notifications
//         ChangeNotifierProvider(
//           create: (_) => NotificationProvider(initNotifications: InitNotifications(pushService)),
//         ),
//       ],
//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final authProvider = Provider.of<AuthProvider>(context);

//     // Determine initial page based on auth
//     Widget homePage = const LoginPage(); // default
//     if (authProvider.isLoggedIn) {
//       homePage = const UsersPage(); // go to dashboard if logged in
//     }

//     return MaterialApp(
//       title: 'Workmate',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: homePage,
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:workmate/core/localization/app_localization.dart';
 
import 'package:workmate/core/theme/app_theme.dart';

// Pages
import 'package:workmate/features/auth/presentation/pages/login_page.dart';
import 'package:workmate/features/notifications/presentation/pages/notification_page.dart';
import 'package:workmate/features/profile/presentation/pages/profile_page.dart';
import 'package:workmate/features/users/presentation/pages/user_detail_page.dart';
 import 'package:workmate/features/users/presentation/pages/user_from_page.dart';
import 'package:workmate/features/users/presentation/pages/users_page.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workmate',
      debugShowCheckedModeBanner: false,
      theme: appTheme,

      // Localization setup for English and Hindi
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,

      // This is the named route configuration
      // The initial route is handled in main.dart with FutureBuilder
      routes: {
        '/login': (context) => const LoginPage(),
        '/users': (context) => const UsersPage(),
        '/user_form': (context) => const UserFormPage(),
        '/profile': (context) => const ProfilePage(),
        '/notifications': (context) => const NotificationPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/user_detail') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) {
              return UserDetailPage(user: args['user']);
            },
          );
        }
        return null;
      },
    );
  }
}