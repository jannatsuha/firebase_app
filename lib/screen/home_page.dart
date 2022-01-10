import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_login/model/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
String? url;
User? user= FirebaseAuth.instance.currentUser;
UserModel userModel= UserModel();
class _HomePageState extends State<HomePage> {
  Future takeImageFromFirebase()async{
    User? user= FirebaseAuth.instance.currentUser;
    String id= user!.uid;
    final ref= FirebaseStorage.instance.ref()
    .child(id);
    url= await ref.getDownloadURL();
    setState(() {
      url;
    });

  }
  @override
  void initState() {
    super.initState();
    takeImageFromFirebase();
    FirebaseFirestore.instance
        .collection('userInfo')
    .doc(user!.uid)
    .get()
    .then((value) {
      userModel= UserModel.fromMap(value.data());
      setState(() {

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child:
              userModel.name != null?
          Column(
            children: [
              Container(
                height: 130,
                width: 130,
                child: url==null?
                CircularProgressIndicator():
                Image.network(url!),
              ),
              Text(userModel.name.toString()),
              Text(userModel.phone.toString()),
              Text(userModel.email.toString()),
            ],
          ): CircularProgressIndicator()
        ),
      ),
    );
  }
}
