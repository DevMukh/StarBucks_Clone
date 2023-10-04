import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

import 'Card_Creation.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _useremail = TextEditingController();
  TextEditingController _userpass = TextEditingController();
  TextEditingController _confirmpassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _useremail.dispose();
    _userpass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/StartedAs.jpg'),
            fit: BoxFit.fill,
          )),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sign Up here....!',
                          style: TextStyle(
                              color: Colors.green.shade900,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
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
                          controller: _useremail,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            suffixIcon: const Icon(
                              Icons.alternate_email_rounded,
                              color: Colors.black,
                            ),
                            hintStyle: const TextStyle(color: Colors.white70),
                            hintText: 'Your email address',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.teal.shade400)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.teal.shade400),
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
                          controller: _userpass,
                          keyboardType: TextInputType.visiblePassword,
                          style: TextStyle(color: Colors.black),
                          // obscureText: true,
                          decoration: InputDecoration(
                            hintStyle: const TextStyle(color: Colors.white70),
                            hintText: 'Enter Your password',
                            suffixIcon: const Icon(
                              Icons.password,
                              color: Colors.black,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                     BorderSide(color: Colors.teal.shade400)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.teal.shade400),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Check your password";
                            } else if (value != _userpass.text) {
                              return "Please enter same password";
                            }
                          },
                          controller: _confirmpassword,
                          keyboardType: TextInputType.visiblePassword,
                          // obscureText: true,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            suffixIcon: const Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                            hintStyle: const TextStyle(color: Colors.white70),
                            hintText: 'Enter Your password',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.teal.shade400)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.teal.shade400),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        FlutterPwValidator(
                          controller: _userpass,
                          minLength: 8,
                          uppercaseCharCount: 1,
                          lowercaseCharCount: 1,
                          numericCharCount: 1,
                          specialCharCount: 1,
                          width: 200,
                          height: 150,
                          onSuccess: () {
                            return null; // Password is valid.
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: TextButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green.shade900,
                              minimumSize: const Size.fromHeight(50), // NEW
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Processing Data')),
                                );
                                _signup();
                              }
                            },
                            child: const Text(
                              'Register',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _routing_with_clearfields() {
    _useremail.clear();
    _userpass.clear();
    _snackonsignup();

    // Navigate to the next screen using Navigator.
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => MyCard()),
    );
  }

  void _signup() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _useremail.text.trim(), password: _userpass.text);
      _routing_with_clearfields();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void _snackonsignup() {
    final snack = SnackBar(
      content: const Text(
        'SignUp successfully',
        style: TextStyle(color: Colors.black, fontSize: 15),
      ),
      backgroundColor: Colors.lightGreen.shade300,
    );
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }
}
