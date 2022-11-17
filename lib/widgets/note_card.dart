import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/style/app_style.dart';

Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(17.0),
      margin: EdgeInsets.all(17.0),
      decoration: BoxDecoration(
        color: AppStyle.cardsColor[doc['color_id']],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doc['note_title'],
                style: AppStyle.mainTitle,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                doc['creation_date'],
                style: AppStyle.dateTitle.copyWith(color: Colors.black54),
              ),
              SizedBox(
                height: 17,
              ),
              Text(
                doc['note_content'],
                style: AppStyle.mainContent.copyWith(color: Colors.black87),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () => delete(doc.id),
                child: Icon(
                  Icons.delete,
                  size: 33,
                  color: Colors.black54,
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

delete(String id) {
  FirebaseFirestore.instance.collection("notes").doc(id).delete();
}
