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


final signsProbability = {
  'aries' : [0.4789291656901179, 0.781619858865666, 0.9251536932175217],
  'taurus' : [0.8005650977364804, 0.8967284901740777, 0.045648767520585554],
  'gemini' : [0.25288492773520155, 0.5901915032227923, 0.34836869984076946],
  'cancer' : [0.17738250645598108, 0.14962236641819548, 0.976553105638839],
  'leo' : [0.8623128095750965, 0.8817671818357663, 0.28046373970756844],
  'virgo' : [0.8231241414729, 0.3609373445205486, 0.30110410181176583],
  'libra' : [0.4095567963908805, 0.4636012969865507, 0.7591224127304691],
  'scorpio' : [0.27888474055487766, 0.25398644248923197, 0.3485055707322957],
  'sagittarius' : [0.4079172873476212, 0.9351265494303518, 0.6957067475175833],
  'capricorn' : [0.049738495816128325, 0.43907196203231136, 0.13866683509530486],
  'aquarius' : [0.3175918592562693, 0.10186370027781644, 0.179892082916437],
  'pisces' : [0.9534756199501141, 0.9610839826031121, 0.741724625031384]
};