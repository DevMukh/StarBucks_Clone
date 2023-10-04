import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:transparentcard/Screen/ItemListScreen.dart';
import 'package:transparentcard/Screen/SignUp.dart';
import 'package:transparentcard/widget/signinwithgoogle.dart';

import '../themes/theme_manager.dart';

class MyCard extends StatefulWidget {
  const MyCard({Key? key}) : super(key: key);
  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  final useremail = TextEditingController();
  TextEditingController userpass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    useremail.dispose();
    userpass.dispose();
    super.dispose();
  }
  ThemeManager _themeManager = ThemeManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Login text and image in a column
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.green.shade900,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      const Image(
                        image: AssetImage('assets/cook1.png'),
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  // TextFields and Buttons in a column
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          validator: (value) {
                            var availableValue = value ?? '';
                            if (availableValue.isEmpty) {
                              return ("Username is required");
                            }
                            if (!availableValue.contains("@") ||
                                !availableValue.endsWith("gmail.com")) {
                              return ("Username should be a valid Gmail address");
                            }
                            return null;
                          },
                          controller: useremail,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Enter Your Name',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Colors.blueGrey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Colors.greenAccent,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password is required";
                            }
                            // Perform custom password validation here
                            if (value.length < 8) {
                              return "Password must be at least 8 characters long";
                            }
                            if (!value.contains(RegExp(r'[A-Z]'))) {
                              return "Password must contain at least one uppercase letter";
                            }
                            if (!value.contains(RegExp(r'[a-z]'))) {
                              return "Password must contain at least one lowercase letter";
                            }
                            if (!value.contains(RegExp(r'[0-9]'))) {
                              return "Password must contain at least one numeric character";
                            }
                            if (!value
                                .contains(RegExp(r'[!@#\$%^&*()<>?/|}{~:]'))) {
                              return "Password must contain at least one special character";
                            }

                            return null; // Password is valid.
                          },
                          controller: userpass,
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Enter Your pass',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Colors.blueGrey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Colors.greenAccent,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green.shade900,
                            minimumSize: const Size.fromHeight(50), // NEW
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _signin();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainScreen_StarBucks(
                                    email: useremail.text,
                                  ),
                                ),
                              );
                            }
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Don\'t have an account?'),
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const SignUp(),
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    IconlyBold.add_user,
                                    color: Colors.black,
                                  ))
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // ElevatedButton(
                            //   onPressed: () {
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //         builder: (context) => const SignUp(),
                            //       ),
                            //     );
                            //   },
                            //   child: const Text('SignUp'),
                            // ),
                            const GoogleSigning(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _signin() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: useremail.text.trim(), password: userpass.text);
      _snackonsubmit();
      clrfields_with_routing();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  void _snackonsubmit() {
    final snack = SnackBar(
      content: const Text(
        'Submitted successfully',
        style: TextStyle(color: Colors.black, fontSize: 15),
      ),
      backgroundColor: Colors.lightGreen.shade300,
    );
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }

  void clrfields_with_routing() {
    userpass.clear();
    useremail.clear();
  }
}
