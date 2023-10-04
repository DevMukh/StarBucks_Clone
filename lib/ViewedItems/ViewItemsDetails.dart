import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparentcard/Buttons/Items_Add_Button.dart';
import 'package:transparentcard/Buttons/notification.dart';

class ViewItems extends StatefulWidget {
  var id;
  String image;
  String item_name;
  String price;
  String description;
  ViewItems(
      {Key? mykey,
      this.id,
      required this.image,
      required this.item_name,
      required this.price,
      required this.description})
      : super(key: mykey);

  @override
  State<ViewItems> createState() => _ViewItemsState();
}

class _ViewItemsState extends State<ViewItems> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'StarBbucks',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white10,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            debugPrint('pop up pressed');
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: const [notification()],
      ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
                child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: ClipOval(
                        child: SizedBox.fromSize(
                            size: const Size.fromRadius(140), // Image radius
                            child: Image(
                                image: NetworkImage(widget.image),
                                //image get krni ha
                                fit: BoxFit.fill))))),
            Padding(
              padding: const EdgeInsets.all(25),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.item_name,
                          //ak yeh get krna ha
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          widget.price + '\$',
                          //ak amount get krni ha
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 100),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(
                          widget.description,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Items_Counter(
                      price: widget.price,
                      item_name: widget.item_name,
                      image: widget.image,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
/*
this is dead code for future use this will work but generating some errors in network image
   // String? image;
  //  String? item_name;
  //  String? price;
  // @override
  // void initState() {
  //   super.initState();
  //   getData();
  // }
  // void getData() async {
  //   final DocumentSnapshot userDocs = await FirebaseFirestore.instance
  //       .collection('items_Collections')
  //       .doc(widget.id)
  //       .get();
  //    // image = userDocs.get('image');
  //    item_name = userDocs.get('item_name');
  //    price = userDocs.get('price');
  //   print(
  //       'this is image ======>>,\n this is item name=============>$item_name,\nthis is price of an items==========>$price');
  // }
 */
