import 'package:hive/hive.dart';
import 'package:horoscope_sirius_2021/dao/horo_model.dart';
import 'package:horoscope_sirius_2021/models/horo.dart';
import 'horo_dao.dart';

class HoroDaoImpl extends HoroDao {
  final Box<HoroHiveModel> _box;

  HoroDaoImpl(this._box);

  @override
  Future<List<Horo>> getAll() async =>
      _box.values.map((e) => e.toHoro()).toList();

  @override
  Future<void> save(Horo horo) async =>
      _box.put(horo.id, HoroHiveModel.fromHoro(horo));

  @override
  Future<void> delete(Horo item) => _box.delete(item.id);

  @override
  Future<Horo?> getItem(int id) async {
    return _box.get(id)?.toHoro();
  }

}
