import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CartHistory extends StatefulWidget {
  final name;
   CartHistory({super.key,this.name});

  @override
  State<CartHistory> createState() => _CartHistoryState();
}
class _CartHistoryState extends State<CartHistory> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History',style: TextStyle(color: Colors.black),),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true
        ,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('CartHistory').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot doc = snapshot.data!.docs[index];
                  return Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.green.shade900,
                          // width: 5,
                        )
                    ),
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        Text("Selected Item\t\t\t:"+doc['Name of object'],style: TextStyle(color: Colors.black),),
                        Text("Price of one item\t\t\t:"+doc['total sum'],style: TextStyle(color: Colors.black),),
                        Text("Total selected items\t\t\t:"+doc['total count'].toString(),style: TextStyle(color: Colors.black),),
                        Text("Total Bill\t\t\t:"+doc['Total charges'].toString(),style: TextStyle(color: Colors.black),),
                        IconButton(onPressed: () async {
                          delete();
                          print("Items pressed ");

                          }, icon: Icon(Icons.delete_forever,color: Colors.redAccent,size: 25,))
                      ],
                    ),
                  );
                });
          } else {
            return Text("No data");
          }
        },
      ),
    );
  }
  // void getData() async{
  //   await FirebaseFirestore.instance.collection("CartHistory").get().then((event) {
  //     for (var doc in event.docs) {
  //       print("${doc.id} => ${doc.data()}");
  //     }
  //   });
// here we can make function to clear history
  // }

 void delete() async{
    print(" :${widget.name}");
    var collection = FirebaseFirestore.instance.collection('CartHistory');
    var querySnapshot =
    await collection.where('Name of object', isEqualTo: widget.name).get();
    if (querySnapshot.docs.isNotEmpty) {
      var selectedDocument = querySnapshot.docs.first;
      var documentID = selectedDocument.id; // <-- Document ID
      print('this is the name of item::$documentID');
   await FirebaseFirestore.instance.collection('CartHistory').doc('$documentID').delete();
 }
}}


