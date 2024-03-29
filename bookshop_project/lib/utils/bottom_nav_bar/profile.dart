import 'package:bookshop_project/utils/global_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalColors.buttonColorwhite,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            CupertinoIcons.back,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title:  Text(
          'Profile',
          style: TextStyle(
            color: GlobalColors.buttonColorPurple,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        toolbarHeight: 84,
      ),
body: const SingleChildScrollView(
  child: Center(
    child: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(

        ),
        )
        ),
  ),
),
    );
  }
}