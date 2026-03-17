import 'package:flutter/material.dart';

class Category {
  final int id;
  final String name;
  final IconData icon;
  final String imageUrl;

  const Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.imageUrl,
  });
}
