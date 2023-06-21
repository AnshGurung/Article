import 'dart:convert';
import 'package:article_hub/core/data/source/local/storage_constant.dart';
import 'package:article_hub/core/presentation/theme/api_endpoints.dart';
import 'package:article_hub/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
//import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/utils/sp_utils.dart';
import '../../home/presentation/screens/home_screen.dart';

class LoginController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    isLogin();
  }

  SpUtils spUtils = SpUtils();
  Future<void> isLogin() async {
    var token = await spUtils.getString(StorageConstant.accessToken);
    if (token != null) {
      Get.to(const HomeScreen());
    } else {
      Get.to(const LoginScreen());
    }
  }

  void logOut() {
    spUtils.delete(StorageConstant.accessToken);
    Get.offAll(const LoginScreen());
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isLoading = false.obs;
  //final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loginWithEmail(String name, String password) async {
    final url =
        Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.loginEmail);
    try {
      final headers = {'Content-Type': 'application/json'};
      final body = jsonEncode({
        'user': {
          'email': name,
          'password': password,
        }
      });

      isLoading.value = true;
      final response = await http.post(url, headers: headers, body: body);
      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        var token = json['user']['token'];
        await spUtils.setString(StorageConstant.accessToken, token);

        // await pref.setString('token', token);
        // Request successfulR
        Get.snackbar(
          'Success',
          'Login successful',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        // print('Request successful');
        // print(response.body);
        isLoading.value = false;
        Get.offAll(const HomeScreen());
      } else {
        // Request failed
        Get.snackbar(
          'Error',
          '${response.statusCode}! Login failed',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        isLoading.value = false;
        // print('Request failed with status: ${response.statusCode}');
        // print(response.body);
      }
    } on Exception catch (e) {
      //print(e);
      Get.snackbar(
        'Error occured!',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
