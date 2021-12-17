import 'package:flutter/material.dart';
import 'package:horoscope_sirius_2021/common/error_message.dart';
import 'package:horoscope_sirius_2021/common/style.dart';
import 'package:horoscope_sirius_2021/models/user.dart';
import 'package:horoscope_sirius_2021/screens/auth/widgets/input_text_field.dart';
import 'package:horoscope_sirius_2021/services/user_service.dart';
import 'package:horoscope_sirius_2021/utils/date_formatter.dart';
import 'package:horoscope_sirius_2021/utils/format_date_string.dart';
import 'package:horoscope_sirius_2021/utils/get_zodiac_sign.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({Key? key}) : super(key: key);

  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  final nameController = TextEditingController();
  final birthController = TextEditingController();
  final phoneController = TextEditingController();

  bool isEditing = false;

  @override
  initState() {
    final user = userService.state.getUser()!;
    nameController.text = user.name;
    birthController.text = user.birth;
    phoneController.text = user.phone;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text('Профиль', style: headerTextStyle),
              ),
              InputTextField(
                icon: Icons.person,
                hintText: 'Имя',
                controller: nameController,
                enabled: isEditing,
              ),
              InputTextField(
                icon: Icons.calendar_today,
                hintText: 'Дата рождения',
                controller: birthController,
                keyboardType: TextInputType.datetime,
                formatter: DateFormatter(),
                enabled: isEditing,
              ),
              InputTextField(
                icon: Icons.mobile_friendly,
                hintText: 'Номер телефона',
                controller: phoneController,
                keyboardType: TextInputType.phone,
                enabled: isEditing,
              )
            ],
          ),
        ),
        Material(
          child: InkWell(
            onTap: () async {
              if (isEditing) {
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
              }
              setState(() {
                isEditing = !isEditing;
              });
            },
            child: Ink(
              color: buttonColor,
              height: kBottomNavigationBarHeight,
              child: Center(
                child: Text(
                  isEditing ? 'СОХРАНИТЬ' : 'РЕДАКТИРОВАТЬ',
                  style: buttonTextStyle,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
