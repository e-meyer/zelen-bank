import 'package:zelenbank/layers/domain/usecases/get_current_balance_usecase/get_current_balance_usecase.dart';

import '../../repositories/get_current_balance_repository.dart';

class GetCurrentBalanceUsecaseImpl implements GetCurrentBalanceUsecase {
  final GetCurrentBalanceRepository _getCurrentBalanceRepository;
  GetCurrentBalanceUsecaseImpl(this._getCurrentBalanceRepository);

  @override
  Future<double> call() async {
    return await _getCurrentBalanceRepository();
  }
}
