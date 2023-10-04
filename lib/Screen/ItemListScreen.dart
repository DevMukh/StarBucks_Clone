import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:transparentcard/widget/Polygon_Clipper.dart';
import 'package:transparentcard/widget/Router_Widget.dart';
import 'package:transparentcard/widget/bottom_navigation.dart';
import 'package:transparentcard/widget/Display_Items_Cards.dart';

class MainScreen_StarBucks extends StatefulWidget {
   final email;
   MainScreen_StarBucks({Key? key,this.email});

  @override
  State<MainScreen_StarBucks> createState() => _MainScreen_StarBucksState();
}

class _MainScreen_StarBucksState extends State<MainScreen_StarBucks> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: const Persistent_NavBar(),
        resizeToAvoidBottomInset: false,
        body:
        // FirebaseAuth.instance.currentUser!=null ?
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.zero,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 130,
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(50),
                        ),
                        color: Colors.green.shade900,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/StartedAs.jpg'),
                                  radius: 30,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  // '${user?.email}',
                                  'Welcome',
                                  style: GoogleFonts.abel(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Text(
                            'To StarBucks Clone' ,
                            style: GoogleFonts.abel(
                              fontSize: 19,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: 'Search here',
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.blueGrey.shade100,
                            ),
                          ),
                          suffixIcon: const Icon(IconlyLight.search),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    // Use a fixed width container for Polygon_Clipper
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Polygon_Clipper(label: '', image: ''),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Routed_widget(),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child:Display_Items(image: '', name_Items: '', price: '',),
                    ),
                  ],
                ),
              ),
            ],
          ),
        // ):
        // const   Center(child:   CircularProgressIndicator(color: Colors.deepOrange,))
      ))
    );
  }
}
