import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notesapp/screens/routes.dart';

import 'home_screen.dart';

class userscreen extends StatefulWidget {
  const userscreen({super.key});

  @override
  State<userscreen> createState() => _userscreenState();
}

class _userscreenState extends State<userscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(20),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      padding: EdgeInsets.only(left: 8),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Flexible(
                            child: Container(
                              margin: const EdgeInsets.only(left: 30),
                              height: 100,
                              alignment: Alignment.center,
                              child: const Text(
                                "Hello,",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              margin: const EdgeInsets.only(left: 30),
                              height: 100,
                              alignment: Alignment.center,
                              child: Text(
                                user.displayName!,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Flexible(
                          child: Container(
                        //show userprofile picture

                        margin: const EdgeInsets.only(
                          top: 25,
                        ),
                        height: 50,
                        alignment: Alignment.centerRight,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(user.photoURL ??
                                'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80'),
                          ),
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.8),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Flexible(
                  child: InkWell(
                    onTap: () {
                      //Navigator.pushNamed(context, Routes.editprofile);
                    },
                    child: Container(
                      height: 50,
                      //padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        color: Colors.white,
                      ),

                      child: Row(
                        children: [
                          Icon(
                            Icons.verified_user_outlined,
                            color: Colors.grey,
                          ),
                          Text(
                            "Edit Profile",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: InkWell(
                    onTap: () {
                      //Navigator.pushNamed(context, Routes.editprofile);
                    },
                    child: Container(
                      height: 50,
                      //padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),

                      child: Row(
                        children: [
                          Icon(
                            Icons.settings_outlined,
                            color: Colors.grey,
                          ),
                          Text(
                            "Settings",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: InkWell(
                    onTap: () {
                      //Navigator.pushNamed(context, Routes.editprofile);
                    },
                    child: Container(
                      height: 50,
                      //padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),

                      child: Row(
                        children: [
                          Icon(
                            Icons.help_outline_rounded,
                            color: Colors.grey,
                          ),
                          Text(
                            "Help Center",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: InkWell(
                    onTap: () {
                      //Navigator.pushNamed(context, Routes.editprofile);
                    },
                    child: Container(
                      height: 50,
                      //padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),

                      child: Row(
                        children: [
                          Icon(
                            Icons.privacy_tip_outlined,
                            color: Colors.grey,
                          ),
                          Text(
                            "Legal",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: InkWell(
                    onTap: () {
                      //Navigator.pushNamed(context, Routes.editprofile);
                    },
                    child: Container(
                      height: 50,
                      //padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        color: Colors.white,
                      ),

                      child: Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: Colors.grey,
                          ),
                          Text(
                            "About",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  " v4.4551.10003",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                ),
                Spacer(),
                Flexible(
                  child: InkWell(
                    onTap: () async {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      );

                      await FirebaseAuth.instance.signOut();
                      Future.delayed(const Duration(seconds: 2), () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const routes(),
                          ),
                        );
                      });
                    },
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
                          "Sign Out",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
