import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:transparentcard/CartHistory/OrderHistory.dart';
import 'package:transparentcard/Screen/Card_Creation.dart';

class Persistent_NavBar extends StatefulWidget {
  const Persistent_NavBar({super.key});

  @override
  State<Persistent_NavBar> createState() => _Persistent_NavBarState();
}

class _Persistent_NavBarState extends State<Persistent_NavBar> {
  // final user=FirebaseAuth.instance.currentUser;
  int index = 0;
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        useLegacyColorScheme: true,
        currentIndex: index,
        onTap: (value) {
          index = value;
          setState(() {});
        },
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Colors.green.shade900,
              label: 'Home',
              icon: Icon(
                Icons.home,
                color: index == 0 ? Colors.white : Colors.white70,
              )),
          BottomNavigationBarItem(
              backgroundColor: Colors.green.shade900,
              label: "Cart",
              icon: Icon(
                IconlyBold.add_user,
                color: index == 3 ? Colors.white : Colors.white70,
              )),
          BottomNavigationBarItem(
            backgroundColor: Colors.green.shade900,
            label: "History",
            icon: IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CartHistory()));
                  print("pressed dart mode");
                },
                icon: Icon(
                  Icons.history,
                  color: index == 3 ? Colors.white : Colors.white70,
                )),
          ),

          BottomNavigationBarItem(
              backgroundColor: Colors.green.shade900,
              label: "LogOut",
              icon: IconButton(
                  onPressed: () {
                    _logout();
                  },
                  icon: Icon(
                    IconlyBold.logout,
                    color: index == 1 ? Colors.white : Colors.white70,
                  ))),
        ]);
  }

  void _logout() async {
    await FirebaseAuth.instance.signOut();
    final snack = SnackBar(content: Text('You have been signed out '));
    ScaffoldMessenger.of(context).showSnackBar(snack);
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyCard()));
  }
}

