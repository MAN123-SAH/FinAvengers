import 'package:flutter/material.dart';
import './sign_in_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> _signup(
  BuildContext context,
  Map<String, dynamic> userData,
) async {
  final response = await http.post(
    Uri.parse('http://localhost:8000/auth/signup'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(userData),
  );

  if (response.statusCode == 200) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SignInPage()),
    );
  } else {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Signup failed')));
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _usernameController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _salaryController = TextEditingController();
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        automaticallyImplyLeading: false, // Disable back button
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextField(
              controller: _salaryController,
              decoration: const InputDecoration(labelText: 'Salary'),
            ),
            TextField(
              controller: TextEditingController(
                text:
                    _selectedDate == null
                        ? ''
                        : _selectedDate!.toLocal().toString().split(' ')[0],
              ),
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Date of Birth',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (selectedDate != null) {
                      setState(() {
                        _selectedDate = selectedDate;
                      });
                    }
                  },
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final userData = {
                  'username': _usernameController.text,
                  'name': _nameController.text,
                  'email': _emailController.text,
                  'password': _passwordController.text,
                  'dob': _selectedDate?.toIso8601String().split('T')[0],
                  'salary': double.tryParse(_salaryController.text) ?? 0.0,
                };
                await _signup(context, userData);
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
