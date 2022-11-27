import 'package:shared_preferences/shared_preferences.dart';
import 'package:zelenbank/core/utils/constants/local_storage_constants.dart';
import 'package:zelenbank/layers/data/datasources/change_balance_visibility_datasource.dart';

class ChangeBalanceVisibilityDatasourceImpl
    implements ChangeBalanceVisibilityDatasource {
  final SharedPreferences sharedPreferences;
  ChangeBalanceVisibilityDatasourceImpl(this.sharedPreferences);

  @override
  Future<bool> call(bool isBalanceVisible) async {
    await sharedPreferences.setBool(kSharedPreferencesKey, !isBalanceVisible);
    return !isBalanceVisible;
  }
}
