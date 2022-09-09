import 'package:stockkkkkk/domain/dto/stockDTO.dart';

abstract class ServicePrimaryPort {
  Future<List<StockDTO>> findAll();
}
