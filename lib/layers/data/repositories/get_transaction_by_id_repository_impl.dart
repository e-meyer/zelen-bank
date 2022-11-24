import 'package:zelenbank/layers/data/datasources/get_transaction_by_id_datasource.dart';
import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';
import 'package:zelenbank/layers/domain/repositories/get_transaction_by_id_repository.dart';

class GetTransactionByIdRepositoryImpl implements GetTransactionByIdRepository {
  final GetTransactionByIdDatasource _getTransactionByIdDatasource;
  GetTransactionByIdRepositoryImpl(this._getTransactionByIdDatasource);

  @override
  Future<TransactionEntity> call(String id) {
    return _getTransactionByIdDatasource(id);
  }
}
