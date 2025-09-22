// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:workmate/core/utils/constants.dart';
// import 'package:workmate/features/users/presentation/pages/user_from_page.dart';
 
// import '../providers/user_provider.dart';

// class UsersPage extends StatefulWidget {
//   const UsersPage({super.key});

//   @override
//   State<UsersPage> createState() => _UsersPageState();
// }

// class _UsersPageState extends State<UsersPage> {
//   @override
//   void initState() {
//     super.initState();
//     final provider = Provider.of<UserProvider>(context, listen: false);
//     provider.fetchUsers();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<UserProvider>(context);

//     return Scaffold(
//       appBar: AppBar(title: const Text(AppConstants.appName)),
//       body: provider.isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : provider.errorMessage != null
//               ? Center(child: Text(provider.errorMessage!))
//               : ListView.builder(
//                   itemCount: provider.users.length,
//                   itemBuilder: (context, index) {
//                     final user = provider.users[index];
//                     return ListTile(
//                       leading: CircleAvatar(
//                         backgroundImage: NetworkImage(user.avatar),
//                       ),
//                       title: Text(user.name),
//                       subtitle: Text(user.email),
//                       onTap: () async {
//                         await Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (_) => UserFormPage(user: user)),
//                         );
//                         // Refresh the list after returning
//                         provider.fetchUsers();
//                       },
//                     );
//                   },
//                 ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           await Navigator.push(
//             context,
//             MaterialPageRoute(builder: (_) => const UserFormPage()),
//           );
//           // Refresh the list after returning
//           provider.fetchUsers();
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:workmate/core/utils/constants.dart';
// import 'package:workmate/features/no_network/presentation/pages/no_network_page.dart';
// import 'package:workmate/features/users/presentation/pages/user_from_page.dart';
// import 'package:workmate/features/users/presentation/providers/user_provider.dart';

// class UsersPage extends StatefulWidget {
//   const UsersPage({super.key});

//   @override
//   State<UsersPage> createState() => _UsersPageState();
// }

// class _UsersPageState extends State<UsersPage> {
//   @override
//   void initState() {
//     super.initState();
//     // Fetch users when the page initializes.
//     Provider.of<UserProvider>(context, listen: false).fetchUsers();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<UserProvider>(context);

//     if (provider.isOffline) {
//       return const NoNetworkPage();
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(AppConstants.appName),
//       ),
//       body: provider.isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : provider.errorMessage != null
//               ? Center(child: Text(provider.errorMessage!))
//               : ListView.builder(
//                   itemCount: provider.users.length,
//                   itemBuilder: (context, index) {
//                     final user = provider.users[index];
//                     return ListTile(
//                       leading: CircleAvatar(
//                         backgroundImage: NetworkImage(user.avatar),
//                       ),
//                       title: Text(user.name),
//                       subtitle: Text(user.email),
//                       onTap: () async {
//                         await Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => UserFormPage(user: user),
//                           ),
//                         );
//                         provider.fetchUsers();
//                       },
//                     );
//                   },
//                 ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           await Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => const UserFormPage(),
//             ),
//           );
//           provider.fetchUsers();
//         },
//         child: const Icon(Icons.add),
//       ),



//     );
//   }

// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workmate/core/utils/constants.dart';
import 'package:workmate/features/no_network/presentation/pages/no_network_page.dart';
import 'package:workmate/features/users/presentation/pages/user_from_page.dart';
import 'package:workmate/features/users/presentation/providers/user_provider.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context, listen: false).fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context);

    if (provider.isOffline) {
      return const NoNetworkPage();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appName),
      ),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : provider.errorMessage != null
              ? Center(child: Text(provider.errorMessage!))
              : ListView.builder(
                  itemCount: provider.users.length,
                  itemBuilder: (context, index) {
                    final user = provider.users[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.avatar),
                      ),
                      title: Text(user.name),
                      subtitle: Text(user.email),
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserFormPage(user: user),
                          ),
                        );
                        provider.fetchUsers();
                      },
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const UserFormPage(),
            ),
          );
          provider.fetchUsers();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}