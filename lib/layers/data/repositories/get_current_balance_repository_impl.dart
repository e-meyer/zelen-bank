import 'package:zelenbank/layers/data/datasources/get_current_balance_datasource.dart';
import 'package:zelenbank/layers/domain/repositories/get_current_balance_repository.dart';

class GetCurrentBalanceRepositoryImpl implements GetCurrentBalanceRepository {
  final GetCurrentBalanceDatasource _getCurrentBalanceDatasource;
  GetCurrentBalanceRepositoryImpl(this._getCurrentBalanceDatasource);

  @override
  Future<double> call() {
    return _getCurrentBalanceDatasource();
  }
}
