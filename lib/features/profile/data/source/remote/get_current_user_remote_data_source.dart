import 'package:article_hub/core/data/source/local/storage_constant.dart';
import 'package:article_hub/core/presentation/theme/api_endpoints.dart';
import 'package:article_hub/core/utils/sp_utils.dart';
import 'package:http/http.dart' as http;

abstract class GetCurrentUserRemoteDataSource {
  getUser();
}

class GetCurrentUserRemoteDataSourceImpl
    implements GetCurrentUserRemoteDataSource {
  @override
  getUser() {
    SpUtils spUtils = SpUtils();
    final token = spUtils.getString(StorageConstant.accessToken);

    return http.get(
      Uri.parse("${ApiEndPoints.baseUrl}/user"),
      headers: <String, String>{'Authorization': 'Token $token'},
    );
  }
}
