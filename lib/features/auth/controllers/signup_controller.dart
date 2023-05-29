import 'dart:convert';
import 'package:article_hub/core/presentation/theme/api_endpoints.dart';
import 'package:article_hub/features/home/presentation/screens/home_screen.dart';
// import 'package:article_hub/features/auth/presentation/widgets/user_model.dart';
// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SignUpController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  RxBool isLoading = false.obs;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> signUpWithEmail(
      String email, String password, String username) async {
    try {
      final url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.signUpEmail);
      final headers = {'Content-Type': 'application/json'};
      final body = jsonEncode({
        'user': {
          'email': email,
          'password': password,
          'username': username,
        }
      });
      isLoading.value = true;
      final response = await http.post(url, headers: headers, body: body);
      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var token = json['user']['token'];
        final SharedPreferences prefs = await _prefs;
        await prefs.setString('token', token);
        // Request successful
        Get.snackbar(
          'Success',
          'User created successfully',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        usernameController.clear();
        emailController.clear();
        passwordController.clear();
        isLoading.value = false;
        Get.offAll(const HomeScreen());
        // print('Request successful');
        // print(response.body);
      } else {
        // Request failed
        Get.snackbar(
          'Error',
          '${response.statusCode}! User creation failed',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        isLoading.value = false;
        // print('Request failed with status: ${response.statusCode}');
        // print(response.body);
      }
    } on Exception catch (e) {
      print(e);
      Get.snackbar(
        'Error occured!',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
    update();
  }
}
