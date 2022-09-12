import 'package:flutter/material.dart';

class CounterNotifier extends ChangeNotifier {
  int _count = 0;
  int get getCounter {
    return _count;
  }

  void incrementCounter() {
    _count += 1;

    notifyListeners();
  }
}
