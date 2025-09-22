// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:workmate/core/utils/constants.dart';
// import 'package:workmate/features/auth/presentation/providers/auth_provider.dart';
// import 'package:workmate/features/users/presentation/pages/users_page.dart';

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<AuthProvider>(
//       builder: (context, auth, child) {
//         // Automatically navigate if logged in
//         if (auth.isLoggedIn) {
//           WidgetsBinding.instance.addPostFrameCallback((_) async {
//             try {
//               log("LoginPage: user is logged in → navigating to UsersPage");
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (_) => const UsersPage()),
//               );
//             } catch (e, stack) {
//               log("LoginPage: navigation error → $e");
//               log(stack.toString());
//             }
//           });
//         }

//         return Scaffold(
//           body: Center(
//             child: auth.isLoading
//                 ? const CircularProgressIndicator()
//                 : Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const FlutterLogo(size: 100),
//                         const SizedBox(height: 20),

//                         // App Name
//                         Text(
//                           AppConstants.appName,
//                           style: Theme.of(context).textTheme.titleLarge,
//                           textAlign: TextAlign.center,
//                         ),

//                         const SizedBox(height: 8),

//                         // Welcome Message
//                         Text(
//                           'Welcome! Please sign in to continue.',
//                           style: Theme.of(context).textTheme.bodyMedium,
//                           textAlign: TextAlign.center,
//                         ),

//                         const SizedBox(height: 40),

//                         // Google Sign-In Button
//                         ElevatedButton.icon(
//                           onPressed: () async {
//                             try {
//                               log("LoginPage: Google Sign-In button pressed");
//                               await auth.login();
//                               log("LoginPage: login completed successfully");
//                             } catch (e, stack) {
//                               log("LoginPage: login failed → $e");
//                               log(stack.toString());
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(
//                                   content: Text("Login failed: $e"),
//                                   backgroundColor: Colors.red,
//                                 ),
//                               );
//                             }
//                           },
//                           icon: Image.asset(
//                             'assets/google_logo.png',
//                             height: 24,
//                           ),
//                           label: const Text('Sign in with Google'),
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.white,
//                             foregroundColor: Colors.black,
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 24,
//                               vertical: 12,
//                             ),
//                             textStyle: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//           ),
//         );
//       },
//     );
//   }
// }


import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workmate/core/utils/constants.dart';
import 'package:workmate/features/auth/presentation/providers/auth_provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthProvider>(
        builder: (context, auth, child) {
          return Center(
            child: auth.isLoading
                ? const CircularProgressIndicator()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const FlutterLogo(size: 100),
                        const SizedBox(height: 20),
                        Text(
                          AppConstants.appName,
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Welcome! Please sign in to continue.',
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 40),
                        ElevatedButton.icon(
                          onPressed: () async {
                            try {
                              log("LoginPage: Google Sign-In button pressed");
                              await auth.login();
                              log("LoginPage: login completed successfully");
                            } catch (e, stack) {
                              log("LoginPage: login failed → $e");
                              log(stack.toString());
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Login failed: $e"),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                          icon: Image.asset(
                            'assets/google_logo.png',
                            height: 24,
                          ),
                          label: const Text('Sign in with Google'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}