import 'package:flutter/material.dart';
// import 'dart:convert' show json;

class ChangeRightList with ChangeNotifier{
  List<dynamic> valueOne = [];
  List<dynamic> valueTwo = [];
  List<dynamic> valueThree = [];
  List<dynamic> man = [];
  List<dynamic> manTwo = [];
  List<dynamic> manThree = [];
  List<dynamic> woman = [];
  List<dynamic> womanTwo = [];
  List<dynamic> womanThree = [];

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
  changeManTwoList(List val) {
    manTwo = val;
    notifyListeners();
  }
  changeManThreeList(List val) {
    manThree = val;
    notifyListeners();
  }
  changeWomanList(List val) {
    woman = val;
    notifyListeners();
  }
  changeWomanListTwo(List val) {
    womanTwo = val;
    notifyListeners();
  }
  changeWomanListThree(List val) {
    womanThree = val;
    notifyListeners();
  }
}