import 'package:stockkkkkk/domain/dto/stockDTO.dart';
import 'package:stockkkkkk/domain/entity/stock.dart';

abstract class StockPort {
  List<StockDTO> getStock();

  StockDTO updateStock(Stock stock) ;
}
