import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartDetail extends StatefulWidget {
  String label; var price;
   CartDetail({super.key,required this.label,required this.price});

  @override
  State<CartDetail> createState() => _CartDetailState();
}

class _CartDetailState extends State<CartDetail> {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(widget.label,
          style:const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize:12),),
      const  SizedBox(height: 20,
        ),
        Text(widget.price,
          style: TextStyle(
              color: Colors.green.shade900, fontWeight: FontWeight.bold, fontSize: 15), ),
      ],
    );
  }
}
