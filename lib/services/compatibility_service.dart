import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:horoscope_sirius_2021/models/signs_compatibility.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

final compatibilityService = RM.inject(() => CompatibilityService());

class CompatibilityService {
  final _compatibility = FirebaseFirestore.instance.collection('compatibility');

  Future<SignsCompatibility> getCompatibilityForSigns(
      {required String woman, required String man}) async {
    final document = await _compatibility.doc('$woman-$man').get();
    return SignsCompatibility.fromMap(document.data()!);
  }
}
