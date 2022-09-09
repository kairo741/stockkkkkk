import 'package:stockkkkkk/domain/entity/stock.dart';

class StockDTO {
  int? id;
  String? name;
  int? quantity;

  StockDTO(this.id, this.name, this.quantity);

  StockDTO.fromStock(Stock stock) {
    id = stock.id;
    name = stock.name;
    quantity = stock.quantity;
  }

  @override
  bool operator ==(Object other) {
    other = other as StockDTO;
    if (other.id == id && other.name == name && other.quantity == quantity) {
      return true;
    } else {
      return false;
    }
  }
}
