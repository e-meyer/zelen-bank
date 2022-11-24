import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';

import '../../domain/repositories/get_transaction_list_repository.dart';
import '../datasources/get_transaction_list_datasource.dart';

class GetTrasactionListRepositoryImpl implements GetTrasactionListRepository {
  final GetTrasactionListDatasource _getTrasactionListDatasource;
  GetTrasactionListRepositoryImpl(this._getTrasactionListDatasource);

  @override
  Future<List<TransactionEntity>> call(int pageNumber) {
    return _getTrasactionListDatasource(pageNumber);
  }
}
