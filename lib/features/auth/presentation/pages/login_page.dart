import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workmate/core/utils/constants.dart';
import 'package:workmate/features/auth/presentation/providers/auth_provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: Center(
        child: authProvider.isLoading
            ? const CircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const FlutterLogo(size: 100),
                    const SizedBox(height: 20),
                    
                    // App Name
                    Text(
                      AppConstants.appName,
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    
                    const SizedBox(height: 8),
                    
                    // Welcome Message (bodyMedium)
                    Text(
                      'Welcome! Please sign in to continue.',
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Google Sign-In Button
                    ElevatedButton.icon(
                      onPressed: () => authProvider.login(),
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
      ),
    );
  }
}
