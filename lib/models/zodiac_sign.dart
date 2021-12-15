import 'option.dart';

class ZodiacSign extends CardOption {
  final String sign;

  ZodiacSign({
    required this.sign,
    required image,
    required title,
  }) : super(image: image, title: title);
}

final allSigns = <ZodiacSign>[
  ZodiacSign(sign: 'aries', image: 'assets/signs/aries.png', title: 'Овен'),
  ZodiacSign(sign: 'taurus', image: 'assets/signs/taurus.png', title: 'Телец'),
  ZodiacSign(
      sign: 'gemini', image: 'assets/signs/gemini.png', title: 'Близнецы'),
  ZodiacSign(sign: 'cancer', image: 'assets/signs/cancer.png', title: 'Рак'),
  ZodiacSign(sign: 'leo', image: 'assets/signs/leo.png', title: 'Лев'),
  ZodiacSign(sign: 'virgo', image: 'assets/signs/virgo.png', title: 'Дева'),
  ZodiacSign(sign: 'libra', image: 'assets/signs/libra.png', title: 'Весы'),
  ZodiacSign(
      sign: 'scorpio', image: 'assets/signs/scorpio.png', title: 'Скорпион'),
  ZodiacSign(
      sign: 'sagittarius',
      image: 'assets/signs/sagittarius.png',
      title: 'Стрелец'),
  ZodiacSign(
      sign: 'capricorn', image: 'assets/signs/capricorn.png', title: 'Козерог'),
  ZodiacSign(
      sign: 'aquarius', image: 'assets/signs/aquarius.png', title: 'Водолей'),
  ZodiacSign(sign: 'pisces', image: 'assets/signs/pisces.png', title: 'Рыбы'),
];
