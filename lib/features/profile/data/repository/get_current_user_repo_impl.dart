import 'dart:convert';
import 'package:article_hub/core/data/source/remote/api_result.dart';
import 'package:article_hub/features/auth/controllers/network_controller.dart';
import 'package:article_hub/features/profile/data/models/response/get_user_profile.dart';
import 'package:article_hub/features/profile/data/source/remote/get_current_user_remote_data_source.dart';
import 'package:article_hub/features/profile/domain/get_current_user_repo.dart';

class GetCurrentUserRepoImpl implements GetCurrentUserRepo {
  GetCurrentUserRemoteDataSource getCurrentUserRemoteDataSource;

  GetCurrentUserRepoImpl({required this.getCurrentUserRemoteDataSource});
  late GetProfileResponse getProfileResponse;

  @override
  getCurrentUser() async {
    NetworkController networkController = NetworkController();
    if (networkController.isOnline.value) {
      try {
        final response = await getCurrentUserRemoteDataSource.getUser();
        var data = jsonDecode(response.toString());
        getProfileResponse = GetProfileResponse.fromJson(data);
        return ApiResponse(data: getProfileResponse);
      } on Exception catch (e) {
        print(e);
      }
    }
  }
}
