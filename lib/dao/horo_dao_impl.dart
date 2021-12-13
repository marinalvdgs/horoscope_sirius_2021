import 'package:hive/hive.dart';
import 'package:horoscope_sirius_2021/dao/horo_model.dart';
import 'package:horoscope_sirius_2021/models/full_horo.dart';
import 'horo_dao.dart';

class HoroDaoImpl extends HoroDao {
  final Box<FullHoroHiveModel> _box;

  HoroDaoImpl(this._box);

  @override
  Future<void> save(FullHoro horo) async =>
      _box.put(horo.sign, FullHoroHiveModel.fromHoro(horo));

  @override
  Future<void> saveAll(List<FullHoro> horos) async => horos.forEach((horo) {
        _box.put(horo.sign, FullHoroHiveModel.fromHoro(horo));
      });

  @override
  Future<void> clearAll() async => _box.clear();

  @override
  Future<void> delete(FullHoro item) => _box.delete(item.sign);

  @override
  FullHoro? getItem(String sign) => _box.get(sign)?.toFullHoro();

  @override
  Future<List<FullHoro>> getAll() async =>
      _box.values.map((e) => e.toFullHoro()).toList();
}
