import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text ('USERNAME'),
      ),
      body: Image.network('https://pbs.twimg.com/media/GBy419oW4AAlJQt?format=jpg&name=medium'),
    );
  }
}