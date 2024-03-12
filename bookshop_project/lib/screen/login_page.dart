import 'package:bookshop_project/screen/dashboard.dart';
import 'package:bookshop_project/screen/login_page.dart';
import 'package:bookshop_project/screen/sign_up.dart';
import 'package:bookshop_project/utils/controllers.dart';
import 'package:bookshop_project/utils/global_button.dart';
import 'package:bookshop_project/utils/global_colors.dart';
import 'package:bookshop_project/utils/social_logins.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/text_form_global.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Dashboard()));
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
                      'Log in',
                      style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontSize: 13,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                InkWell(
                onTap: () {
                //stuff to make in flutter auth settings
                },
                child:const Text(
                'Forgotten password?',
                style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontSize:15,
                )
                ),
                ),
                  const SizedBox(height: 16),
                  const Text(
                  '-Or sign with-',
                  style: TextStyle(
                  fontSize:13,
                  )
                  ),
                  const SizedBox(height: 16),
                  const SocialLogins(),
                  const SizedBox(height: 20),
                Row(
mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const Text(
                'don\'t have an account yet ? ',
                style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                ),
),
              InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage()));
              },
              child: const Text(
                'Sign up',
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
