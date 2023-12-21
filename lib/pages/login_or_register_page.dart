import 'package:bayad/pages/home_page.dart';
import 'package:bayad/pages/register_page.dart';
import 'package:flutter/material.dart';


class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key, required Null Function() onTap});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  
  //initially show login page
  bool showHomePage = true;

  //toggle between login and register
  void togglePages(){
    setState((){
      showHomePage = !showHomePage;
    });
  }


  @override
  Widget build(BuildContext context) {

    if (showHomePage){
      return Home(onTap: togglePages,);
    }
    else{
      return RegisterPage(
        onTap: togglePages,
      );
    }
  }
  }
