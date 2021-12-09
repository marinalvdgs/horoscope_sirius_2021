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
        style: const TextStyle().copyWith(color: Colors.white, fontSize: 20),
        cursorColor: Colors.white,
        inputFormatters: pattern == null
            ? []
            : [FilteringTextInputFormatter.allow(pattern!)],
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          filled: true,
          fillColor: const Color(0x33081448),
          prefixIcon: Icon(icon, color: Colors.white),
          hintText: hintText,
          hintStyle:
              const TextStyle().copyWith(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
