import 'package:firebase_login/helper/custom_button.dart';
import 'package:firebase_login/helper/custom_text_field.dart';
import 'package:firebase_login/screen/login.dart';
import 'package:flutter/material.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}
final GlobalKey<FormState> _formKey= GlobalKey();
TextEditingController _emailController=TextEditingController();
TextEditingController _passController=TextEditingController();
TextEditingController _confirmPassController=TextEditingController();
class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
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
                  if(_formKey.currentState!.validate())
                    Navigator.push(context,
                        MaterialPageRoute(builder:
                            (context)=>Login()));
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
