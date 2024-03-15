import 'package:bookshop_project/utils/global_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalColors.buttonColorwhite,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Center(
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: const Icon(
                CupertinoIcons.back,
                color: Colors.black,
              ),
            ),
          ),
        ),
        centerTitle: true,
        title:  Text(
          'Cart',
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