import 'package:flutter/material.dart';
import 'package:horoscope_sirius_2021/common/error_message.dart';
import 'package:horoscope_sirius_2021/common/style.dart';
import 'package:horoscope_sirius_2021/models/option.dart';
import 'package:horoscope_sirius_2021/models/user.dart';
import 'package:horoscope_sirius_2021/screens/auth/widgets/code_input.dart';
import 'package:horoscope_sirius_2021/screens/menu/menu_screen.dart';
import 'package:horoscope_sirius_2021/services/app_settings_service.dart';
import 'package:horoscope_sirius_2021/services/auth_service.dart';
import 'package:horoscope_sirius_2021/services/user_service.dart';
import 'package:horoscope_sirius_2021/utils/date_formatter.dart';
import 'package:horoscope_sirius_2021/utils/format_date_string.dart';
import 'package:horoscope_sirius_2021/utils/get_zodiac_sign.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'input_text_field.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final nameController = TextEditingController();
  final birthController = TextEditingController();
  final phoneController = TextEditingController();

  bool allFieldFilled = false;

  @override
  void initState() {
    nameController.addListener(filledListener);
    birthController.addListener(filledListener);
    phoneController.addListener(filledListener);
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    birthController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void filledListener() {
    if (nameController.text.isNotEmpty &&
        birthController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        !allFieldFilled) {
      setState(() {
        allFieldFilled = true;
      });
    } else {
      if (allFieldFilled) {
        setState(() {
          allFieldFilled = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Регистрация', style: headerTextStyle),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Заполните все поля, чтобы войти',
                  style: subtitleTextStyle,
                ),
              ),
              InputTextField(
                key: const ValueKey('name'),
                icon: Icons.person,
                hintText: 'Имя',
                controller: nameController,
              ),
              InputTextField(
                icon: Icons.calendar_today,
                hintText: 'Дата рождения',
                controller: birthController,
                keyboardType: TextInputType.datetime,
                formatter: DateFormatter(),
              ),
              InputTextField(
                icon: Icons.mobile_friendly,
                hintText: 'Номер телефона',
                controller: phoneController,
                keyboardType: TextInputType.phone,
              )
            ],
          ),
        ),
        On<Widget>(() => Material(
              child: InkWell(
                onTap: allFieldFilled && firebaseServise.state.auth != null
                    ? () async {
                        final date = formatDateString(birthController.text);
                        final birthDate = DateTime.parse(date);
                        final sign = getZodiacSign(birthDate);
                        try {
                          await userService.state.setUser(
                            UserInfo(
                              name: nameController.text,
                              birth: birthController.text,
                              phone: phoneController.text,
                              sign: sign,
                            ),
                          );
                        } catch (e) {
                          ErrorMessage.show(context, error: e.toString());
                        }
                        firebaseServise.state.signInWithPhone(
                            phoneNumber: phoneController.text,
                            onComplete: () {
                              onComplete(context);
                            },
                            onError: (error) =>
                                ErrorMessage.show(context, error: error),
                            onCodeSent: (_) {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => Dialog(
                                  backgroundColor: Colors.transparent,
                                  child: CodeInput(
                                    onComplete: () {
                                      onComplete(context);
                                    },
                                    onError: (error) => ErrorMessage.show(
                                        context,
                                        error: error),
                                  ),
                                ),
                              );
                            });
                      }
                    : null,
                child: Ink(
                  color: allFieldFilled
                      ? buttonColor
                      : buttonColor.withOpacity(0.8),
                  height: kBottomNavigationBarHeight,
                  child: Center(
                    child: Text('ПРОДОЛЖИТЬ', style: buttonTextStyle),
                  ),
                ),
              ),
            )).listenTo(firebaseServise)
      ],
    );
  }

  void onComplete(BuildContext context) {
    appSettingsService.state.setLoggedIn();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (context) => MenuScreen(
                  list: options,
                )),
        (route) => false);
  }
}
