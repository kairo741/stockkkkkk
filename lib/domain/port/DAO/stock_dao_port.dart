import 'package:stockkkkkk/domain/entity/stock.dart';

abstract class StockDAOPort {
  Future<List<Stock>> findAll();

  save(Stock stock) ;
}
