import 'package:stockkkkkk/infra/adapters/models/stock_model.dart';

class DataStore {
  final Map<String, StockModel> _store = <String, StockModel>{};

  void save(StockModel model) {
    // if (_store.containsKey(identifier)) {
    //   throw DataStoreException(
    //       "Identifier already in store! Use the update method!");
    // }

    _store[model.id.toString()] = model;
  }

  Future<List<StockModel>> findAll() async {
    var modelList = <StockModel>[];
    _store.forEach((key, value) {
      modelList.add(value);
    });

    return modelList;
  }
}

// class DataStoreException implements Exception {
//   final String message;
//
//   DataStoreException(this.message);
// }
