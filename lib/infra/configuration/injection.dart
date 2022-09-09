import 'package:get_it/get_it.dart';
import 'package:stockkkkkk/domain/port/service/primary_port.dart';
import 'package:stockkkkkk/domain/port/service/secundary_port.dart';
import 'package:stockkkkkk/infra/adapters/dao/interfaces/stock_dao.dart';
import 'package:stockkkkkk/infra/adapters/dao/services/stock_model_service.dart';
import 'package:stockkkkkk/infra/adapters/dao/stock_dao_impl.dart';

setupInjection() async {
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<StockDAO>(StockDAOImpl());

  getIt.registerSingleton<ServicePrimaryPort>(StockModelServiceImpl());
  getIt.registerSingleton<ServiceSecundaryPort>(StockModelServiceImpl());
  getIt.registerSingleton<StockModelServiceImpl>(StockModelServiceImpl());
}
