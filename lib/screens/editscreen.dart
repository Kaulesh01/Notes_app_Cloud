import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notesapp/screens/routes.dart';

final user = FirebaseAuth.instance.currentUser!;

final db = FirebaseFirestore.instance.collection(user.uid);

class editscreen extends StatefulWidget {
  final String id;
  var title;
  var description;
  var created;

  editscreen(
      {required this.id,
      required this.title,
      required this.description,
      required this.created});

  @override
  State<editscreen> createState() => _editscreenState();
}

class _editscreenState extends State<editscreen> {
  bool edit = false;
  GlobalKey<FormState> key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
                  const Spacer(),
                  edit
                      ? Container(
                          padding: const EdgeInsets.all(20),
                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      edit = false;
                                    });
                                    save();
                                  },
                                  icon: const Icon(
                                    Icons.save_outlined,
                                    color: Colors.black,
                                  ))))
                      : Container(
                          padding: const EdgeInsets.all(20),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  edit = true;
                                });
                              },
                              icon: Icon(
                                Icons.edit_outlined,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                  Container(
                    padding: EdgeInsets.only(right: 20, top: 20, bottom: 20),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        onPressed: () {
                          delete();
                        },
                        icon: Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    edit = true;
                  });
                },
                child: Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextFormField(
                    enabled: edit,
                    initialValue: widget.title,
                    maxLength: 30,
                    decoration: InputDecoration.collapsed(hintText: "Title"),
                    style: TextStyle(
                      fontSize: 32.0,
                      fontFamily: "lato",
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                    onChanged: (_val) {
                      if (_val == "") {
                        widget.title = "Untitled";
                      } else {
                        widget.title = _val;
                      }
                    },
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    edit = true;
                  });
                },
                child: Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    widget.created,
                    style: TextStyle(
                      fontSize: 13.0,
                      fontFamily: "lato",
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Flexible(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      edit = true;
                    });
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
                    child: Scrollbar(
                      //always show scrollbar
                      thickness: 5, //width of scrollbar
                      radius: Radius.circular(20), //corner radius of scrollbar
                      scrollbarOrientation: ScrollbarOrientation
                          .right, //which side to show scrollbar

                      child: TextFormField(
                        initialValue: widget.description,
                        enabled: edit,
                        decoration: InputDecoration.collapsed(
                          hintText: "Note Description",
                        ),
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: "lato",
                          color: Colors.black,
                        ),
                        onChanged: (_val) {
                          widget.description = _val;
                        },
                        validator: (_val) {
                          if (_val!.isEmpty) {
                            widget.description = "no description";
                          } else {
                            return null;
                          }
                        },
                        maxLines: 50,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  Future<void> delete() async {
    await db.doc(widget.id).delete();
    Navigator.pop(context);
  }

  Future<void> save() async {
    // TODo : showing any kind of alert that new changes have been saved
    await db.doc(widget.id).set(
      {
        'title': widget.title,
        'description': widget.description,
        'created': widget.created
      },
    );
  }
}
