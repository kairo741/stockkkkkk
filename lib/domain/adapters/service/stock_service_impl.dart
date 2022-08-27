import 'package:stockkkkkk/domain/dto/stockDTO.dart';
import 'package:stockkkkkk/domain/entity/stock.dart';
import 'package:stockkkkkk/domain/port/primary/stock_port.dart';

class StockServiceImpl extends StockPort {
  @override
  List<StockDTO> getStock() {
    return [StockDTO(1, "name", 1)];
  }

  @override
  StockDTO updateStock(Stock stock) {
    return StockDTO(2, "name", 1);
  }
}
