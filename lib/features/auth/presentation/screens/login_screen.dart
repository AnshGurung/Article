//import 'package:article_hub/core/presentation/theme/colours.dart';
import 'package:article_hub/core/presentation/utils/spacing.dart';
import 'package:article_hub/features/auth/controllers/network_controller.dart';
import 'package:article_hub/features/auth/controllers/signup_controller.dart';
import 'package:article_hub/features/auth/presentation/dialog_box/network_error_dialog_box.dart';
import 'package:article_hub/features/auth/presentation/screens/login_message.dart';
import 'package:article_hub/features/auth/presentation/screens/signup_messge.dart';
import 'package:article_hub/features/auth/presentation/widgets/flat_button.dart';
import 'package:article_hub/features/auth/presentation/widgets/text_bar.dart';
import 'package:article_hub/features/auth/presentation/widgets/touch_blocker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  SignUpController signUpController = Get.put(SignUpController());
  LoginController loginController = Get.put(LoginController());
  NetworkController networkController = Get.put(NetworkController());
  //TEXT MESSAGES

  //BOOLEANS
  RxBool isNewUser = false.obs;

  //PADDINGS
  EdgeInsets verticalPadding = const EdgeInsets.symmetric(vertical: 20);

  //CONTROLLERS
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        isNewUser.value ? 'Sign up' : 'Login',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      Padding(
                        padding: verticalPadding,
                        child: SizedBox(
                          child: Column(
                            children: [
                              TextBar(
                                leadingIcon: Icons.mail_rounded,
                                promptText: 'Email',
                                controller: emailController,
                                errorText: 'Invalid email',
                                keyboardInputType: TextInputType.emailAddress,
                              ),
                              isNewUser.value
                                  ? Padding(
                                      padding: verticalPadding,
                                      child: TextBar(
                                        leadingIcon: Icons.person,
                                        promptText: 'Username',
                                        controller: usernameController,
                                        errorText: 'Invalid username',
                                        keyboardInputType: TextInputType.name,
                                      ),
                                    )
                                  : Spacing.sizedBoxHLarge,
                              TextBar(
                                leadingIcon: Icons.lock,
                                promptText: 'Password',
                                tailIcon: Icons.visibility,
                                isVisible: true,
                                controller: passwordController,
                                errorText: 'Invalid password',
                                keyboardInputType: TextInputType.name,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Obx(
                        () => FlatButton(
                          buttonText: isNewUser.value ? 'Sign up' : 'Login',
                          onClicked: () {
                            if (networkController.isOnline.value) {
                              if (formKey.currentState!.validate()) {
                                isNewUser.value
                                    ? signUpController.signUpWithEmail(
                                        emailController.text,
                                        passwordController.text,
                                        usernameController.text,
                                      )
                                    : loginController.loginWithEmail(
                                        emailController.text,
                                        passwordController.text,
                                      );
                              }
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return NetworkErrorDialogBox();
                                },
                              );
                            }
                            //print('¿How?');
                            // Get.snackbar(
                            //   '',
                            //   'I get it, you can click the buttons',
                            //   colorText: Colors.white,
                            //   backgroundColor: primaryColor1,
                            // );
                          },
                        ),
                      ),
                      Spacing.sizedBoxHLarge,
                      GestureDetector(
                        onTap: () {
                          isNewUser.value = !isNewUser.value;
                        },
                        child: Obx(
                          () => isNewUser.value
                              ? const LoginMessage()
                              : const SignupMessage(),
                        ),
                      ),
                    ],
                  ),
                ),
                loginController.isLoading.value ||
                        signUpController.isLoading.value
                    ? const TouchBlocker()
                    : const SizedBox(),
              ],
            ),
          ),
        ));
  }
}
