import 'package:flutter/material.dart';
import 'package:payment/Features/checkout/presentation/views/my_cart_view.dart';
import 'package:payment/core/dependency_injection/init_core.dart';
import 'package:payment/inherited.dart';

void main() {
  initCore();
  runApp(const CheckoutApp());
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyCartView());
  }
}
/*
TO SAVE USER CARD WE NEED TO CREATE CUSTOMER ACCOUNT WHEN WE CREATE ACCOUNT
First step get UserId to pass to strip then init to payment sheet
TO get user data u need ephemeral key
*/

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green),

      body: Inherited(color: getRandomColor(), child: ColorBox()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
      ),
    );
  }
}

Color getRandomColor() {
  var colorList = [Colors.black, Colors.red, Colors.green, Colors.blue];

  colorList.shuffle();
  return colorList.first;
}

class ColorBox extends StatelessWidget {
  const ColorBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      color: Inherited.of(context).color,
    );
  }
}