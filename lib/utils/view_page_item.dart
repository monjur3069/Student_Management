import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewPageItem {
  String title;

  ViewPageItem({

    required this.title,
  });

  static const String play = 'Play';
  static const String kg = 'Kg';
  static const String nursery = 'Nursery';
  static const String className1 = 'Class 1';
  static const String className2 = 'Class 2';
  static const String className3 = 'Class 3';
  static const String className4 = 'Class 4';
  static const String className5 = 'Class 5';
  static const String className6 = 'Class 6';
  static const String className7 = 'Class 7';
  static const String className8 = 'Class 8';
  static const String className9 = 'Class 9';
  static const String className10 = 'Class 10';
}

final List<ViewPageItem> viewItems = [
  ViewPageItem(title: ViewPageItem.play,),
  ViewPageItem(title: ViewPageItem.kg,),
  ViewPageItem(title: ViewPageItem.nursery,),
  ViewPageItem(title: ViewPageItem.className1,),
  ViewPageItem(title: ViewPageItem.className2,),
  ViewPageItem(title: ViewPageItem.className3,),
  ViewPageItem(title: ViewPageItem.className4,),
  ViewPageItem(title: ViewPageItem.className5,),
  ViewPageItem(title: ViewPageItem.className6,),
  ViewPageItem(title: ViewPageItem.className7,),
  ViewPageItem(title: ViewPageItem.className8,),
  ViewPageItem(title: ViewPageItem.className9,),
  ViewPageItem(title: ViewPageItem.className10,),
];


