import 'package:flutter/material.dart';
import 'package:horoscope_sirius_2021/common/style.dart';
import 'package:horoscope_sirius_2021/models/user.dart';
import 'package:horoscope_sirius_2021/screens/auth/widgets/code_input.dart';
import 'package:horoscope_sirius_2021/services/user_service.dart';
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
    //TODO: skip register form if User is logged in
    userService.subscribeToRM((snap) {
      if (snap != null) {
        final user = snap.state.getUser();
        if (user != null) {
          nameController.text = user.name;
          birthController.text = user.birth;
          phoneController.text = user.phone;
        }
      }
    });
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
    return On<Widget>(
      () => Column(
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
                    style: headerTextStyle.copyWith(
                      fontSize: 20,
                      color: subtitleColor,
                    ),
                  ),
                ),
                InputTextField(
                  icon: Icons.person,
                  hintText: 'Имя',
                  controller: nameController,
                ),
                InputTextField(
                  icon: Icons.calendar_today,
                  hintText: 'Дата рождения',
                  controller: birthController,
                  keyboardType: TextInputType.datetime,
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
          Material(
            child: InkWell(
              onTap: allFieldFilled
                  ? () {
                      userService.state.setUser(
                        UserInfo(
                            name: nameController.text,
                            birth: birthController.text,
                            phone: phoneController.text),
                      );
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => const Dialog(
                          backgroundColor: Colors.transparent,
                          child: CodeInput(),
                        ),
                      );
                    }
                  : null,
              child: Ink(
                color:
                    allFieldFilled ? buttonColor : buttonColor.withOpacity(0.8),
                height: kBottomNavigationBarHeight,
                child: Center(
                  child: Text('ПРОДОЛЖИТЬ', style: buttonTextStyle),
                ),
              ),
            ),
          )
        ],
      ),
    ).listenTo(userService);
  }
}
