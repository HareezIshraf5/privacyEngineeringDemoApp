import 'package:flutter/material.dart';
import 'dart:convert';

String convertString(String input) {
  int val = int.parse(input);
  if (val < 1 || val > 80) {
    return "Invalid input";
  }
  int start = (val - 1) ~/ 5 * 5 + 1;
  int end = start + 4;
  return "$start-$end";
}
