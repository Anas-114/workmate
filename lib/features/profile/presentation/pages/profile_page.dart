import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/profile_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : provider.profile == null
              ? const Center(child: Text('No Profile Found'))
              : Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(provider.profile!.avatar),
                      ),
                      const SizedBox(height: 16),
                      Text(provider.profile!.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      Text(provider.profile!.email),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () {
                          provider.logout();
                        },
                        child: const Text('Logout'),
                      )
                    ],
                  ),
                ),
    );
  }
}
