import 'package:flutter/material.dart';

extension Nav on Widget {
  push(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => this,
      ),
    );
  }
}

extension Pop on BuildContext {
  get pop => Navigator.pop(this);
}

extension Email on String {
  bool get isValidEmail =>
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);
}


extension MediaQueryExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}