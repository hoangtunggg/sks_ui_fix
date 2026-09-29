import 'package:flutter/material.dart';

class TextFieldDecoration {
  static InputDecoration standard({
    String? labelText,
    String? hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool? isDense,
    EdgeInsetsGeometry? contentPadding = const EdgeInsets.all(5),
    InputBorder? enabledBorder,
  }) {
    return InputDecoration(
      isDense: isDense,
      hintText: hintText,
      hintStyle: TextStyle(fontSize: 11),
      labelText: labelText,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: contentPadding,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      enabledBorder:
          enabledBorder ??
          OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
    );
  }
}
