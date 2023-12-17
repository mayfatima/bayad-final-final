import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  void signOutUser(){
    FirebaseAuth.instance.signOut();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: signOutUser, icon: const Icon(Icons.logout))
      ]),
      body: Center(child: Text('LOGGED IN AS:${user.email!}',
      style: const TextStyle(fontSize: 20),)),
    );
  }
}