import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/helper/custom_button.dart';
import 'package:firebase_login/helper/custom_text_field.dart';
import 'package:firebase_login/screen/home_page.dart';
import 'package:firebase_login/screen/signup.dart';
import 'package:firebase_login/utills/all_color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}
final _auth= FirebaseAuth.instance;
final GlobalKey<FormState> _formKey=
GlobalKey<FormState>();
TextEditingController _emailController=TextEditingController();
TextEditingController _passController=TextEditingController();
AllColor allColor=AllColor();
class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Icon(
              Icons.star,size: 80,color: allColor.appColor,
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
            CustomTextField(emailController: _passController,
              labelText: "Password",
              hintText: "Enter Password",
            obsecureVal: true,
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: (){
                signIn(
                  _emailController.text
                , _passController.text, context);
              },
              child: CustomButton(
                height: 50,
                width: 300,
                btnText: "LOG IN",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? ",style:
                  TextStyle( fontSize: 18),),
                InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder:
                            (context)=>SignUp()));
                  },
                  child: Text(" Sign Up",style:
                  TextStyle( fontSize: 18,
                  color: allColor.appColor),),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
void signIn(String email, String password
    ,context)async{
  if(_formKey.currentState!.validate())
    {
      await _auth.signInWithEmailAndPassword
        (email: email, password: password)
          .then((value) => {
            Fluttertoast.showToast(
              backgroundColor: Colors.green,
                msg: "Login Successful!!"),
      Navigator.push(context,
      MaterialPageRoute(builder:
      (context)=>HomePage()))
      }).catchError((e){
        Fluttertoast.showToast(
            backgroundColor: Colors.red,
            msg: "Wrong Information!!");
      });

    }
}