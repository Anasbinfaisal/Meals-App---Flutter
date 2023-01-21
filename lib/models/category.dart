import 'dart:ui';
import 'package:flutter/material.dart';

class Category {
  final String? id, title;
  final Color color;

  const Category({this.id, this.color = Colors.orange, this.title});
}
