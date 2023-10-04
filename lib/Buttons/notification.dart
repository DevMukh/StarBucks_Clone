import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class notification extends StatefulWidget {
  const notification({super.key});

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
         IconButton(
            icon:const Icon(Icons.notifications),
            onPressed: () {
              setState(() {
                count = 0;
              });
            }),
        count != 0
            ?  Positioned(
                right: 11,
                top: 11,
                child: Container(
                  padding:const EdgeInsets.all(2),
                  decoration:  BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints:const BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: Text(
                    '$count',
                    style:const TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            :  Container()
      ],
    );
  }
}
