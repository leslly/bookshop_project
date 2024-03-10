import 'package:bookshop_project/utils/controllers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/text_form_global.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            alignment: Alignment.center,
            child:  Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Image.asset(
                     'assets/images/logo_two.png',
                     fit: BoxFit.contain,
                   ),
                   const SizedBox(height: 41),
                  // NAME CONTROLLER
                  const SizedBox(height: 16),
                  TextFormGlobal(
                    controller: controller.name,
                    text: 'Name',
                    textInputType: TextInputType.text,
                    obscure: false,
                    icon: null,
                    radius: 12,
                    height: 53,
                    width: 343,
                  ),
                  // EMAIL CONTROLLER
                  const SizedBox(height: 16),
                  TextFormGlobal(
                    controller: controller.email,
                    text: 'Email',
                    textInputType: TextInputType.emailAddress,
                    obscure: false,
                    icon: null,
                    radius: 12,
                    height: 53,
                    width: 343,
                  ),
                  // PASSWORD CONTROLLER
                  const SizedBox(height: 16),
                  TextFormGlobal(
                    controller: controller.password,
                    text: 'Password',
                    textInputType: TextInputType.text,
                    obscure: true,
                    icon: CupertinoIcons.eye_slash,
                    radius: 12,
                    height: 53,
                    width: 343,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
