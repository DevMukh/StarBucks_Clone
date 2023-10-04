import 'package:card_swiper/card_swiper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:transparentcard/widget/cartDetail.dart';

import 'ItemListScreen.dart';
class Cart extends StatefulWidget {
  String previciousSum;
  int Tprice;
  int total_Count;
  String name;
  String image;
  Cart(
      {Key? mykey,
      required this.previciousSum,
      required this.Tprice,
      required this.total_Count,
      required this.name,
      required this.image})
      : super(key: mykey);
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool route =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:Colors.white,
          title: const Text(
            'Check Out',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          elevation: 0,
          centerTitle: true,
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
        ),
        body: Center(
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: 500,
              color: Colors.white,
              child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'My',
                          style: TextStyle(color: Colors.black, fontSize: 22),
                        ),
                        const Text(
                          'Cart List',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                        // SizedBox(
                        //   // height: MediaQuery.of(context).size.height * 0.2,
                        //   height: 200,
                        //   width: 400,
                        //   child: Swiper(
                        //     itemCount: 3,
                        //     itemBuilder: (cntx, index) {
                        //       return const MyCarouselSlider();
                        //     },
                        //     pagination: const SwiperPagination(
                        //         alignment: Alignment.bottomCenter,
                        //         builder: DotSwiperPaginationBuilder(
                        //           color: Colors.white,
                        //           activeColor: Colors.redAccent,
                        //         )), // control: const SwiperControl(),
                        //   ),
                        // ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.green.shade900,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: NetworkImage(widget.image),
                                        fit: BoxFit.fill)),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.name,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17),
                                        ),
                                        Text(
                                          'items_Price:${widget.previciousSum}\$',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 50,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Total: ${widget.Tprice}\$',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            print("pressed");
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Do you have any discount code?',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              Icon(
                                IconlyBold.filter_2,
                                color: Colors.green.shade900,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            // color: Colors.redAccent,
                            child: Column(
                              children: [
                                CartDetail(
                                  label: 'Subtotal',
                                  price: '${widget.Tprice}\$',
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                CartDetail(
                                  label: 'Selected_Item',
                                  price: '${widget.total_Count}\$',
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                CartDetail(label: 'Discount\$', price: '0.0\$'),
                                const SizedBox(
                                  height: 15,
                                ),
                                CartDetail(label: 'Delivery Fee', price: '0.0\$'),
                                SizedBox(
                                  height: 15,
                                  child: Divider(
                                    thickness: 3,
                                    color: Colors.green.shade900,
                                  ),
                                ),
                                CartDetail(
                                    label: 'Total Charges',
                                    price: '${widget.Tprice}\$'),
                                const SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.green.shade900,
                                      minimumSize:
                                          const Size.fromHeight(50), // NEW
                                    ),
                                    onPressed: () {
                                      route!=true?
                                      postingdata():CircularProgressIndicator(backgroundColor: Colors.redAccent,);
                                      },
                                    child: const Text(
                                      'Place Your Order',
                                      style: TextStyle(color: Colors.white),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ]))),
        ));
  }
   postingdata() async {
    DocumentReference reference =
    FirebaseFirestore.instance.collection('CartHistory').doc('${widget.name}');
    await reference.set({
      "total count": widget.total_Count,
      "Name of object": widget.name,
      "total sum": widget.previciousSum,
      "Total charges":widget.Tprice,
    });
    SubmittedSnack();
    Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen_StarBucks()));
    return null;
  }
   SubmittedSnack(){
    final snaks=SnackBar(content: Text("Your order has been placed"));
    ScaffoldMessenger.of(context).showSnackBar(snaks);
  }
}
