import 'package:bookshop_project/utils/store_items/model/items_model.dart';
import 'package:flutter/material.dart';

class IndexProvider extends ChangeNotifier {
  final List<Item> _items = [
    Item(
      itemId: 2,
      price: 150.00,
      title: 'Book',
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Consectetur purus ut faucibus pulvinar elementum integer enim neque volutpat.",
      image: 'assets/images/item.png',
      initiaPrice: null,
      quantity: 1,
    ),
    Item(
      itemId: 3,
      price: 150.00,
      title: 'Book',
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Consectetur purus ut faucibus pulvinar elementum integer enim neque volutpat.",
      image: 'assets/images/item.png',
      initiaPrice: null,
      quantity: 1,
    ),
    Item(
      itemId: 4,
        price:  150.00,
        title: 'Book',
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Consectetur purus ut faucibus pulvinar elementum integer enim neque volutpat.",
        image: 'assets/images/item.png',
        initiaPrice: null,
      quantity: 1,
    ),
Item(
      itemId: 5,
        price:  150.00,
        title: 'Book',
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Consectetur purus ut faucibus pulvinar elementum integer enim neque volutpat.",
        image: 'assets/images/item.png',
initiaPrice: null,
      quantity: 1,
    ),
    Item(
      itemId: 6,
        price:  150.00,
        title: 'Book',
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Consectetur purus ut faucibus pulvinar elementum integer enim neque volutpat.",
        image: 'assets/images/item.png',
        initiaPrice: null,
      quantity: 1,
    ),
    Item(
      itemId: 7,
        price:  150.00,
        title: 'Book',
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Consectetur purus ut faucibus pulvinar elementum integer enim neque volutpat.",
        image: 'assets/images/item.png',
        initiaPrice: null,
      quantity: 1,
    ),
    Item(
      itemId: 8,
        price:  150.00,
        title: 'Book',
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Consectetur purus ut faucibus pulvinar elementum integer enim neque volutpat.",
        image: 'assets/images/item.png',
        initiaPrice: null,
      quantity: 1,
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
