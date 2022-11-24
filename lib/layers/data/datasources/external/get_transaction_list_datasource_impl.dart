import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';

import '../get_transaction_list_datasource.dart';

class GetTrasactionListDatasourceImpl implements GetTrasactionListDatasource {
  @override
  Future<List<TransactionEntity>> call(int pageNumber) {
    throw UnimplementedError();
  }
}
