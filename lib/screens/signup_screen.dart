import 'package:flutter/material.dart';
import 'package:jawla_app/components/button.dart';
import 'package:jawla_app/components/modal_bottom_sheet.dart';
import 'package:jawla_app/components/text_field.dart';
import 'package:jawla_app/extensions/format.dart';
import 'package:jawla_app/extensions/navigators.dart';
import 'package:jawla_app/screens/login_screen.dart';
import 'package:jawla_app/services/api/auth/signup_response.dart';

import '../constants/app_styles.dart';
import '../constants/constants.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/login_signup/signup_page_bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Create New Account Text
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Create New Account",
                      style: headLineStyle1.copyWith(color: primaryColor)),
                ),
                height24,

                // Textfields
                CustomTextField(
                  hint: "Name",
                  iconName: Icons.person_outlined,
                  controller: nameController,
                ),
                CustomTextField(
                  hint: "Email",
                  iconName: Icons.email_outlined,
                  controller: emailController,
                ),
                CustomTextField(
                  hint: "Phone",
                  iconName: Icons.phone_iphone_outlined,
                  controller: phoneController,
                ),
                CustomTextField(
                  hint: "Password",
                  iconName: Icons.lock_outline_rounded,
                  controller: passwordController,
                  isPassword: true,
                ),
                CustomTextField(
                  hint: "Confirm password",
                  iconName: Icons.lock_outline_rounded,
                  controller: confirmPasswordController,
                  isPassword: true,
                ),
                height16,
                CustomButton(
                  text: "Create Account",
                  onPressed: () async {
                    // if all fields not empty
                    if (nameController.text.isNotEmpty &&
                        emailController.text.isNotEmpty &&
                        phoneController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty) {
                      // if password matches confirm password
                      if (confirmPasswordController.text ==
                          passwordController.text) {
                        // if email is valid
                        if (emailController.text.isValidEmail) {
                          if (phoneController.text.isValidPhone) {
                            final response = await signupResponse(body: {
                              "name": nameController.text,
                              "email": emailController.text,
                              "phone": phoneController.text,
                              "password": passwordController.text
                            });

                            if (response.statusCode == 200) {
                              print(response.body);
                              opensheet(context, signupDone(context));
                            } else {
                              print(response.body);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Error"),
                                ),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Phone is not valid"),
                              ),
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Email is not valid"),
                            ),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Password does not match"),
                          ),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please enter all fields"),
                        ),
                      );
                    }
                  },
                ),
                height24,

                // Already have an account?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account? ",
                      style: haveAccountStyle,
                    ),
                    InkWell(
                      onTap: () {
                        context.push(screen: const LoginScreen());
                      },
                      child: Text(
                        "Login",
                        style: haveAccountStyle.copyWith(color: primaryColor),
                      ),
                    ),
                  ],
                ),
                height96
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget signupDone(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 244, 244, 244),
          borderRadius: BorderRadius.circular(20)),
      height: 400,
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height32,
            const Icon(Icons.done_outline_outlined),
            height24,
            const Text(
              "Your account has been created successfully",
              style: TextStyle(fontSize: 16),
            ),
            height48,
            Center(
              child: CustomButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.push(screen: const LoginScreen());
                  },
                  text: "Continue"),
            )
          ],
        ),
      ),
    );
  }
}
