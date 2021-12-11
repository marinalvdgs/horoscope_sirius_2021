import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final TextEditingController? controller;
  final Function(String?)? validator;
  final TextInputType keyboardType;

  const InputTextField({
    Key? key,
    required this.icon,
    required this.hintText,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        style: const TextStyle().copyWith(color: Colors.white, fontSize: 20),
        cursorColor: Colors.white,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (validator != null) {
            return validator!(value) as String?;
          }
          return null;
        },
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
          errorStyle: const TextStyle().copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
