import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';
import 'package:zelenbank/layers/domain/usecases/get_transaction_list/get_transaction_list_usecase.dart';

import '../../repositories/get_transaction_list_repository.dart';

class GetTransactionListUsecaseImpl implements GetTransactionListUsecase {
  final GetTransactionListRepository _getTrasactionListRepository;
  GetTransactionListUsecaseImpl(this._getTrasactionListRepository);

  @override
  Future<List<TransactionEntity>> call(int pageNumber) {
    return _getTrasactionListRepository(pageNumber);
  }
}
