import 'package:firebase_login/helper/custom_text_field.dart';
import 'package:flutter/material.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}
TextEditingController _emailController=TextEditingController();
TextEditingController _passController=TextEditingController();
class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomTextField(emailController: _emailController,
          labelText: "Email",),
          CustomTextField(emailController: _passController,
            labelText: "Password",)
        ],
      ),
    );
  }
}
