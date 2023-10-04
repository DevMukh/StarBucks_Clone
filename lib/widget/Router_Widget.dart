import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';

class Routed_widget extends StatelessWidget {
  const Routed_widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:15,right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        const  Text('CAMPAGINS',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 22),),
          IconButton(onPressed: (){}, icon:const Icon(Icons.navigate_next,color: Colors.black,))
        ],
      ),
    );
  }
}
