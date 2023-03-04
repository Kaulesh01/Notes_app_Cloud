import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:notesapp/screens/home_screen.dart';
import 'package:notesapp/screens/routes.dart';
import 'package:notesapp/screens/sign_up.dart';
import 'package:notesapp/utl/coustomtextfield.dart';
import 'package:provider/provider.dart';
import 'package:notesapp/utl/firebaseservice.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();
  late FocusNode textFocusNodeEmail;

  final passwordController = TextEditingController();

  @override
  void initState() {
    emailController.text = '';
    textFocusNodeEmail = FocusNode();
    super.initState();
  }

  // sign user in method
  void signUserIn() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Home_screen()),
      );
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      // WRONG EMAIL
      if (e.code == 'user-not-found') {
        // show error to user
        wrongEmailMessage();
      }

      // WRONG PASSWORD
      else if (e.code == 'wrong-password') {
        // show error to user
        wrongPasswordMessage();
      }
    }
  }

  //validate email
  String? _validateEmail(String value) {
    value = value.trim();

    if (emailController.text.isNotEmpty) {
      if (value.isEmpty) {
        return 'Email can\'t be empty';
      } else if (!value.contains(RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
        return 'Enter a correct email address';
      }
    }

    return null;
  }

  //email-already-in-use
  void emailinuse() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              'An account already exists for that email.',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  // wrong email message popup
  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              'Incorrect Email',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  // wrong password message popup
  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              'Incorrect Password',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 236, 236),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
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
                Spacer(),
                SizedBox(height: 50),
                const Flexible(
                  child: Text(
                    "Hello Again!!",
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
                const Flexible(
                  child: Text(
                    'Welcome back you\'ve been missed!',
                    style: TextStyle(
                      fontFamily: "lato",
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                coustomtextfeild(
                  controller: emailController,
                  hint: "Email",
                  textFocusNodeEmail: textFocusNodeEmail,
                ),
                SizedBox(
                  height: 10,
                ),
                coustomtextfeild_password(
                  controller: passwordController,
                  hint: "Password",
                  obscureText: true,
                ),
                Flexible(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 500, maxHeight: 50),
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 25),
                    child: TextButton(
                        onPressed: () {},
                        child: Text("Forgotten Password?",
                            style: TextStyle(
                              fontFamily: "lato",
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.right)),
                  ),
                ),
                Flexible(
                  child: InkWell(
                    onTap: () => signUserIn(),
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
                          "Sign In",
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
                            ),
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
                  height: 30,
                ),
                Flexible(child: GoogleButton()),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        'Not a member?',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontFamily: "lato",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Flexible(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Signup_screen()));
                        },
                        child: const Text(
                          'Register now',
                          style: TextStyle(
                            fontFamily: "lato",
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GoogleButton extends StatefulWidget {
  @override
  _GoogleButtonState createState() => _GoogleButtonState();
}

class _GoogleButtonState extends State<GoogleButton> {
  get error => null;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.blueGrey, width: 3),
          ),
          color: Color.fromARGB(255, 236, 236, 236)),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: Colors.blueGrey.shade100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.blueGrey, width: 3),
          ),
          elevation: 0,
        ),
        onPressed: () async {
          showDialog(
            context: context,
            builder: (context) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          );
          final provider = Provider.of<Googleprovider>(context, listen: false);
          await provider.googlesign();
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Flexible(
                child: Image(
                  image: NetworkImage(
                      "https://raw.githubusercontent.com/mitchkoko/EmailLoginLogout/main/lib/images/google.png"),
                  height: 30.0,
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: FittedBox(
                    child: Text(
                      'Continue with Google',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
