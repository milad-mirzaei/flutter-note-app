// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:notes_app/style/app_style.dart';

// Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc) {
//   return InkWell(
//     onTap: onTap,
//     child: Container(
//       padding: const EdgeInsets.all(17.0),
//       margin: const EdgeInsets.all(17.0),
//       decoration: BoxDecoration(
//         color: AppStyle.cardsColor[doc['color_id']],
//         borderRadius: BorderRadius.circular(30),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 doc['note_title'],
//                 style: AppStyle.mainTitle,
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               Text(
//                 doc['creation_date'],
//                 style: AppStyle.dateTitle.copyWith(color: Colors.black54),
//               ),
//               const SizedBox(
//                 height: 17,
//               ),
//               Text(
//                 doc['note_content'],
//                 style: AppStyle.mainContent.copyWith(color: Colors.black87),
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               InkWell(
//                 onTap: () => showDialog(context: context, builder: builder),
//                 child: const Icon(
//                   Icons.delete,
//                   size: 33,
//                   color: Colors.black54,
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     ),
//   );
// }

delete(String id) {
  FirebaseFirestore.instance.collection("notes").doc(id).delete();
}

class NoteCard extends StatefulWidget {
  Function() onTap;
  QueryDocumentSnapshot doc;

  NoteCard({
    Key? key,
    required this.onTap,
    required this.doc,
  }) : super(key: key);

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.all(17.0),
        margin: const EdgeInsets.all(17.0),
        decoration: BoxDecoration(
          color: AppStyle.cardsColor[widget.doc['color_id']],
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
                  height: 17,
                ),
                Text(
                  widget.doc['note_content'],
                  style: AppStyle.mainContent.copyWith(color: Colors.black87),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () => showDialog(
                      context: context,
                      barrierColor: Colors.grey.withOpacity(.2),
                      builder: (context) => Container(
                            child: Center(
                                child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 17, vertical: 25),
                              width: 357,
                              height: 157,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(3, 3),
                                        color: Colors.pink.shade100,
                                        blurRadius: 10,
                                        spreadRadius: 3)
                                  ],
                                  borderRadius: BorderRadius.circular(33),
                                  color: Colors.pink.shade200),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Are you sure to delete?",
                                    style: AppStyle.mainTitle
                                        .copyWith(color: Colors.pink.shade50),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          style: TextButton.styleFrom(
                                              backgroundColor:
                                                  Colors.white.withOpacity(.2),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 30,
                                                  vertical: 12)),
                                          child: Text(
                                            "No",
                                            style: AppStyle.mainTitle.copyWith(
                                                color: Colors.pink.shade50),
                                          )),
                                      TextButton(
                                          onPressed: () {
                                            delete(widget.doc.id);
                                            Navigator.pop(context);
                                          },
                                          style: TextButton.styleFrom(
                                              backgroundColor:
                                                  Colors.white.withOpacity(.2),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 30,
                                                  vertical: 12)),
                                          child: Text(
                                            "Yes",
                                            style: AppStyle.mainTitle.copyWith(
                                                color: Colors.pink.shade50),
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            )),
                          )
                      // builder: (context) => AlertDialog(
                      //       elevation: 0,
                      //       clipBehavior: Clip,
                      //       actionsPadding:
                      //           EdgeInsets.symmetric(horizontal: 17),
                      //       titlePadding: EdgeInsets.symmetric(
                      //           horizontal: 44, vertical: 25),
                      //       backgroundColor: Colors.pink.shade100,
                      //       title: Text(
                      //         "Are you sure to delete?",
                      //       ),
                      //       actions: [
                      //         TextButton(
                      //           onPressed: () {},
                      //           child: Text("No"),
                      //         ),
                      //         TextButton(
                      //           onPressed: () {},
                      //           child: Text("Yes"),
                      //         ),
                      //       ],
                      //     )),
                      ),
                  child: const Icon(
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
}
