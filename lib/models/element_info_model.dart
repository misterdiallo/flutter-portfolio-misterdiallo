import 'package:flutter/material.dart';

class ElementInfo {
  String title;
  String text;
  IconData? icon_left;
  IconData? icon_right;
  String? link_to;
  ElementInfo(
    this.title,
    this.text,
    this.icon_left,
    this.icon_right,
    this.link_to,
  );
}
