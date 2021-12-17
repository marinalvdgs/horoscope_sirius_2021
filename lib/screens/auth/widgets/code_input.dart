import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:horoscope_sirius_2021/common/style.dart';
import 'package:horoscope_sirius_2021/services/auth_service.dart';

class CodeInput extends StatefulWidget {
  final Function() onComplete;
  final Function(String) onError;
  const CodeInput({
    Key? key,
    required this.onComplete,
    required this.onError,
  }) : super(key: key);

  @override
  State<CodeInput> createState() => _CodeInputState();
}

class _CodeInputState extends State<CodeInput> {
  String code = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        color: darkBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.white54,
            blurRadius: 6,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 0, 16, 16),
            child: PinCodeTextField(
              appContext: context,
              length: 6,
              onChanged: (value) {
                setState(() {
                  code = value;
                });
              },
              textStyle: const TextStyle().copyWith(color: Colors.white),
              cursorColor: Colors.white,
              pinTheme: PinTheme(
                activeColor: Colors.white,
                inactiveColor: Colors.white,
                selectedColor: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 0, 16, 16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: buttonColor),
              onPressed: () {
                firebaseServise.state.confirmCode(code, widget.onComplete,
                    (error) {
                  widget.onError(error);
                });
              },
              child: Text(
                'Подтвердить',
                style: buttonTextStyle,
              ),
            ),
          )
        ],
      ),
    );
  }
}
