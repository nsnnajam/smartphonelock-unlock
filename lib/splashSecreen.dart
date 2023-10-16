import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lockapp/view/sign_in.dart';
import 'package:lockapp/widget.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignInsecreen())));
  }

  Future<void> fetchUserOrder() {
    // Imagine that this function is fetching user info from another service or database.
    return Future.delayed(
        const Duration(seconds: 0), () => print('Large Latte'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/lock1.jpg'),
            Center(child: myText("SmartPhone Lock,Unlock", Colors.blue, 16, FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GeeksForGeeks")),
      body: Center(
          child: Text(
        "Home page",
        textScaleFactor: 2,
      )),
    );
  }
}
