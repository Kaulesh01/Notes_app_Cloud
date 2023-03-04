import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notesapp/screens/editscreen.dart';
import 'package:notesapp/screens/routes.dart';
import 'package:notesapp/screens/userscreen.dart';
import 'package:notesapp/utl/model.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'addnewnote.dart';

final user = FirebaseAuth.instance.currentUser!;

// ignore: camel_case_types
class Home_screen extends StatefulWidget {
  const Home_screen({super.key});

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance
        .collection(user.uid)
        .limit(1)
        .get()
        .then((checkSnapshot) {
      if (checkSnapshot.size == 0) {
        FirebaseFirestore.instance.collection(user.uid).doc("notes").set({
          "title": "My First Note",
          "description":
              "This is my first note.This note is created by Admin. If you want to delete this note then you can delete it by clicking on the delete button.",
          "created": "2021-08-01 12:00:00",
        });
      }
    });

    return Scaffold(
      floatingActionButtonLocation: position,
      backgroundColor: Color.fromARGB(255, 236, 236, 236),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const addNewNotes(),
            ),
          );
        },
        child: Container(
          width: 135,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.black,
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8.0,
                spreadRadius: 5.0,
                offset: Offset(2.0, 2.0), // shadow direction: bottom right
              )
            ],
          ),
          child: Row(
            children: const [
              Padding(
                padding: EdgeInsets.all(5),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                ),
              ),
              Text("Add Note",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  )),
            ],
          ),
        ),
      ),
      body: Center(
        child: SafeArea(
          child: Container(
            //here write a code to show boreder only for web
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
                                "My Notes",
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
                          child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const userscreen(),
                            ),
                          );
                        },
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
                        ),
                      )),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8.0,
                        spreadRadius: 5.0,
                        offset:
                            Offset(2.0, 2.0), // shadow direction: bottom right
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: TextField(
                        textAlign: TextAlign.center,
                        controller: searchController,
                        decoration: const InputDecoration(
                            hintText: "Search Notes", border: InputBorder.none),
                      )),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.only(right: 10),
                          child: const Icon(Icons.search),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection(FirebaseAuth.instance.currentUser!.uid)
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                            child: CircularProgressIndicator(
                          valueColor: new AlwaysStoppedAnimation<Color>(
                            Colors.blueGrey,
                          ),
                        ));
                      }
                      if (snapshot.hasData) {
                        return GridView(
                          shrinkWrap: true,
                          padding: EdgeInsets.all(10),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          children: snapshot.data!.docs
                              .map((note) => notecard(() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => editscreen(
                                            title: note['title'],
                                            description: note['description'],
                                            created: note['created'],
                                            id: note.id,
                                          ),
                                        ));
                                  }, note))
                              .toList(),
                        );
                      }
                      return Center(
                        child: Text(
                          "there's no Notes",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      );
                    },
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
