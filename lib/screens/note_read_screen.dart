import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/style/app_style.dart';


// ignore: must_be_immutable
class NoteRead extends StatefulWidget {
  QueryDocumentSnapshot doc;
  NoteRead({required this.doc, Key? key}) : super(key: key);

  @override
  State<NoteRead> createState() => _NoteReadState();
}

class _NoteReadState extends State<NoteRead> {
  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    int color_id = widget.doc['color_id'];
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppStyle.cardsColor[color_id],
        leading: InkWell(
          onTap: Navigator.of(context).pop,
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black54,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.doc['note_title'],
              style: AppStyle.mainTitle,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              widget.doc['creation_date'],
              style: AppStyle.dateTitle.copyWith(color: Colors.black54),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              widget.doc['note_content'],
              style: AppStyle.mainContent,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
