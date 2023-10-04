// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:transparentcard/ViewedItems/ViewItemsDetails.dart';
//
// class Display_Items extends StatefulWidget {
//   late String image;
//   late String name_Items;
//   late String price;
//   Display_Items({
//     super.key,
//     required this.image,
//     required this.name_Items,
//     required this.price,
//   });
//
//   @override
//   State<Display_Items> createState() => _Display_ItemsState();
// }
//
// class _Display_ItemsState extends State<Display_Items> {
//   // final _streamBulder =  FirebaseFirestore.instance.collection('items_Collections').snapshots();
//   final _streamBulder =
//       FirebaseFirestore.instance.collection('categories').snapshots();
//   late final _fireS;
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: _streamBulder,
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return SnackBar(content: Text('${snapshot.hasError}'));
//         }
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(
//             child: CircularProgressIndicator(
//               color: Colors.orange,
//               backgroundColor: Colors.white,
//             ),
//           );
//         }
//         // var docs = snapshot.data!.docs;
//         var docs = snapshot.data?.docs??[];
//         return Padding(
//           padding: const EdgeInsets.only(left: 15),
//           child: SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: [
//                 for (var index = 0; index < docs.length; index++)
//                   InkWell(
//                     onTap: () {
//                       // getSelectedItemID(docs[index]['item_name']);
//                       getSelectedItemID(docs[index]['item_name']);
//                     },
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Container(
//                           height: 250,
//                           width: 200,
//                           margin: const EdgeInsets.only(left: 10, right: 10),
//                           decoration: BoxDecoration(
//                               color: Colors.green.shade900,
//                               borderRadius: BorderRadius.circular(12),
//                               image: DecorationImage(
//                                   image: NetworkImage(docs[index]['image']),
//                                   fit: BoxFit.fill)),
//                           // image: AssetImage(widget.image), fit: BoxFit.fill)),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Container(
//                           width: 150,
//                           height: 70,
//                           decoration: BoxDecoration(
//                             color: Colors.green.shade900,
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               // for (var index = 0; index < docs.length; index++)
//                               Text(
//                                 // widget.name_Items,
//                                 docs[index]['item_name'],
//                                 style: GoogleFonts.abel(
//                                     fontSize: 18, color: CupertinoColors.white),
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   // for (var index = 0; index < docs.length; index++)
//                                   Text(
//                                     // '${widget.price} \$',
//                                     docs[index]['price'] + '\$',
//                                     style: GoogleFonts.amarante(
//                                         fontSize: 18,
//                                         color: CupertinoColors.white,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   const SizedBox(
//                                     width: 20,
//                                   ),
//                                   const Icon(
//                                     FontAwesomeIcons.coffee,
//                                     color: Colors.white,
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         )
//                       ],
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   fLuttertoastnotification(String name_Items, String price) {
//     Fluttertoast.showToast(
//       msg: '$name_Items $price \$'.toUpperCase(),
//       toastLength: Toast.LENGTH_LONG,
//       timeInSecForIosWeb: 2,
//       backgroundColor: Colors.green.shade900,
//       textColor: Colors.white,
//       fontSize: 25,
//       gravity: ToastGravity.CENTER,
//     );
//   }
//
//   Future<void> getSelectedItemID(String name_Items) async {
//     var collection = FirebaseFirestore.instance.collection('categories');
//     var querySnapshot =
//         await collection.where('item_name', isEqualTo: name_Items).get();
//
//     if (querySnapshot.docs.isNotEmpty) {
//       var selectedDocument = querySnapshot.docs.first;
//       var documentID = selectedDocument.id; // <-- Document ID
//       String image = selectedDocument.get('image');
//       String item_name = selectedDocument.get('item_name');
//       String price = selectedDocument.get('price');
//       String description = selectedDocument.get('description');
//       //from there we can pass the id
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) => ViewItems(
//                     id: documentID,
//                     image: image,
//                     item_name: item_name,
//                     price: price,
//                     description: description,
//                   )));
//       print('The ID of the selected item $name_Items :: $documentID');
//     } else {
//       print('No item with name $name_Items found.');
//     }
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transparentcard/ViewedItems/ViewItemsDetails.dart';

class Display_Items extends StatefulWidget {
  late String image;
  late String name_Items;
  late String price;
  Display_Items({
    super.key,
    required this.image,
    required this.name_Items,
    required this.price,
  });

  @override
  State<Display_Items> createState() => _Display_ItemsState();
}

class _Display_ItemsState extends State<Display_Items> {
  final _streamBulder =
      FirebaseFirestore.instance.collection('categories').snapshots();

  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _streamBulder,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('Error: ${snapshot.error}');
          return const SnackBar(
              content: Text('Failed to load, there was an error.'));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.orange,
              backgroundColor: Colors.white,
            ),
          );
        }

        if (snapshot.data != null) {
          var docs = snapshot.data?.docs;
          return Padding(
            padding: const EdgeInsets.only(left: 15),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var index = 0; index < (docs?.length ?? 0); index++)
                    InkWell(
                      onTap: () {
                        getSelectedItemID(docs![index]['item_name']);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 250,
                            width: 200,
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              color: Colors.green.shade900,
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: NetworkImage(docs![index]['image']),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 150,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.green.shade900,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  docs[index]['item_name'],
                                  style: GoogleFonts.abel(
                                    fontSize: 18,
                                    color: CupertinoColors.white,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      docs[index]['price'] + '\$',
                                      style: GoogleFonts.amarante(
                                        fontSize: 18,
                                        color: CupertinoColors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    const Icon(
                                      FontAwesomeIcons.coffee,
                                      color: Colors.white,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                ],
              ),
            ),
          );
        } else {
          // Handle the case where snapshot.data is null
          return Center(
            child: Text('No data available'),
          );
        }
      },
    );
  }

  fLuttertoastnotification(String name_Items, String price) {
    Fluttertoast.showToast(
      msg: '$name_Items $price \$'.toUpperCase(),
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.green.shade900,
      textColor: Colors.white,
      fontSize: 25,
      gravity: ToastGravity.CENTER,
    );
  }

  Future<void> getSelectedItemID(String name_Items) async {
    var collection = FirebaseFirestore.instance.collection('categories');
    var querySnapshot =
        await collection.where('item_name', isEqualTo: name_Items).get();

    if (querySnapshot.docs.isNotEmpty) {
      var selectedDocument = querySnapshot.docs.first;
      var documentID = selectedDocument.id; // <-- Document ID
      String image = selectedDocument.get('image');
      String item_name = selectedDocument.get('item_name');
      String price = selectedDocument.get('price');
      String description = selectedDocument.get('description');

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ViewItems(
            id: documentID,
            image: image,
            item_name: item_name,
            price: price,
            description: description,
          ),
        ),
      );
      print('The ID of the selected item $name_Items :: $documentID');
    } else {
      print('No item with name $name_Items found.');
    }
  }
}
