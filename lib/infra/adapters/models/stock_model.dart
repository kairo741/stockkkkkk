// ignore_for_file: constant_identifier_names

import 'package:stockkkkkk/domain/entity/stock.dart';

class StockModel {
  static const String ID = 'id';
  static const String NAME = 'name';
  static const String QUANTITY = 'quantity';
  static const String STATUS = 'status';
  static const String CREATE_DATE = 'create_date';

  int? id;
  String? name;
  int quantity = 0;
  String status = 'A';
  DateTime? createDate;

  StockModel(
      {this.id, required this.name, required this.quantity, required this.status , this.createDate});

  StockModel.fromStock(Stock stock) {
    id = stock.id;
    name = stock.name;
    quantity = stock.quantity;
    status = 'A';
  }

  toStock() {
    return Stock(id, name!, quantity);
  }
}
