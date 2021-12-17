import 'package:flutter_test/flutter_test.dart';
import 'package:horoscope_sirius_2021/models/sign.dart';
import 'package:horoscope_sirius_2021/utils/get_zodiac_sign.dart';

void main() {
  test('Test zodiac sign', () {
    final taurusBirth = DateTime(2021, 5, 3);

    final signByBirth = getZodiacSign(taurusBirth);

    expect(signByBirth, Sign(name: 'taurus', title: 'Телец'));
  });
}
