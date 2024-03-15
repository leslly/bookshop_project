import 'package:bookshop_project/utils/global_colors.dart';
import 'package:flutter/material.dart';

class SearchNotFound extends StatelessWidget {
  const SearchNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        children: [
          SizedBox(
            width: 171,
            height: 160,
            child: Image.asset(
              'assets/images/sad_pink_cat.png',
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 32),
          const Text(
            'Search not found',
            style: TextStyle(
              color: Colors.black,

              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Try searching the course with",
            maxLines: 2,
            style: TextStyle(
              color: GlobalColors.smallTextColorGrey,

              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "a different keyword",
            maxLines: 2,
            style: TextStyle(
              color: GlobalColors.smallTextColorGrey,

              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
