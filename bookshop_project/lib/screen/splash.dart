
import 'package:bookshop_project/screen/login_page.dart';
import 'package:bookshop_project/screen/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:bookshop_project/utils/global_colors.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.linearPurple ,
      body: SafeArea(
        child: Padding(
          padding:const EdgeInsets.all(0),
          child: Container(
            decoration: const BoxDecoration(
            gradient:LinearGradient(
            colors:[
          Color(0xff5B5D8B),
          Color(0xff6C68A5),
        ])
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(image: AssetImage('assets/images/splash_logo.png'),),
                const SizedBox(height: 41),
                Text(
                    'Welcome',
                style: TextStyle(
                  fontSize: 32,
                  color: GlobalColors.whiteTextColor,
                ),
                ),
                const SizedBox(height: 23),
                Text(
                    'easy purchase...',
                        style: TextStyle(
                          fontSize: 14,
                          color: GlobalColors.buttonColorwhite
                        ),
                ),
                const SizedBox(height: 81),

               //GlobalButton(colorOfText: GlobalColors.linearPurple, colorOfButton: GlobalColors.buttonColorwhite, nextPage: SignUpPage);
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 34,
                    width: 195,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: GlobalColors.buttonColorwhite,
                    ),
                    child: Text(
                      'create account',
                      style: TextStyle(
                        color: GlobalColors.linearPurple
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 62),

                ///// LOGIN TO ACCOUNT
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Container(
                  alignment: Alignment.center,
                          height: 34,
                          width: 195,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      border: Border.all(color: GlobalColors.whiteTextColor),
                      color: const Color(0xff6C68A5),
                    ),
                    child: Text(
                      'Log in',
                      style: TextStyle(
                          color: GlobalColors.whiteTextColor
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
