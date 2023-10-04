import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:transparentcard/Screen/Card_Creation.dart';
import 'package:transparentcard/widget/drawer.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  GlobalKey<FormState> formKey = GlobalKey();
  CollectionReference reference =
      FirebaseFirestore.instance.collection('shopping_list');

  String imageUrl = '';

  TextEditingController title = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController description = TextEditingController();
  List<File> _images=[];
  @override
  void dispose() {
    // TODO: implement dispose
    title.dispose();
    price.dispose();
    description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        elevation: 4,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                logout();
              },
              icon: const Icon(
                Icons.logout,
                size: 20,
                color: Colors.black,
              ))
        ],
      ),
      drawer: const Mydrawer(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: title,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'provide title',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.blueGrey)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.greenAccent),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: description,
                    keyboardType: TextInputType.text,
                    minLines: 3,
                    maxLines: 10,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'add discriptions',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.blueGrey)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.greenAccent),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: price,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'add price',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.blueGrey)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.greenAccent),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  IconButton(
                      onPressed: () async {
                         ImagePicker picker = ImagePicker();
                        XFile? file=await picker.pickImage(source: ImageSource.gallery);
                        print('${file?.path}');
                        if (file == null) {
                          return;
                        }
                        String uniqueName = DateTime.now().millisecondsSinceEpoch.toString();
                        //  take a reference to store the data in the database
                        Reference referenceRoot = FirebaseStorage.instance.ref();
                        Reference referenceDirectoryImage = referenceRoot.child('images');
                        Reference referenceUploadImage = referenceDirectoryImage.child(uniqueName);
                        try {
                          await referenceUploadImage.putFile(File(file.path));
                          imageUrl = await referenceUploadImage.getDownloadURL();
                        } catch (error) {
                          error.toString();
                        }

                      },
                      icon: const Icon(
                        IconlyBold.camera,
                        color: Colors.black,
                        size: 30,
                      )),
                  //  here is the code of image picker
                  ElevatedButton(
                      onPressed: () async {
                        if (imageUrl.isEmpty) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(content: Text('Please upload an image')));

                          return;
                        }

                        if (formKey.currentState!.validate()) {
                          String itemTitle = title.text;
                          String itemDesc = description.text;
                          String item_Amount = price.text;

                          //Create a Map of data
                          Map<String, String> dataToSend = {
                            'name': itemTitle,
                            'desc': itemDesc,
                            'amount': item_Amount,
                            'image': imageUrl,
                          };
                          //Add a new item

                            reference.add(dataToSend);
                        }
                        clrfields_with_routing();
                      },
                      child:const Text('Submit'))
                ],
              ),
            )),
      ),
    );
  }

  void logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      const snack = SnackBar(content: Text("LogOut Successfully"));
      ScaffoldMessenger.of(context).showSnackBar(snack);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MyCard()));
    } catch (error) {
      debugPrint('Failed to sign out $error');
    }
  }
   clrfields_with_routing() {
    title.clear();
    description.clear();
    price.clear();
     const SnackBar(content: Text('uploaded Successfully'));
  }
}

// final XFile? photo = await picker.pickImage(source: ImageSource.camera);
