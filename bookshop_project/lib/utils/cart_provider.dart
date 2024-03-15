import 'package:bookshop_project/utils/store_items/model/items_model.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {

  // List of cart items
  final List<Item> _cartItems = [];

  List<Item> get cartItems => _cartItems;

  List<Item> get items => _cartItems;

 // var isSuccessful = false;

  // Add item to the cart
  void addItemToCart(Item item) {
    _cartItems.add(item);
    notifyListeners();
   // isSuccessful = true;
  }

  // Remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // Calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += _cartItems[i].price;
    }
    return totalPrice.toStringAsFixed(2);
  }

}