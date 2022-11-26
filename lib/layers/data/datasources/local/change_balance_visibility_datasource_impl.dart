import 'package:shared_preferences/shared_preferences.dart';
import 'package:zelenbank/layers/data/datasources/change_balance_visibility_datasource.dart';

class ChangeBalanceVisibilityDatasourceImpl
    implements ChangeBalanceVisibilityDatasource {
  final SharedPreferences sharedPreferences;
  ChangeBalanceVisibilityDatasourceImpl(this.sharedPreferences);

  @override
  Future<void> call() {
    throw UnimplementedError();
  }
}
