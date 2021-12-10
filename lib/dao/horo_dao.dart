
import 'package:horoscope_sirius_2021/models/horo.dart';

abstract class HoroDao {
  Future<void> save(Horo horo);

  Future<Horo?> getItem(int id);

  Future<void> delete(Horo item);
}
