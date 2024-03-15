import 'package:bookshop_project/screen/login_page.dart';
import 'package:bookshop_project/utils/controllers.dart';
import 'package:bookshop_project/utils/global_colors.dart';
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
                    icon: CupertinoIcons.clear_circled,
                    radius: 270,
                    height: 40,
                    width: 190,
                  ),
                  // EMAIL CONTROLLER
                  const SizedBox(height: 16),
                  TextFormGlobal(
                    controller: controller.email,
                    text: 'Email',
                    textInputType: TextInputType.emailAddress,
                    obscure: false,
                    icon: CupertinoIcons.clear_circled,
                    radius: 270,
                    height: 40,
                    width: 190,
                  ),
                  // PASSWORD CONTROLLER
                  const SizedBox(height: 16),
                  TextFormGlobal(
                    controller: controller.password,
                    text: 'Password',
                    textInputType: TextInputType.text,
                    obscure: true,
                    icon: CupertinoIcons.eye_slash,
                    radius: 270,
                    height: 40,
                    width: 190,
                  ),
                  const SizedBox(height: 16),
                    // GlobalButton(
                    // colorOfText: Colors.white,
                    // colorOfButton: GlobalColors.linearPurple,
                    // nextPage:Dashboard
                    // )
                InkWell(
                  onTap: () {
                    if(formKey.currentState!.validate()){
                        SignUpController.instance.registerUser(controller.email.text.trim(),
                        controller.password.text.trim());
                         // Actually signs up but does not re route to home page
                      }
                  },
                  child: Container(
                  alignment: Alignment.center,
                          height: 28,
                          width: 190,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      border: Border.all(color: GlobalColors.whiteTextColor),
                      color: const Color(0xff5B5D8B),
                    ),
                    child: const Text(
                      'create account',
                      style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontSize: 13,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const Text(
                'Already have an account ? ',
                style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                ),
),
              InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: const Text(
                'Log In',
                style: TextStyle(
                  fontSize:13,
                  color: Colors.blue,
                ),
              ),
              )
              ],
)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
