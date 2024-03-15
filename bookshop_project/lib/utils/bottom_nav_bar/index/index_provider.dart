import 'package:bookshop_project/utils/store_items/model/items_model.dart';
import 'package:flutter/material.dart';

class IndexProvider extends ChangeNotifier {
  final List<Item> _items = [
    Item(
      itemId: 2,
      price: 150.00,
      title: 'Book',
      description: "Intro to mobile interface design",
      image: 'assets/images/item.png',
    ),
    Item(
      itemId: 3,
      price: 150.00,
      title: 'Book',
      description: "Intro to mobile interface design",
      image: 'assets/images/item.png',
    ),
    Item(
      itemId: 4,
        price:  150.00,
        title: 'Book',
        description: "Intro to mobile interface design",
        image: 'assets/images/item.png',
    ),
  ];

  // List<Course>  _courses = _maincourses;

  List<Item> get items => _items;
  var index = 1;

  changeIndex(index) {
    this.index = index;
    notifyListeners();
  }
}
