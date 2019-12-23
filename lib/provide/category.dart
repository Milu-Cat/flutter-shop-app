import 'package:flutter/material.dart';
// import 'dart:convert' show json;

class ChangeRightList with ChangeNotifier{
  List<dynamic> valueOne = [];
  List<dynamic> valueTwo = [];
  List<dynamic> valueThree = [];
  List<dynamic> man = [];
  List<dynamic> woman = [];

  get type => null;
  changeList(List val) {
    valueOne = val;
    notifyListeners();
  }
  changeListTwo(List val) {
    valueTwo = val;
    notifyListeners();
  }
  changeListThree(List val) {
    valueThree = val;
    notifyListeners();
  }
  changeManList(List val) {
    man = val;
    notifyListeners();
  }
  changeWomanList(List val) {
    woman = val;
    notifyListeners();
  }
}