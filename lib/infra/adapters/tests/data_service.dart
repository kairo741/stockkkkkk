import 'package:stockkkkkk/domain/dto/stockDTO.dart';
import 'package:stockkkkkk/domain/entity/stock.dart';
import 'package:stockkkkkk/domain/port/service/stock_service_port.dart';

import 'data_store.dart';

class DataService implements StockServicePort {
  final DataStore store = DataStore();

  DataService();

  @override
  Future<List<StockDTO>> findAll() async {
    var data = await store.findAll();

    List<StockDTO> modelList = data.map((e) => StockDTO(e.id, e.name, e.quantity)).toList();

    return modelList;
  }

  @override
  save(StockDTO dto) {
    Stock entity = Stock(dto.id, dto.name!, dto.quantity!);
    store.save(entity);
  }
}
