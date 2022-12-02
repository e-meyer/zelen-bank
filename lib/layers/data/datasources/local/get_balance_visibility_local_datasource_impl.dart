import 'package:shared_preferences/shared_preferences.dart';
import 'package:zelenbank/core/utils/constants/local_storage_constants.dart';
import 'package:zelenbank/layers/data/datasources/get_balance_visibility_datasource.dart';

class GetBalanceVisibilityDatasourceImpl
    implements GetBalanceVisibilityDatasource {
  final SharedPreferences sharedPreferences;
  GetBalanceVisibilityDatasourceImpl(this.sharedPreferences);

  @override
  Future<bool> call() async {
    if (sharedPreferences.containsKey(kSharedPreferencesKey)) {
      return sharedPreferences.getBool(kSharedPreferencesKey)!;
    }
    await sharedPreferences.setBool(kSharedPreferencesKey, true);
    return true;
  }
}
