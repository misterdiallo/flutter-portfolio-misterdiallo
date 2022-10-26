import 'package:flutter/material.dart';

class Project {
  IconData? icon;
  String name;
  String description;
  String link;

  Project({
    this.icon,
    required this.name,
    required this.description,
    required this.link,
  });
}
