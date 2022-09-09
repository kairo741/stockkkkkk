import 'package:stockkkkkk/domain/dto/stockDTO.dart';
import 'package:stockkkkkk/domain/entity/stock.dart';
import 'package:stockkkkkk/domain/port/service/stock_service_port.dart';
import 'package:stockkkkkk/infra/adapters/dao/services/stock_model_service.dart';

class StockServiceImpl extends StockServicePort {
  final StockModelServiceImpl _stockModelService = StockModelServiceImpl();

  @override
  Future<List<StockDTO>> findAll() async {
    List<Stock> stockList = await _stockModelService.findAll();
    return stockList.map((e) => StockDTO.fromStock(e)).toList();
  }

  @override
  save(StockDTO dto) {
    Stock entity = Stock(dto.id, dto.name!, dto.quantity!);
    _stockModelService.save(entity);
  }
}
