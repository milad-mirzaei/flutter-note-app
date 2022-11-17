// ignore_for_file: avoid_print, invalid_return_type_for_catch_error

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:notes_app/style/app_style.dart';

class NoteWrite extends StatefulWidget {
  const NoteWrite({Key? key}) : super(key: key);

  @override
  State<NoteWrite> createState() => _NoteWriteState();
}

class _NoteWriteState extends State<NoteWrite> {
  // ignore: non_constant_identifier_names
  int color_id = Random().nextInt(AppStyle.cardsColor.length);
  String date1 = DateTime.now().toString();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _mainController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String date = date1.substring(0, date1.length - 10);
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      floatingActionButton: InkWell(
        onTap: () async {
          FirebaseFirestore.instance.collection('notes').add({
            "note_title": _titleController.text,
            "creation_date": date,
            "note_content": _mainController.text,
            "color_id": color_id
          }).then((value) {
            print(value);
            Navigator.pop(context);
          }).catchError(
              (error) => print("Faild to add new Note due to $error"));
        },
        child: Container(
          width: 117,
          height: 75,
          decoration: BoxDecoration(boxShadow: const [
            BoxShadow(
                offset: Offset(3, 3),
                color: Colors.white38,
                blurRadius: 7,
                spreadRadius: 2)
          ], color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check, size: 35, color: Colors.black45),
              Text(
                "Done",
                style: AppStyle.mainTitle
                    .copyWith(color: Colors.black45, fontSize: 21),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[color_id],
        elevation: 0,
        title: Text(
          "New Note",
          style: AppStyle.mainTitle.copyWith(color: Colors.black54),
        ),
        centerTitle: true,
        leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black54,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.3),
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                date,
                style: AppStyle.dateTitle,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 7),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.6),
                  borderRadius: BorderRadius.circular(20)),
              child: TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Note Title",
                ),
                style: AppStyle.mainTitle,
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 7),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.6),
                  borderRadius: BorderRadius.circular(20)),
              child: TextField(
                controller: _mainController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Your Note ...",
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                minLines: 17,
                style: AppStyle.mainContent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
