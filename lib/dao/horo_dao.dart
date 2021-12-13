
import 'package:horoscope_sirius_2021/models/full_horo.dart';

abstract class HoroDao {
  Future<void> save(FullHoro horo);

  Future<void> saveAll(List<FullHoro> horos);

  FullHoro? getItem(String sign);

  Future<List<FullHoro>> getAll();

  Future<void> delete(FullHoro item);

  Future<void> clearAll();
}
