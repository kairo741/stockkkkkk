import 'package:get_it/get_it.dart';
import 'package:stockkkkkk/domain/dto/stockDTO.dart';
import 'package:stockkkkkk/domain/entity/stock.dart';
import 'package:stockkkkkk/domain/port/service/primary_port.dart';
import 'package:stockkkkkk/domain/port/service/secundary_port.dart';

class StockServiceImpl {
  final primaryPort = GetIt.I.get<ServicePrimaryPort>();
  final secundaryPort = GetIt.I.get<ServiceSecundaryPort>();

  Future<List<StockDTO>> findAll() async {
    List<StockDTO> stockList = await primaryPort.findAll();
    return stockList;
    // return stockList.map((e) => StockDTO.fromStock(e)).toList();
  }

  save(StockDTO dto, int quantity) {
    var entity = Stock(dto.id, dto.name!, dto.quantity!);
    entity.updateStock(quantity);
    dto.quantity = quantity;
    secundaryPort.save(dto);
  }
}
