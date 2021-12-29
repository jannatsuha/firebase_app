import 'package:flutter/material.dart';
class CustomTextField extends StatefulWidget {
  TextEditingController emailController;
  String labelText;
   CustomTextField({Key? key,
     required this.emailController,
   required this.labelText})
       : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 28.0,
      left: 28),
      child: TextFormField(
        controller: widget.emailController,
        decoration: InputDecoration(
          labelText: widget.labelText,
          border: OutlineInputBorder()
        ),
      ),
    );
  }
}
