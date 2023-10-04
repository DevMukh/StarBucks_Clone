// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_polygon/flutter_polygon.dart';
// // import 'package:fluttertoast/fluttertoast.dart';
// // import 'package:google_fonts/google_fonts.dart';
// //
// // class Polygon_Clipper extends StatefulWidget {
// //   String label;
// //   String image;
// //   Polygon_Clipper({super.key, required this.label, required this.image});
// //
// //   @override
// //   State<Polygon_Clipper> createState() => _Polygon_ClipperState();
// // }
// //
// // class _Polygon_ClipperState extends State<Polygon_Clipper> {
// //   final _streamBuilder =
// //       FirebaseFirestore.instance.collection("Polygon_Cliper").snapshots();
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return StreamBuilder(
// //       stream: _streamBuilder,
// //       builder: (context, snapshot) {
// //         if (snapshot.hasError) {
// //           return const SnackBar(
// //               content: Text('Failed to load, there was an error.'));
// //         }
// //         if (snapshot.connectionState == ConnectionState.waiting) {
// //           return const Center(
// //             child: CircularProgressIndicator(
// //               color: Colors.orange,
// //               backgroundColor: Colors.white,
// //             ),
// //           );
// //         }
// //         var docs = snapshot.data!.docs;
// //         // var docs = snapshot.data?.docs;
// //         // Wrap the ListView.builder with SingleChildScrollView for horizontal scrolling
// //         return SingleChildScrollView(
// //           scrollDirection: Axis.horizontal,
// //           child: Row(
// //             children: [
// //               for (var index = 0; index < docs.length; index++)
// //                 Padding(
// //                   padding: const EdgeInsets.all(
// //                       8.0), // Add some spacing between items
// //                   child: InkWell(
// //                     onTap: () {
// //                       fLuttertoastnotification(docs[index]['label']);
// //                     },
// //                     child: Column(
// //                       children: [
// //                         SizedBox(
// //                           height: 60,
// //                           width: 60,
// //                           child: ClipPolygon(
// //                             sides: 6,
// //                             borderRadius: 5.0,
// //                             rotate: 90.0,
// //                             boxShadows: [
// //                               PolygonBoxShadow(
// //                                 color: Colors.black,
// //                                 elevation: 1.0,
// //                               ),
// //                               PolygonBoxShadow(
// //                                 color: Colors.grey,
// //                                 elevation: 5.0,
// //                               ),
// //                             ],
// //                             child: Image(
// //                               image: NetworkImage(docs[index]['image']),
// //                               fit: BoxFit.fill,
// //                             ),
// //                           ),
// //                         ),
// //                         Text(
// //                           docs[index]['label'],
// //                           style: GoogleFonts.abel(
// //                             fontSize: 15,
// //                             color: CupertinoColors.darkBackgroundGray,
// //                             fontWeight: FontWeight.bold,
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //             ],
// //           ),
// //         );
// //       },
// //     );
// //   }
// //   void fLuttertoastnotification(String label) {
// //     Fluttertoast.showToast(
// //       msg: 'Selected $label'.toUpperCase(),
// //       toastLength: Toast.LENGTH_LONG,
// //       timeInSecForIosWeb: 2,
// //       backgroundColor: Colors.green.shade900,
// //       textColor: Colors.white,
// //       fontSize: 25,
// //       gravity: ToastGravity.CENTER,
// //     );
// //   }
// // }
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_polygon/flutter_polygon.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class Polygon_Clipper extends StatefulWidget {
//   String label;
//   String image;
//   Polygon_Clipper({super.key, required this.label, required this.image});
//
//   @override
//   State<Polygon_Clipper> createState() => _Polygon_ClipperState();
// }
//
// class _Polygon_ClipperState extends State<Polygon_Clipper> {
//   final _streamBuilder =
//   FirebaseFirestore.instance.collection("Polygon_Cliper").snapshots();
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: _streamBuilder,
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return SnackBar(
//             content: Text('Failed to load, there was an error.'),
//           );
//         }
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(
//             child: CircularProgressIndicator(
//               color: Colors.orange,
//               backgroundColor: Colors.white,
//             ),
//           );
//         }
//
//         if (!snapshot.hasData) {
//           // Handle the case when there is no data
//           return Center(
//             child: Text('No data available.'),
//           );
//         }
//
//         var docs = snapshot.data?.docs;
//         // var docs = snapshot.data!.docs;
//
//         return SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: [
//               for (var index = 0; index < docs!.length; index++)
//                 Padding(
//                   padding: const EdgeInsets.all(
//                     8.0,
//                   ),
//                   child: InkWell(
//                     onTap: () {
//                       fLuttertoastnotification(docs[index]['label']);
//                     },
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           height: 60,
//                           width: 60,
//                           child: ClipPolygon(
//                             sides: 6,
//                             borderRadius: 5.0,
//                             rotate: 90.0,
//                             boxShadows: [
//                               PolygonBoxShadow(
//                                 color: Colors.black,
//                                 elevation: 1.0,
//                               ),
//                               PolygonBoxShadow(
//                                 color: Colors.grey,
//                                 elevation: 5.0,
//                               ),
//                             ],
//                             child: Image(
//                               image: NetworkImage(docs[index]['image']),
//                               fit: BoxFit.fill,
//                             ),
//                           ),
//                         ),
//                         Text(
//                           docs[index]['label'],
//                           style: GoogleFonts.abel(
//                             fontSize: 15,
//                             color: CupertinoColors.darkBackgroundGray,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   void fLuttertoastnotification(String label) {
//     Fluttertoast.showToast(
//       msg: 'Selected $label'.toUpperCase(),
//       toastLength: Toast.LENGTH_LONG,
//       timeInSecForIosWeb: 2,
//       backgroundColor: Colors.green.shade900,
//       textColor: Colors.white,
//       fontSize: 25,
//       gravity: ToastGravity.CENTER,
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class Polygon_Clipper extends StatefulWidget {
  String label;
  String image;
  Polygon_Clipper({super.key, required this.label, required this.image});

  @override
  State<Polygon_Clipper> createState() => _Polygon_ClipperState();
}

class _Polygon_ClipperState extends State<Polygon_Clipper> {
  final _streamBuilder =
  FirebaseFirestore.instance.collection("Polygon_Cliper").snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _streamBuilder,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return SnackBar(
            content: Text('Failed to load, there was an error.'),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.orange,
              backgroundColor: Colors.white,
            ),
          );
        }

        // Handle the case when there is no data
        if (!snapshot.hasData) {
          return Center(
            child: Text('No data available.'),
          );
        }

        var docs = snapshot.data?.docs; // Use the null check operator to gracefully handle the case where the `snapshot.data` variable is null.

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (var index = 0; index < (docs?.length ?? 0); index++)
                Padding(
                  padding: const EdgeInsets.all(
                    8.0,
                  ),
                  child: InkWell(
                    onTap: () {
                      fLuttertoastnotification(docs?[index]['label']);
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: ClipPolygon(
                            sides: 6,
                            borderRadius: 5.0,
                            rotate: 90.0,
                            boxShadows: [
                              PolygonBoxShadow(
                                color: Colors.black,
                                elevation: 1.0,
                              ),
                              PolygonBoxShadow(
                                color: Colors.grey,
                                elevation: 5.0,
                              ),
                            ],
                            child: Image(
                              image: NetworkImage(docs?[index]['image']),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Text(
                          docs?[index]['label'],
                          style: GoogleFonts.abel(
                            fontSize: 15,
                            color: CupertinoColors.darkBackgroundGray,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  void fLuttertoastnotification(String label) {
    Fluttertoast.showToast(
      msg: 'Selected $label'.toUpperCase(),
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.green.shade900,
      textColor: Colors.white,
      fontSize: 25,
      gravity: ToastGravity.CENTER,
    );
  }
}