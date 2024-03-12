import 'package:flutter/material.dart';


class IndexProvider extends ChangeNotifier {

  var index = 1;

  changeIndex(index){
    this.index = index;
    notifyListeners();
  }

}