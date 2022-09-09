import 'package:stockkkkkk/domain/dto/stockDTO.dart';
import 'package:stockkkkkk/domain/port/service/primary_port.dart';
import 'package:stockkkkkk/domain/port/service/secundary_port.dart';
import 'package:stockkkkkk/infra/adapters/models/stock_model.dart';

import 'data_store.dart';

class DataService implements ServicePrimaryPort, ServiceSecundaryPort {
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
    var model = StockModel.fromDTO(dto);
    store.save(model);
  }
}
