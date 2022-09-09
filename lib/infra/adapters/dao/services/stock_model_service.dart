import 'package:get_it/get_it.dart';
import 'package:stockkkkkk/domain/dto/stockDTO.dart';
import 'package:stockkkkkk/domain/port/service/primary_port.dart';
import 'package:stockkkkkk/domain/port/service/secundary_port.dart';
import 'package:stockkkkkk/infra/adapters/models/stock_model.dart';

import '../interfaces/stock_dao.dart';

class StockModelServiceImpl implements ServicePrimaryPort, ServiceSecundaryPort {
  final _dao = GetIt.I.get<StockDAO>();

  @override
  save(StockDTO dto) async {
    var model = StockModel.fromDTO(dto);
    validate(model);
    await _dao.save(model);
  }

  remove(int id) {
    _dao.remove(id);
  }

  Future<List<StockModel>> find(int id) {
    return _dao.find(id);
  }

  @override
  Future<List<StockDTO>> findAll() async {
    var list = await _dao.findAll();

    var modelList = list.map<StockDTO>((e) => e.toDTO()).toList();

    return modelList;
  }

  validate(StockModel stock) {
    if (stock.name == null) {
      throw Exception("O nome é obrigatório!");
    }
  }
}
