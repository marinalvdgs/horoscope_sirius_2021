import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final TextEditingController? controller;
  final Pattern? pattern;

  const InputTextField({
    Key? key,
    required this.icon,
    required this.hintText,
    this.controller,
    this.pattern,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        inputFormatters: pattern == null
            ? []
            : [FilteringTextInputFormatter.allow(pattern!)],
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(icon, color: Colors.white),
          labelText: hintText,
          labelStyle: const TextStyle().copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
