import 'dart:io';

import 'package:alert_dialog/alert_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/helper/custom_button.dart';
import 'package:firebase_login/helper/custom_text_field.dart';
import 'package:firebase_login/model/user_model.dart';
import 'package:firebase_login/screen/login.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}
final _auth=FirebaseAuth.instance;
File? image;
TextEditingController _emailController=TextEditingController();
TextEditingController _nameController=TextEditingController();
TextEditingController _phoneController=TextEditingController();
TextEditingController _passController=TextEditingController();
TextEditingController _confirmPassController=TextEditingController();
class _SignUpState extends State<SignUp> {

  Future pickImageFromGallery(source) async{
    final image2= await ImagePicker()
        .pickImage(source: source);
    if(image2 == null) return;
    final tempImage= File(image2.path);
    setState(() {
      image= tempImage;
    });
  }
  final _formKeySignUp
  = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKeySignUp,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: ()async{
                  alert(
                    context,
                    title: Text('Select one'),
                   // content: Text('It is fun!'),
                    textOK: Center(
                      child: Column(
                        children: [
                          InkWell(
                            onTap:(){
                              pickImageFromGallery
                                (ImageSource.camera);
                              Navigator.of(context).pop(true);
                              },
                              child:
                              Text('Take from Camera')),
                          SizedBox(height: 20,),
                          InkWell(
                              onTap:(){
                                pickImageFromGallery
                                  (ImageSource.gallery);
                                Navigator.of(context).pop(true);
                              },
                              child:
                              Text('Take from Gallery')),
                        ],
                      ),
                    ),
                  );
                 // pickImageFromGallery();
                },
                child: Container(
                  height: 100,
                  width: 100,
                  child: image==null?
                  Icon(Icons.camera_alt,size: 30,)
                  :ClipOval(
                      child: Image.file(image!,
                        fit: BoxFit.cover,
                  )),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black
                    ),
                    borderRadius: BorderRadius.circular(180),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(emailController: _emailController,
                labelText: "Email",
                hintText: "Enter your email",
                obsecureVal: false,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(emailController: _nameController,
                labelText: "Name",
                hintText: "Enter your name",
                obsecureVal: false,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(emailController: _phoneController,
                labelText: "Phone",
                hintText: "Enter your Phone Number",
                obsecureVal: false,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(emailController: _passController,
                labelText: "Password",
                hintText: "Enter Password",
                obsecureVal: true,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                emailController: _confirmPassController,
                labelText: "Confirm Password",
                hintText: "Re-enter Password",
                obsecureVal: true,
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: (){
                  signUp(
                    _emailController.text,
                      _passController.text,
                      context,_formKeySignUp);
                },
                child: CustomButton(
                  height: 50,
                  width: 300,
                  btnText: "SIGN UP",
                ),
              ),
              SizedBox(
                height: 20,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
void saveUserDetails() async{
  FirebaseFirestore firestore= FirebaseFirestore.instance;
  User? user= FirebaseAuth.instance.currentUser;

  UserModel userModel=UserModel();
  userModel.uid= user!.uid;
  userModel.name= _nameController.text;
  userModel.phone= _phoneController.text;
  userModel.email= _emailController.text;
   await firestore.collection('userInfo')
  .doc(user.uid)
  .set(userModel.toMap());
   Fluttertoast.showToast(msg: "Data Saved!");

}

void signUp(String email, String password,
    context, _formKeySignUp)async{
  if(_formKeySignUp.currentState!.validate())
    {
      await _auth.createUserWithEmailAndPassword
        (email: email, password: password)
          .then((value) => {
      Fluttertoast.showToast
      (
       //toastLength: Duration(),
          msg:"Account Created Successfully!!"),
          saveUserDetails(),
          saveImage(),
          Navigator.pushReplacement(context,
          MaterialPageRoute(builder:
             (context)=>Login()))
      }).catchError((e){
        Fluttertoast.showToast(msg: e.message);
      });
    }
}
void saveImage()async{
  User? user= FirebaseAuth.instance.currentUser;
  if(image == null) return;
  final destination= user!.uid.toString();
  final ref= FirebaseStorage
      .instance.ref(destination);
  ref.putFile(image!);
}