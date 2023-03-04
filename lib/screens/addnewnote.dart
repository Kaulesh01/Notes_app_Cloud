import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notesapp/screens/routes.dart';

class addNewNotes extends StatefulWidget {
  const addNewNotes({super.key});

  @override
  State<addNewNotes> createState() => _addNewNotesState();
}

class _addNewNotesState extends State<addNewNotes> {
  late String title;
  late String des;
  late String formattedDate;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    formattedDate = DateFormat('EEE , dd MMM yy').format(now);

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 236, 236, 236),
        body: SafeArea(
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 236, 236, 236),
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: color,
                  width: 1,
                ),
              ),
              constraints: const BoxConstraints(maxWidth: 388, maxHeight: 820),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  kIsWeb
                      ? Container(
                          alignment: Alignment.centerRight,
                          width: 126,
                          height: 37.33,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 41, 41, 41),
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: const [
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            padding: const EdgeInsets.only(left: 8),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.all(20),
                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: IconButton(
                                  onPressed: () {
                                    add();
                                  },
                                  icon: const Icon(
                                    Icons.save_outlined,
                                    color: Colors.black,
                                  ))))
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: TextFormField(
                      maxLength: 30,
                      decoration: const InputDecoration.collapsed(
                        hintText: "Title",
                      ),
                      style: const TextStyle(
                        fontSize: 32.0,
                        fontFamily: "lato",
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                      onChanged: (val) {
                        title = val;
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      formattedDate,
                      style: const TextStyle(
                        fontSize: 13.0,
                        fontFamily: "lato",
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.75,
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 20),
                      child: TextFormField(
                        decoration: const InputDecoration.collapsed(
                          hintText: "Note Description",
                        ),
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontFamily: "lato",
                          color: Colors.grey,
                        ),
                        onChanged: (val) {
                          des = val;
                        },
                        maxLines: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void add() {
    // save to db

    var data = {
      'title': title,
      'description': des,
      'created': formattedDate,
    };

    FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser!.uid)
        .doc()
        .set(data);

    //

    Navigator.pop(context);
  }
}
