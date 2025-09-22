// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:workmate/features/notifications/data/datasources/push_service.dart';
// import 'package:workmate/firebase_options.dart';

// // Providers
// import 'features/auth/presentation/providers/auth_provider.dart';
// import 'features/notifications/presentation/providers/notification_provider.dart';
// import 'features/profile/presentation/providers/profile_provider.dart';
// import 'features/users/presentation/providers/user_provider.dart';

// // Usecases & services
// import 'features/auth/data/datasources/google_auth_service.dart';
// import 'features/auth/data/repositories/auth_repository_impl.dart';
// import 'features/auth/domain/usecases/sign_in.dart';
// import 'features/auth/domain/usecases/sign_out.dart';

// import 'features/notifications/domain/usecases/init_notifications.dart';

// import 'features/profile/data/datasources/local_db_service.dart';
// import 'features/profile/data/repositories/profile_repository_impl.dart';
// import 'features/profile/domain/usecases/get_profile.dart';
// import 'features/profile/domain/usecases/save_profile.dart';

// import 'features/users/data/datasources/user_remote_datasource.dart';
// import 'features/users/data/repositories/user_repository_impl.dart';
// import 'features/users/domain/usecases/create_user.dart';
// import 'features/users/domain/usecases/update_user.dart';
// import 'features/users/domain/usecases/delete_user.dart';
// import 'features/users/domain/usecases/get_user.dart';
// import 'core/network/dio_client.dart';

// // Pages
// import 'features/auth/presentation/pages/login_page.dart';
// import 'features/users/presentation/pages/users_page.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   // Initialize services
//   final googleAuthService = GoogleAuthService();
//   final localDb = LocalDbService();
//   final dioClient = DioClient();
//   final userRemoteDataSource = UserRemoteDataSource(dioClient: dioClient);

//   // Repositories
//   final authRepository = AuthRepositoryImpl(googleAuthService);
//   final profileRepository = ProfileRepositoryImpl(localDbService: localDb);
//   final userRepository = UserRepositoryImpl(remoteDataSource: userRemoteDataSource);

//   // Usecases
//   final signInUsecase = SignIn(authRepository);
//   final signOutUsecase = SignOut(authRepository);

//   final getProfileUsecase = GetProfile(profileRepository);
//   final saveProfileUsecase = SaveProfile(profileRepository);

//   final getUsersUsecase = GetUsers(userRepository);
//   final createUserUsecase = CreateUser(userRepository);
//   final updateUserUsecase = UpdateUser(userRepository);
//   final deleteUserUsecase = DeleteUser(userRepository);
//   final pushService = PushService();
//   final initNotificationsUsecase = InitNotifications(pushService);

//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (_) => AuthProvider(
//             signInUsecase: signInUsecase,
//             signOutUsecase: signOutUsecase,
//           ),
//         ),
//         ChangeNotifierProvider(
//           create: (_) => NotificationProvider(
//             initNotifications: initNotificationsUsecase,
//           ),
//         ),
//         ChangeNotifierProvider(
//           create: (_) => ProfileProvider(
//             getProfileUsecase: getProfileUsecase,
//             saveProfileUsecase: saveProfileUsecase,
//           ),
//         ),
//         ChangeNotifierProvider(
//           create: (_) => UserProvider(
//             getUsersUsecase: getUsersUsecase,
//             createUserUsecase: createUserUsecase,
//             updateUserUsecase: updateUserUsecase,
//             deleteUserUsecase: deleteUserUsecase,
//           ),
//         ),
//       ],
//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   late Future<void> _authInit;

//   @override
//   void initState() {
//     super.initState();
//     final authProvider = Provider.of<AuthProvider>(context, listen: false);

//     // Initialize auth check after first frame
// _authInit = Future.microtask(() async {
//   await authProvider.initAuth();
// });


//   }

//   @override
//   Widget build(BuildContext context) {
//     final authProvider = Provider.of<AuthProvider>(context);

//     return MaterialApp(
//       title: 'Workmate',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home:  authProvider.isLoggedIn ? const UsersPage() : const UsersPage() ,
//     );
//   }
// }





// import 'package:flutter/material.dart';
// import 'package:workmate/app.dart';

// void main (){

//   runApp(MyApp());
// }


// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }




import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workmate/features/notifications/data/datasources/push_service.dart';
import 'package:workmate/features/users/domain/usecases/get_user.dart';
import 'package:workmate/firebase_options.dart';

// Providers
import 'features/auth/presentation/providers/auth_provider.dart';
import 'features/notifications/presentation/providers/notification_provider.dart';
import 'features/profile/presentation/providers/profile_provider.dart';
import 'features/users/presentation/providers/user_provider.dart';

// Pages
import 'features/auth/presentation/pages/login_page.dart';
import 'features/users/presentation/pages/users_page.dart';

// Data sources & repositories
import 'features/auth/data/datasources/google_auth_service.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/profile/data/datasources/local_db_service.dart';
import 'features/profile/data/repositories/profile_repository_impl.dart';
import 'features/users/data/datasources/user_remote_datasource.dart';
import 'features/users/data/repositories/user_repository_impl.dart';
import 'core/network/dio_client.dart';

// Usecases
import 'features/auth/domain/usecases/sign_in.dart';
import 'features/auth/domain/usecases/sign_out.dart';
import 'features/profile/domain/usecases/get_profile.dart';
import 'features/profile/domain/usecases/save_profile.dart';
import 'features/users/domain/usecases/create_user.dart';
import 'features/users/domain/usecases/update_user.dart';
import 'features/users/domain/usecases/delete_user.dart';
 
import 'features/notifications/domain/usecases/init_notifications.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize services
  final googleAuthService = GoogleAuthService();
  final localDb = LocalDbService();
  final dioClient = DioClient();
  final userRemoteDataSource = UserRemoteDataSource(dioClient: dioClient);
  final pushService = PushService();

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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<void> _authInit;

  @override
  void initState() {
    super.initState();
    // This part is the critical fix.
    // It's crucial to call `Provider.of` with `listen: false` in initState
    // to avoid potential errors since the widget tree is not fully built yet.
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    _authInit = authProvider.initAuth();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workmate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FutureBuilder(
        future: _authInit,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // Once the auth state is determined, navigate to the correct page.
            final authProvider = Provider.of<AuthProvider>(context);
            return authProvider.isLoggedIn ? const UsersPage() : const LoginPage();
          }
          // Show a splash screen or a loading indicator while checking auth state.
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}