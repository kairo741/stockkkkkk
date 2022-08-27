import 'package:stockkkkkk/domain/dto/stockDTO.dart';
import 'package:stockkkkkk/domain/entity/stock.dart';
import 'package:stockkkkkk/domain/port/primary/stock_port.dart';

class StockServiceImpl extends StockPort {
  @override
  Future<List<StockDTO>> getStock() async {
    return [StockDTO(1, "name", 1)];
  }

  @override
  Future<StockDTO> updateStock(Stock stock) async {
    return StockDTO(2, "name", 1);
  }
}
