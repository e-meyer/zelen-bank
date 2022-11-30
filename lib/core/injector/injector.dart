import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zelenbank/core/http_client/http_client.dart';
import 'package:zelenbank/core/http_client/http_client_interface.dart';
import 'package:zelenbank/layers/data/datasources/change_balance_visibility_datasource.dart';
import 'package:zelenbank/layers/data/datasources/get_balance_visibility_datasource.dart';
import 'package:zelenbank/layers/data/datasources/get_current_balance_datasource.dart';
import 'package:zelenbank/layers/data/datasources/get_transaction_by_id_datasource.dart';
import 'package:zelenbank/layers/data/datasources/get_transaction_list_datasource.dart';
import 'package:zelenbank/layers/data/datasources/local/change_balance_visibility_local_datasource_impl.dart';
import 'package:zelenbank/layers/data/datasources/local/get_balance_visibility_local_datasource_impl.dart';
import 'package:zelenbank/layers/data/datasources/remote/get_current_balance_remote_datasource_impl.dart';
import 'package:zelenbank/layers/data/datasources/remote/get_transaction_by_id_remote_datasource_impl.dart';
import 'package:zelenbank/layers/data/datasources/remote/get_transaction_list_remote_datasource_impl.dart';
import 'package:zelenbank/layers/data/repositories/change_balance_visibility_repository_impl.dart';
import 'package:zelenbank/layers/data/repositories/get_balance_visibility_resository_impl.dart';
import 'package:zelenbank/layers/data/repositories/get_current_balance_repository_impl.dart';
import 'package:zelenbank/layers/data/repositories/get_transaction_by_id_repository_impl.dart';
import 'package:zelenbank/layers/data/repositories/get_transaction_list_repository_impl.dart';
import 'package:zelenbank/layers/domain/repositories/change_balance_visibility_repository.dart';
import 'package:zelenbank/layers/domain/repositories/get_balance_visibility_resository.dart';
import 'package:zelenbank/layers/domain/repositories/get_current_balance_repository.dart';
import 'package:zelenbank/layers/domain/repositories/get_transaction_by_id_repository.dart';
import 'package:zelenbank/layers/domain/repositories/get_transaction_list_repository.dart';
import 'package:zelenbank/layers/domain/usecases/change_balance_visibility/change_balance_visibility_usecase.dart';
import 'package:zelenbank/layers/domain/usecases/change_balance_visibility/change_balance_visibility_usecase_impl.dart';
import 'package:zelenbank/layers/domain/usecases/get_balance_visibility/get_balance_visibility_usecase.dart';
import 'package:zelenbank/layers/domain/usecases/get_balance_visibility/get_balance_visibility_usecase_impl.dart';
import 'package:zelenbank/layers/domain/usecases/get_current_balance_usecase/get_current_balance_usecase.dart';
import 'package:zelenbank/layers/domain/usecases/get_current_balance_usecase/get_current_balance_usecase_impl.dart';
import 'package:zelenbank/layers/domain/usecases/get_transaction_by_id/get_transaction_by_id_usecase.dart';
import 'package:zelenbank/layers/domain/usecases/get_transaction_by_id/get_transaction_by_id_usecase_impl.dart';
import 'package:zelenbank/layers/domain/usecases/get_transaction_list/get_transaction_list_usecase.dart';
import 'package:zelenbank/layers/domain/usecases/get_transaction_list/get_transaction_list_usecase_impl.dart';
import 'package:zelenbank/layers/presentation/controllers/transaction_controller.dart';
import 'package:http/http.dart' as http;

final GetIt serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  // Usecases
  serviceLocator.registerLazySingleton<GetCurrentBalanceUsecase>(
      () => GetCurrentBalanceUsecaseImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<GetTransactionByIdUsecase>(
      () => GetTransactionByIdUsecaseImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<GetTransactionListUsecase>(
      () => GetTransactionListUsecaseImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<ChangeBalanceVisibilityUsecase>(
      () => ChangeBalanceVisibilityUsecaseImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<GetBalanceVisibilityUsecase>(
      () => GetBalanceVisibilityUsecaseImpl(serviceLocator()));

  // Repositories
  serviceLocator.registerLazySingleton<GetCurrentBalanceRepository>(
      () => GetCurrentBalanceRepositoryImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<GetTransactionByIdRepository>(
      () => GetTransactionByIdRepositoryImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<GetTransactionListRepository>(
      () => GetTransactionListRepositoryImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<ChangeBalanceVisibilityRepository>(
      () => ChangeBalanceVisibilityRepositoryImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<GetBalanceVisibilityRepository>(
      () => GetBalanceVisibilityRepositoryImpl(serviceLocator()));

  // Datasources
  serviceLocator.registerLazySingleton<GetCurrentBalanceDatasource>(
      () => GetCurrentBalanceRemoteDatasourceImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<GetTransactionByIdDatasource>(
      () => GetTransactionByIdRemoteDatasourceImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<GetTransactionListDatasource>(
      () => GetTransactionListRemoteDatasourceImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<ChangeBalanceVisibilityDatasource>(
      () => ChangeBalanceVisibilityLocalDatasourceImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<GetBalanceVisibilityDatasource>(
      () => GetBalanceVisibilityDatasourceImpl(serviceLocator()));

  // Controllers
  serviceLocator.registerLazySingleton<TransactionController>(
    () => TransactionController(
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
    ),
  );

  // Remote
  serviceLocator.registerLazySingleton<http.Client>(
    () => http.Client(),
  );
  serviceLocator.registerLazySingleton<IHttpClient>(
    () => HttpClient(serviceLocator()),
  );

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  // Local
  serviceLocator
      .registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}
