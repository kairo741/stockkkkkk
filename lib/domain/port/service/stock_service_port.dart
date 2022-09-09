import 'package:stockkkkkk/domain/dto/stockDTO.dart';

abstract class StockServicePort {
  Future<List<StockDTO>> findAll();

  save(StockDTO dto) ;
}
