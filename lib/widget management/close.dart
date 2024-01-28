import 'package:flutter/material.dart';

class Close extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void setCount() {
    _count--;
    notifyListeners();
    print("Count is descred in state : $count");
  }
}
