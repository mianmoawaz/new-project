import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_project/auth/view/forgot_password.dart';
import 'package:new_project/auth/view/signup_screen.dart';
import 'package:new_project/controller/auth_controller.dart';
import 'package:new_project/field/common_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: authController.formkey,
      child: Container(
        child: Stack(
          children: [
            Image.asset(
              'assets/WhatsApp Image 2025-11-13 at 22.48.01_754cc587.jpg',
              fit: BoxFit.cover,
              width: 450.w,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50, top: 50),
                    child: Row(
                      children: [
                        Text(
                          'Welcome\n back!',
                          style: TextStyle(
                              fontSize: 35.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  Text('email',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff3f3d65),
                      )),
                  SizedBox(
                    height: 10.h,
                  ),
                  CommonTextField(
                    validator: (Value) {
                      if (Value == null || Value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!GetUtils.isEmail(Value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    hintText: 'Enter email',
                    controller: authController.email,
                    prefixIcon: Icons.email,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    'password',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff3f3d65),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CommonTextField(
                    validator: (Value) {
                      if (Value == null || Value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (Value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    hintText: 'Enter password',
                    controller: authController.password,
                    prefixIcon: Icons.password,
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {
                            Get.to(ForgotPassword());
                          },
                          child: Text(
                            'forgot password',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w900,
                                color: Colors.black),
                          ))),
                  SizedBox(
                    height: 40.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(SignupScreen());
                          },
                          child: Text(
                            'Next',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            authController.signin();
                            // Get.to(HomeScreen());
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Color(0xff904c6e),
                                borderRadius: BorderRadius.circular(60)),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dont have an account?',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Colors.black),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(SignupScreen());
                        },
                        child: Text(' Signup',
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w900,
                              color: Color(0xff904c6e),
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
