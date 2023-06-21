import 'package:article_hub/core/data/source/local/storage_constant.dart';
import 'package:article_hub/core/utils/sp_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_repository.dart';

class AuthImplementation extends AuthRepository {
  SpUtils spUtils = SpUtils();
  @override
  Future<bool> isAuthenticated() async {
    final accessToken = await spUtils.getString(StorageConstant.accessToken);
    return accessToken != null;
  }

  @override
  Future<void> clearToken() async {
    await spUtils.delete(StorageConstant.accessToken);
  }
}
