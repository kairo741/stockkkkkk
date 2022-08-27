import 'package:stockkkkkk/domain/dto/stockDTO.dart';
import 'package:stockkkkkk/domain/entity/stock.dart';

abstract class StockPort {
  Future<List<StockDTO>> getStock();

  Future<StockDTO> updateStock(Stock stock) ;
}
