import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/notification_provider.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NotificationProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: Center(
        child: provider.initialized
            ? const Text('Notifications initialized!')
            : ElevatedButton(
                onPressed: () => provider.initialize(),
                child: const Text("Init Notifications"),
              ),
      ),
    );
  }
}
