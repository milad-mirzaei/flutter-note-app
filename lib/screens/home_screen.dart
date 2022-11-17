import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/screens/note_read_screen.dart';
import 'package:notes_app/screens/note_write_screen.dart';
import 'package:notes_app/style/app_style.dart';
import 'package:notes_app/widgets/note_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      floatingActionButton: InkWell(
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const NoteWrite())),
        child: Container(
          width: 175,
          height: 75,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    offset: const Offset(3, 3),
                    color: Colors.pink.shade100,
                    blurRadius: 10,
                    spreadRadius: 2)
              ],
              color: const Color.fromARGB(255, 241, 167, 192),
              borderRadius: BorderRadius.circular(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.add, size: 35, color: Colors.black45),
              Text(
                "Add Note",
                style: AppStyle.mainTitle
                    .copyWith(color: Colors.black45, fontSize: 21),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.pink.shade50,
          title: Text(
            "Notes",
            style: AppStyle.mainTitle.copyWith(color: Colors.black54),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 17.0, top: 20),
            child: Text(
              "Your Recent Notes",
              style: AppStyle.mainTitle.copyWith(color: Colors.black54),
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          Expanded(
              child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("notes").snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasData) {
                return GridView(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  children: snapshot.data!.docs
                      .map((note) => NoteCard(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NoteRead(doc: note)));
                          },
                          doc: note))
                      .toList(),
                );
              }

              return Center(
                child: Text(
                  "There is no notes",
                  style: AppStyle.mainTitle.copyWith(color: Colors.white70),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
