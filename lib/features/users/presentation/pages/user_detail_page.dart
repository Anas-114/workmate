import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workmate/features/users/presentation/pages/user_from_page.dart';
import '../providers/user_provider.dart';
import '../../domain/entities/user.dart';

class UserDetailPage extends StatelessWidget {
  final User user;
  const UserDetailPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // User avatar
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(user.avatar),
            ),
            const SizedBox(height: 16),
            // User name
            Text(
              user.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            // User email
            Text(user.email),
            const SizedBox(height: 40),
            // Action buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Edit button
                ElevatedButton(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => UserFormPage(user: user),
                      ),
                    );
                    // Refresh the user list after returning from the edit page
                    provider.fetchUsers();
                  },
                  child: const Text('Edit'),
                ),
                const SizedBox(width: 20),
                // Delete button
                ElevatedButton(
                  onPressed: () async {
                    await provider.removeUser(user.id);
                    // Return to the previous page
                    Navigator.pop(context);
                    // The UsersPage will refresh automatically if you implemented the fix there.
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}