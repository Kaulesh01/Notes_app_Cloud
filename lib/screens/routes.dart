import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notesapp/screens/login_screen.dart';
import 'home_screen.dart';

late Color color;
late FloatingActionButtonLocation position;

class routes extends StatefulWidget {
  const routes({super.key});

  @override
  State<routes> createState() => _routesState();
}

class _routesState extends State<routes> {
  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      position = FloatingActionButtonLocation.centerFloat;
      color = Colors.black;
    } else {
      position = FloatingActionButtonLocation.endFloat;
      color = Color.fromARGB(255, 236, 236, 236);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: WillPopScope(
        onWillPop: () async => false,
        child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (contax, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Center(
                    child: CircularProgressIndicator(color: Colors.black)),
              );
            } else if (snapshot.hasData) {
              return const Home_screen();
            } else if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong'));
            } else {
              return const LoginPage();
            }
          },
        ),
      ),
    );
  }
}
