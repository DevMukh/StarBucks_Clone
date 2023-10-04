import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:transparentcard/Screen/ItemListScreen.dart';

class GoogleSigning extends StatelessWidget {
  const GoogleSigning({super.key});
  signInWithGoogle() async {
    try {
      //  here we will code for sign in with Google
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      //  now authentication googleuse
      final GoogleSignInAuthentication? userAuth =
          await googleUser?.authentication;
      // create and check credentials
      final credentials = GoogleAuthProvider.credential(
        accessToken: userAuth?.accessToken,
        idToken: userAuth?.idToken,
      );
      return await FirebaseAuth.instance.signInWithCredential(credentials);

    }


    catch (error) {
      debugPrint('The google signing error message is :$error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          signInWithGoogle();
          Navigator.push(context, MaterialPageRoute(builder: (context)=> MainScreen_StarBucks()));
        },
        icon:  Icon(
          FontAwesomeIcons.google,color: Colors.green.shade400,
          size: 30,
        ));
  }
}
