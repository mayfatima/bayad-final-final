import 'package:bayad/components/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bayad/components/my_textfield.dart';


class RegisterPage extends StatefulWidget{
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();



void signUpUser() async {

    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
      );
    },
  );

  //try creating a user 

    try {
      //check if password is confirmed
      if (passwordController.text == confirmPasswordController.text){
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text, 
        password: passwordController.text,
        );
        }
        //show error message if password doesnt match
        else{
        const AlertDialog(
          title: Center(
            child: Text(
              'Password dont match')),
          );
          
        }
        
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
                //confirm password field
      
                MyTextField(
                  controller: confirmPasswordController,
                   hintText: 'Confirm Password',
                   obscureText: true,
                ),
      
      
                const SizedBox(height:10),

                //sign up button
                const SizedBox(height:10),
                MyButton(
                  text:"Sign Up",
                  onTap: signUpUser),
                
                const SizedBox(height:15),
      
                //dont have account sign up
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account? ",
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          "Sign In",
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