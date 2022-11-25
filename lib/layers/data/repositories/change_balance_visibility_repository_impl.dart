import 'package:zelenbank/layers/domain/repositories/change_balance_visibility_repository.dart';

import '../datasources/change_balance_visibility_datasource.dart';

class ChangeBalanceVisibilityRepositoryImpl
    extends ChangeBalanceVisibilityRepository {
  final ChangeBalanceVisibilityDatasource _changeBalanceVisibilityDatasource;
  ChangeBalanceVisibilityRepositoryImpl(
      this._changeBalanceVisibilityDatasource);

  @override
  Future<void> call() async {
    await _changeBalanceVisibilityDatasource();
  }
}