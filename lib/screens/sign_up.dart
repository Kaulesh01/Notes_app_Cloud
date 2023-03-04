import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notesapp/screens/home_screen.dart';
import 'package:notesapp/screens/routes.dart';
import 'package:notesapp/utl/coustomtextfield.dart';

import 'login_screen.dart';

class Signup_screen extends StatefulWidget {
  const Signup_screen({super.key});

  @override
  State<Signup_screen> createState() => _Signup_screenState();
}

class _Signup_screenState extends State<Signup_screen> {
  final fullname = TextEditingController();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  void signUserUp() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return Scaffold(
          body: const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.blueGrey,
              ),
            ),
          ),
        );
      },
    );

    // try creating the user
    try {
      // check if password is confirmed
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        // if user is created, go to home screen

        final user = await FirebaseAuth.instance.currentUser;
        await user?.updateDisplayName(fullname.text);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Home_screen()),
        );
      } else {
        // show error message, passwords don't match
        showErrorMessage("Passwords don't match!");
      }
      // pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      // show error message
      showErrorMessage(e.code);
    }
  }

  // error message to user
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 236, 236, 236),
      body: SafeArea(
          child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 236, 236, 236),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: color,
              width: 1,
            ),
          ),
          constraints: BoxConstraints(maxWidth: 388, maxHeight: 820),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              kIsWeb
                  ? Container(
                      alignment: Alignment.centerRight,
                      width: 126,
                      height: 37.33,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 41, 41, 41),
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(31, 125, 114, 114),
                            offset: Offset(0, 10),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: CircleAvatar(
                            maxRadius: 5,
                            child: Image.asset("ilanadimage.png")),
                      ),
                    )
                  : const SizedBox(height: 0),
              SizedBox(
                height: 10,
              ),
              const Flexible(
                child: Text(
                  "Create Account",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: "lato",
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Flexible(
                child: Container(
                  constraints: BoxConstraints(maxWidth: 500, maxHeight: 50),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                          child: Text(
                        "Already have an account?",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "lato",
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      )),
                      Flexible(
                        child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            child: Text("Login",
                                style: TextStyle(
                                    fontFamily: "lato",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                                textAlign: TextAlign.center)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              coustomtextfeild(controller: fullname, hint: 'Full Name'),
              SizedBox(
                height: 10,
              ),
              coustomtextfeild(controller: emailController, hint: 'Email'),
              SizedBox(
                height: 10,
              ),
              coustomtextfeild(
                  controller: passwordController, hint: 'Password'),
              SizedBox(
                height: 10,
              ),
              coustomtextfeild_password(
                controller: confirmPasswordController,
                hint: "Confirm Password",
                obscureText: true,
              ),
              SizedBox(
                height: 30,
              ),
              Flexible(
                child: InkWell(
                  onTap: () => signUserUp(),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 200, maxHeight: 50),
                    //padding: const EdgeInsets.all(25),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 7, 6, 6),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: const Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        height: 2,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.white, Colors.black])),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or',
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: "lato",
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 2,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: const [Colors.black, Colors.white])),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Flexible(child: GoogleButton()),
              SizedBox(
                height: 20,
              ),
              Flexible(
                child: Container(
                  constraints: BoxConstraints(maxWidth: 500, maxHeight: 50),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          "By signing up you agree to our",
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: "lato",
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Flexible(
                        child: TextButton(
                            onPressed: () {},
                            child: Text("Terms of Service",
                                style: TextStyle(
                                  fontFamily: "lato",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.center)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
