import 'package:bookshop_project/utils/store_items/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

//Counter
int _counter = 0;
int get counter => _counter;

double _totalPrice = 0.0;
double get totalPrice =>_totalPrice;


void _setPreItems()async{
SharedPreferences prefs =await SharedPreferences.getInstance();
prefs.setInt('cart_items', _counter);
prefs.setDouble('total_price', _totalPrice);
notifyListeners();
}

void _getPreItems()async{
SharedPreferences prefs =await SharedPreferences.getInstance();
_counter = prefs.getInt('cart_items') ?? 0;
_totalPrice = prefs.getDouble('total_price') ?? 0.0;
notifyListeners();

}

void addTotalPrice(double itemPrice){
_totalPrice = _totalPrice + itemPrice ;
_setPreItems();
notifyListeners();
}

void removeTotalPrice (double itemPrice){
_totalPrice = _totalPrice - itemPrice ;
_setPreItems();
notifyListeners();
}

double getTotalPrice () {
_getPreItems();
return _totalPrice ;
}

void addCounter (){
_counter++;
_setPreItems();
notifyListeners();
}

void removeCounter (){
_counter--;
_setPreItems();
notifyListeners();
}

int getCounter () {
_getPreItems();
return _counter ;
}

}