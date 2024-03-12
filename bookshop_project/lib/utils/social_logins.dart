import 'package:flutter/material.dart';

class SocialLogins extends StatelessWidget {
  const SocialLogins({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 40,
          width: 144,
          child: Row(
            children: [
              /////facebook
              Expanded(
                child: Container(
                  height: 40,
                  width: 40,
                  child: Image.asset(
                    'assets/images/google_icon.png',
                    height: 40,
                    width: 40,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              /////instagram
              Expanded(
                child: Container(
                  height: 40,
                  width: 40,
                  child: Image.asset(
                    'assets/images/facebook_icon.png',
                    height: 40,
                    width: 40,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              /////google
              Expanded(
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset(
                    'assets/images/twitter_icon.png',
                    height: 40,
                    width: 40,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
