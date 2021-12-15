import 'package:horoscope_sirius_2021/models/sign.dart';

class ZodiacSign {
  final Sign sign;
  final String image;

  const ZodiacSign({
    required this.sign,
    required this.image,
  });
}

final allSigns = <ZodiacSign>[
  ZodiacSign(
      sign: Sign(name: 'aries', title: 'Овен'),
      image: 'assets/signs/aries.png'),
  ZodiacSign(
      sign: Sign(name: 'taurus', title: 'Телец'),
      image: 'assets/signs/taurus.png'),
  ZodiacSign(
      sign: Sign(name: 'gemini', title: 'Близнецы'),
      image: 'assets/signs/gemini.png'),
  ZodiacSign(
      sign: Sign(name: 'cancer', title: 'Рак'),
      image: 'assets/signs/cancer.png'),
  ZodiacSign(
      sign: Sign(name: 'leo', title: 'Лев'), image: 'assets/signs/leo.png'),
  ZodiacSign(
      sign: Sign(name: 'virgo', title: 'Дева'),
      image: 'assets/signs/virgo.png'),
  ZodiacSign(
      sign: Sign(name: 'libra', title: 'Весы'),
      image: 'assets/signs/libra.png'),
  ZodiacSign(
      sign: Sign(name: 'scorpio', title: 'Скорпион'),
      image: 'assets/signs/scorpio.png'),
  ZodiacSign(
      sign: Sign(name: 'sagittarius', title: 'Стрелец'),
      image: 'assets/signs/sagittarius.png'),
  ZodiacSign(
      sign: Sign(name: 'capricorn', title: 'Козерог'),
      image: 'assets/signs/capricorn.png'),
  ZodiacSign(
      sign: Sign(name: 'aquarius', title: 'Водолей'),
      image: 'assets/signs/aquarius.png'),
  ZodiacSign(
      sign: Sign(name: 'pisces', title: 'Рыбы'),
      image: 'assets/signs/pisces.png'),
];
