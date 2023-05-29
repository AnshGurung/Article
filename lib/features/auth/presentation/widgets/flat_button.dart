import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/presentation/theme/colours.dart';
import '../../controllers/login_controller.dart';
import '../../controllers/signup_controller.dart';

// ignore: must_be_immutable
class FlatButton extends StatelessWidget {
  String buttonText;
  VoidCallback onClicked;
  FlatButton({
    super.key,
    required this.buttonText,
    required this.onClicked,
  });

  SignUpController signUpController = Get.put(SignUpController());
  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClicked,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: primaryColor1,
        ),
        child: Obx(
          () => Center(
            child: signUpController.isLoading.value ||
                    loginController.isLoading.value
                ? const SizedBox(
                    width: 15,
                    height: 15,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 3.5,
                    ),
                  )
                : Text(
                    buttonText,
                    style: const TextStyle(color: Colors.white),
                  ),
          ),
        ),
      ),
    );
  }
}
