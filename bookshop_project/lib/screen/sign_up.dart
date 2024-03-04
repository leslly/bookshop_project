import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            alignment: Alignment.center,
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Image.asset(
                   'assets/images/logo_two.png',
                   fit: BoxFit.contain,
                 ),
                 SizedBox(height: 41),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
