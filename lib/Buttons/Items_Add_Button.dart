import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparentcard/Screen/CartScreen.dart';

class Items_Counter extends StatefulWidget {
  var id;
  String price;
  String item_name;
  String image;
  Items_Counter(
      {Key? mykey,
      this.id,
      required this.price,
      required this.item_name,
      required this.image})
      : super(key: mykey);
  @override
  State<Items_Counter> createState() => _Items_CounterState();
}

class _Items_CounterState extends State<Items_Counter> {
  @override
  int amt = 0;
  int _count = 0;
  int sum = 0;
  int counter = 0;
  void _increment() {
    setState(() {
      _count++;
    });
  }

  _decrement() {
    setState(() {
      _count--;
      if (_count <= 0) {
        _count = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.green.shade900),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text('Total: $sum\$',
                            style: const TextStyle(
                                fontSize: 15.0, color: Colors.white)),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        )
                      ],
                    )),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.green.shade900,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  IconButton(
                      icon: const Icon(Icons.add, color: Colors.white),
                      onPressed: () {
                        totalAmount();
                      }),
                  Text(
                    '$_count',
                    style: const TextStyle(fontSize: 10.0, color: Colors.white),
                  ),
                  IconButton(
                      icon: const Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        lessAmount();
                      }),
                ],
              ),
            )
          ],
        ),
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Cart(
                            previciousSum: widget.price,
                            Tprice: sum,
                            total_Count: _count,
                            name: widget.item_name,
                            image: widget.image,
                          )));
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Add to cart',
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ))
      ],
    );
  }

  void totalAmount() {
    amt = int.tryParse(widget.price)!;
    if (_count <= 0) {
      _count = 0;
      sum = 0;
    }
    setState(() {
      _increment();
      sum = sum + amt;
      debugPrint(widget.price);
      debugPrint('$sum');
    });
  }

  void lessAmount() {
    setState(() {
      _decrement();
      sum = sum - amt;
      if (_count == 0) {
        sum = 0;
      }
      debugPrint('$sum');
    });
  }
}
