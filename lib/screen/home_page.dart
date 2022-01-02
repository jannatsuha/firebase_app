import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
         // physics: ClampingScrollPhysics(),
          reverse: true,
          child: Row(
            children: [
              Container(
                width: 200,
                  height: 200,
                  color: Colors.green,
                  child: Text("Home Page 1")),
              Container(
                  width: 200,
                  height: 200,
                  color: Colors.green,
                  child: Text("Home Page")),
              Container(
                  width: 200,
                  height: 200,
                  color: Colors.green,
                  child: Text("Home Page")),
              Container(
                  width: 200,
                  height: 200,
                  color: Colors.green,
                  child: Text("Home Page")),
              Container(
                  width: 200,
                  height: 200,
                  color: Colors.green,
                  child: Text("Home Page")),
              Container(
                  width: 200,
                  height: 200,
                  color: Colors.green,
                  child: Text("last page")),
            ],
          ),
        ),
      ),
    );
  }
}
