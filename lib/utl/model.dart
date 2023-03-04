import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget notecard(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 300,
      width: 200,
      padding: EdgeInsets.only(left: 10, top: 10),
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Flexible(
                child: Text(
              doc["title"],
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )),
            Icon(Icons.more_vert)
          ]),
          Flexible(
              child: Text(
            doc["description"],
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          )),
          Text(
            doc["created"],
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),
          )
        ],
      ),
    ),
  );
}
