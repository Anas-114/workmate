import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../../domain/entities/user.dart';

class UserFormPage extends StatefulWidget {
  final User? user;
  const UserFormPage({super.key, this.user});

  @override
  State<UserFormPage> createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  final _formKey = GlobalKey<FormState>();
  late String name;
  late String job;

  @override
  void initState() {
    super.initState();
    // Corrected initialization to pre-fill the form
    name = widget.user?.name ?? '';
    job = widget.user?.job ?? ''; // Corrected this line
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text(widget.user == null ? 'Add User' : 'Edit User')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: name,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (v) => v!.isEmpty ? 'Enter name' : null,
                onSaved: (v) => name = v!,
              ),
              TextFormField(
                initialValue: job,
                decoration: const InputDecoration(labelText: 'Job'),
                validator: (v) => v!.isEmpty ? 'Enter job' : null,
                onSaved: (v) => job = v!,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    if (widget.user == null) {
                      await provider.addUser(name, job);
                    } else {
                      await provider.editUser(widget.user!.id, name, job);
                    }

                    Navigator.pop(context);
                  }
                },
                child: Text(widget.user == null ? 'Add' : 'Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}