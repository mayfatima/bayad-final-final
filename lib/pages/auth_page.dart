
import "package:bayad/pages/login_or_register_page.dart";
import "package:bayad/pages/login_page.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

class Auth extends StatelessWidget {
  const Auth({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (context, snapshot) {

          //user is logged in
          if(snapshot.hasData){
            return const LoginPage();
          }
          else{
          //not logged in
            return LoginOrRegisterPage(onTap: () {  },);
          } 
        },
        
        ),
    );
  }
}