import 'package:stockkkkkk/infra/adapters/models/stock_model.dart';

abstract class StockDAO {
  save(StockModel stock);

  remove(int id);

  Future<List<StockModel>> find(int idList);

  Future<List<StockModel>> findAll();
}
