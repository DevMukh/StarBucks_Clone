import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Screen/StartedPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StarBucks',
      // home: Cart(),
      home: const StartedPage(),
      // home: const MyCard(),
    );
  }
}
/*
1.card_creation :login details with ui :: MyCard()
2.dashboard :Main Star Bucks screen
3.SignUp:screen backend and ui
4.welcom:drawer post image and content to firebase
5.cart list screen shows all the check list of items add to cart

<----------------------------------------------->
1.Bottom Navigation:have navigation bar
2.display_item_cart:jis mae end waala card nechy amout description di hoi ha
3.drawer:simplly drawer ha
4.signing with google:google ka sath sign up ka backend
<-------------------------------------------------------------------><!--
viewed item  android:name="${applicationName}"
1.like cart details of an item
2.view item detail jis mae sab item name eski price image database sy autha kr show krwa rhy hn
 */
