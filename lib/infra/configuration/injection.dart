import 'package:get_it/get_it.dart';
import 'package:stockkkkkk/infra/adapters/dao/stock_dao_impl.dart';
import 'package:stockkkkkk/infra/adapters/interfaces/stock_dao.dart';
import 'package:stockkkkkk/infra/adapters/services/stock_model_service.dart';

setupInjection() async {
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<StockDAO>(StockDAOImpl());
  getIt.registerSingleton<StockModelServiceImpl>(StockModelServiceImpl());
}
