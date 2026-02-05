import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_project/controller/auth_controller.dart';
import 'package:new_project/field/common_textfield.dart';
import 'package:new_project/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: authController.formkey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Stack(
              children: [
                Image.asset(
                  'assets/WhatsApp Image 2025-11-13 at 22.48.01_754cc587.jpg',
                  fit: BoxFit.cover,
                  width: 450.w,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'create an\n account',
                        style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 100.h),
                      Text('Name',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                      SizedBox(height: 10.h),
                      CommonTextField(
                        validator: (Value) {
                          if (Value == null || Value.isEmpty)
                            return 'Please enter your name';
                          return null;
                        },
                        hintText: 'Enter Name',
                        controller: authController.name,
                        prefixIcon: Icons.person,
                      ),
                      SizedBox(height: 10.h),
                      Text('Email',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                      SizedBox(height: 10.h),
                      CommonTextField(
                        validator: (Value) {
                          if (Value == null || Value.isEmpty)
                            return 'Please enter your email';
                          if (!GetUtils.isEmail(Value))
                            return 'Please enter a valid email';
                          return null;
                        },
                        hintText: 'Enter Email',
                        controller: authController.email,
                        prefixIcon: Icons.email,
                      ),
                      SizedBox(height: 10.h),
                      Text('Password',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                      SizedBox(height: 10.h),
                      CommonTextField(
                        validator: (Value) {
                          if (Value == null || Value.isEmpty)
                            return 'Please enter your password';
                          if (Value.length < 6)
                            return 'Password must be at least 6 characters';
                          return null;
                        },
                        hintText: 'Enter Password',
                        controller: authController.password,
                        prefixIcon: Icons.password,
                      ),
                      SizedBox(height: 40.h),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0, right: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Next',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            GestureDetector(
                              onTap: () => authController.signup(),
                              child: Container(
                                height: 60,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xff904c6e),
                                  borderRadius: BorderRadius.circular(60),
                                ),
                                child: Icon(Icons.arrow_forward,
                                    color: Colors.white, size: 40),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 50.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account?',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          GestureDetector(
                            onTap: () => Get.to(LoginScreen()),
                            child: Text(' Login',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xff904c6e))),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
