// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/profile_provider.dart';

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<ProfileProvider>(context);

//     return Scaffold(
//       appBar: AppBar(title: const Text('Profile')),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Builder(builder: (context) {
//           if (provider.isLoading) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           if (provider.errorMessage != null) {
//             return Center(child: Text(provider.errorMessage!));
//           }

//           if (provider.profile == null) {
//             return const Center(child: Text('No Profile Found'));
//           }

//           final profile = provider.profile!;

//           return Column(
//             children: [
//               CircleAvatar(
//                 radius: 50,
//                 backgroundImage: NetworkImage(profile.avatar),
//                 onBackgroundImageError: (_, __) {},
//                 child: profile.avatar.isEmpty
//                     ? const Icon(Icons.person, size: 50)
//                     : null,
//               ),
//               const SizedBox(height: 16),
//               Text(profile.name,
//                   style: const TextStyle(
//                       fontSize: 22, fontWeight: FontWeight.bold)),
//               Text(profile.email),
//               const SizedBox(height: 40),
//               ElevatedButton(
//                 onPressed: () {
//                   provider.logout();
//                 },
//                 child: const Text('Logout'),
//               ),
//             ],
//           );
//         }),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/profile_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    // Load the profile data when the page is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProfileProvider>(context, listen: false).loadProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Builder(builder: (context) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.errorMessage != null) {
            return Center(child: Text(provider.errorMessage!));
          }

          if (provider.profile == null) {
            return const Center(child: Text('No Profile Found'));
          }

          final profile = provider.profile!;

          return Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(profile.avatar),
                onBackgroundImageError: (_, __) {},
                child: profile.avatar.isEmpty
                    ? const Icon(Icons.person, size: 50)
                    : null,
              ),
              const SizedBox(height: 16),
              Text(profile.name,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold)),
              Text(profile.email),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // The logout logic will be handled by the AuthProvider
                  // You should trigger the logout action from there.
                },
                child: const Text('Logout'),
              ),
            ],
          );
        }),
      ),
    );
  }
}