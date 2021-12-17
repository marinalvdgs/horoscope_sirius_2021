import 'package:horoscope_sirius_2021/models/sign.dart';

Sign getZodiacSign(DateTime birth) {
  final day = birth.day;
  final month = birth.month;
  late final Sign sign;

  if (month == 12) {
    if (day < 22) {
      sign = Sign(name: 'sagittarius', title: 'Стрелец');
    } else {
      sign = Sign(name: 'capricorn', title: 'Козерог');
    }
  } else if (month == 1) {
    if (day < 20) {
      sign = Sign(name: 'capricorn', title: 'Козерог');
    } else {
      sign = Sign(name: 'aquarius', title: 'Водолей');
    }
  } else if (month == 2) {
    if (day < 19) {
      sign = Sign(name: 'aquarius', title: 'Водолей');
    } else {
      sign = Sign(name: 'pisces', title: 'Рыбы');
    }
  } else if (month == 3) {
    if (day < 21) {
      sign = Sign(name: 'pisces', title: 'Рыбы');
    } else {
      sign = Sign(name: 'aries', title: 'Овен');
    }
  } else if (month == 4) {
    if (day < 20) {
      sign = Sign(name: 'aries', title: 'Овен');
    } else {
      sign = Sign(name: 'taurus', title: 'Телец');
    }
  } else if (month == 5) {
    if (day < 21) {
      sign = Sign(name: 'taurus', title: 'Телец');
    } else {
      sign = Sign(name: 'gemini', title: 'Близнецы');
    }
  } else if (month == 6) {
    if (day < 21) {
      sign = Sign(name: 'gemini', title: 'Близнецы');
    } else {
      sign = Sign(name: 'cancer', title: 'Рак');
    }
  } else if (month == 7) {
    if (day < 23) {
      sign = Sign(name: 'cancer', title: 'Рак');
    } else {
      sign = Sign(name: 'leo', title: 'Лев');
    }
  } else if (month == 8) {
    if (day < 23) {
      sign = Sign(name: 'leo', title: 'Лев');
    } else {
      sign = Sign(name: 'virgo', title: 'Дева');
    }
  } else if (month == 9) {
    if (day < 23) {
      sign = Sign(name: 'virgo', title: 'Дева');
    } else {
      sign = Sign(name: 'libra', title: 'Весы');
    }
  } else if (month == 10) {
    if (day < 23) {
      sign = Sign(name: 'libra', title: 'Весы');
    } else {
      sign = Sign(name: 'scorpio', title: 'Скорпион');
    }
  } else if (month == 11) {
    if (day < 22) {
      sign = Sign(name: 'scorpio', title: 'Скорпион');
    } else {
      sign = Sign(name: 'sagittarius', title: 'Стрелец');
    }
  }

  return sign;
}
