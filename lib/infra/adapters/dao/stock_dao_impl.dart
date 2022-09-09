import 'package:sqflite/sqflite.dart';
import 'package:stockkkkkk/infra/adapters/dao/interfaces/stock_dao.dart';
import 'package:stockkkkkk/infra/adapters/models/stock_model.dart';

import '../../configuration/connection.dart';

class StockDAOImpl implements StockDAO {
  Database? _db;
  var sql;

  @override
  Future<List<StockModel>> find(int id) async {
    _db = await Connection.get();
    List<Map<String, dynamic>> result = await _db!.query('stock', where: "id = $id");
    List<StockModel> resultList = List.generate(result.length, (index) {
      var row = result[index];
      return StockModel(
        id: row[StockModel.ID],
        name: row[StockModel.NAME],
        quantity: row[StockModel.QUANTITY],
        status: row[StockModel.STATUS],
        createDate: DateTime.parse(row[StockModel.CREATE_DATE]),
      );
    });
    return resultList;
  }

  @override
  Future<List<StockModel>> findAll() async {
    _db = await Connection.get();
    List<Map<String, dynamic>> result = await _db!.query('stock', limit: 100);
    List<StockModel> resultList = List.generate(result.length, (index) {
      var row = result[index];
      return StockModel(
        id: row[StockModel.ID],
        name: row[StockModel.NAME],
        quantity: (row[StockModel.QUANTITY]),
        status: row[StockModel.STATUS],
        createDate: DateTime.parse(row[StockModel.CREATE_DATE]),
      );
    });
    return resultList;
  }

  @override
  remove(int id) async {
    _db = await Connection.get();
    sql = "DELETE FROM stock WHERE id =? ";
    _db!.rawDelete(sql, [id]);
  }

  @override
  save(StockModel stock) async {
    _db = await Connection.get();
    if (stock.id == null) {
      sql = """INSERT INTO stock (name, quantity) VALUES(?,?) """;
      _db!.rawInsert(sql, [stock.name, stock.quantity]);
    } else {
      sql = "UPDATE stock SET name=?, quantity=? WHERE id=?";
      await _db!.rawUpdate(sql, [stock.name, stock.quantity, stock.id]);
    }
  }
}
