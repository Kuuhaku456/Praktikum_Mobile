import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: SignUpPage(),
  ));
}

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Username:',
                style: TextStyle(fontSize: 16),
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your username',
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Gender:',
                style: TextStyle(fontSize: 16),
              ),
              const Row(
                children: [
                  Radio(
                    value: 'Male',
                    groupValue: null,
                    onChanged: null,
                  ),
                  Text('Male'),
                  Radio(
                    value: 'Female',
                    groupValue: null,
                    onChanged: null,
                  ),
                  Text('Female'),
                ],
              ),
              const SizedBox(height: 16.0),
              const Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: null,
                  ),
                  Text('Subscribe to Newsletter'),
                ],
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Tambahkan logika sign-up di sini
                },
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
