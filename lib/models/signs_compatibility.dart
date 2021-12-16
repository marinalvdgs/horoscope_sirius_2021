import 'dart:convert';

class SignsCompatibility {
  final double compatibility;
  final double marriage;
  final double sex;
  final String love;
  final String family;
  final String business;

  SignsCompatibility({
    required this.compatibility,
    required this.marriage,
    required this.sex,
    required this.love,
    required this.family,
    required this.business,
  });

  SignsCompatibility copyWith({
    double? compatibility,
    double? marriage,
    double? sex,
    String? love,
    String? family,
    String? business,
  }) {
    return SignsCompatibility(
      compatibility: compatibility ?? this.compatibility,
      marriage: marriage ?? this.marriage,
      sex: sex ?? this.sex,
      love: love ?? this.love,
      family: family ?? this.family,
      business: business ?? this.business,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'compatibility': compatibility,
      'marriage': marriage,
      'sex': sex,
      'love': love,
      'family': family,
      'business': business,
    };
  }

  factory SignsCompatibility.fromMap(Map<String, dynamic> map) {
    return SignsCompatibility(
      compatibility: map['compatibility']?.toDouble() ?? 0.0,
      marriage: map['marriage']?.toDouble() ?? 0.0,
      sex: map['sex']?.toDouble() ?? 0.0,
      love: map['love'] ?? '',
      family: map['family'] ?? '',
      business: map['business'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SignsCompatibility.fromJson(String source) =>
      SignsCompatibility.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SignsCompatibility(compatibility: $compatibility, marriage: $marriage, sex: $sex, love: $love, family: $family, business: $business)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SignsCompatibility &&
        other.compatibility == compatibility &&
        other.marriage == marriage &&
        other.sex == sex &&
        other.love == love &&
        other.family == family &&
        other.business == business;
  }

  @override
  int get hashCode {
    return compatibility.hashCode ^
        marriage.hashCode ^
        sex.hashCode ^
        love.hashCode ^
        family.hashCode ^
        business.hashCode;
  }
}
