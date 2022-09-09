import 'package:get_it/get_it.dart';
import 'package:stockkkkkk/domain/entity/stock.dart';
import 'package:stockkkkkk/domain/port/DAO/stock_dao_port.dart';
import 'package:stockkkkkk/infra/adapters/models/stock_model.dart';

import '../interfaces/stock_dao.dart';

class StockModelServiceImpl implements StockDAOPort {
  final _dao = GetIt.I.get<StockDAO>();

  @override
  save(Stock stock) async {
    var model = StockModel.fromStock(stock);
    validate(model);
    await _dao.save(model);
  }

  remove(int id) {
    _dao.remove(id);
  }

  Future<List<StockModel>> find(int id) {
    return _dao.find(id);
  }

  @override
  Future<List<Stock>> findAll() async {
    var list = await _dao.findAll();

    var modelList = list.map<Stock>((e) => e.toStock()).toList();

    return modelList;
  }

  validate(StockModel stock) {
    if (stock.name == null) {
      throw Exception("O nome é obrigatório!");
    }
  }
}
