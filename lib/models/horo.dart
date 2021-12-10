
class Horo {
  String yesterday;
  String today;
  String tomorrow;
  String tomorrow02;

  Horo({required this.yesterday, required this.today, required this.tomorrow, required this.tomorrow02});

  Horo.fromJson(Map<String, dynamic> json) :
      today = json['today']["\$t"],
      tomorrow = json['tomorrow']["\$t"],
      yesterday = json['yesterday']["\$t"],
      tomorrow02 = json['tomorrow02']["\$t"];
}

final signs = ['aries', 'taurus', 'gemini', 'cancer', 'leo', 'virgo', 'libra', 'scorpio', 'sagittarius', 'capricorn', 'aquarius', 'pisces'];

