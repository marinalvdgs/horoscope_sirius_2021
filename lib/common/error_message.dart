import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:horoscope_sirius_2021/common/style.dart';

class ErrorMessage {
  static void show(BuildContext context, {required String error}) {
    showFlash(
        context: context,
        builder: (context, controller) {
          return Flash(
            controller: controller,
            borderRadius: const BorderRadius.all(Radius.elliptical(4, 4)),
            backgroundColor: buttonColor,
            behavior: FlashBehavior.floating,
            position: FlashPosition.bottom,
            child: FlashBar(
              content: Text(
                error,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          );
        });
  }
}
