import 'package:bayad/components/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bayad/components/my_textfield.dart';

//login page
class Home extends StatefulWidget{
  final Function()? onTap;
  const Home({super.key, required this.onTap});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


void signInUser() async {
  // show loading circle
  showDialog(
    context: context,
    builder: (context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, 
        password: passwordController.text,
        );
        
        //loading pop up 
        Navigator.pop(context);
        
      } on FirebaseAuthException catch (error) {

        //loading pop up 
        Navigator.pop(context);


        if (error.code == 'invalid-credential'){
          wrongEmailMessage();
        }

      }
      }

void wrongEmailMessage(){
    showDialog(
      context: context, 
      builder: (context){
        return const AlertDialog(
          title: Center(
            child: Text(
              'Incorrect credentials. Try again.')),
          );
      },);
      
    }

  
  @override
  Widget build(BuildContext context){
    return Scaffold(
    backgroundColor: const Color.fromRGBO(243,223,206,1),

    //logo
    body: SafeArea(
      child: SingleChildScrollView(
        child: Column( 
          children: <Widget>[
            const SizedBox(height:50),
            const Center(
              child: SizedBox(
                width:150,
                height: 150,
                child: Image(
                  image: AssetImage('lib/assets/bayad.png'),
                  fit:BoxFit.cover,
                )),
                ),
                const SizedBox(height:10),
                //welcome
                Text(
                    'Welcome!',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize:16,),
                    ),
          
                const SizedBox(height:25),
                //username field    
      
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
      
                const SizedBox(height:10),
                //password field
      
                MyTextField(
                  controller: passwordController,
                   hintText: 'Password',
                   obscureText: true,
                ),
      
                const SizedBox(height:10),
                //forgot password
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[600]),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height:10),
                MyButton(
                  text: "Sign in",
                  onTap: signInUser,),
                
                const SizedBox(height:15),
      
                //dont have account sign up
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                          ),
                      ),
                    ],
                  ),
                ),
                ],
      
        ),
      ),
    ),
  );
  }
}