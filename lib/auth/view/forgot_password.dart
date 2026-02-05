import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_project/controller/auth_controller.dart';
import 'package:new_project/field/common_textfield.dart';
import 'package:new_project/login_screen.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: authController.formkey,
      child: Container(
          child: Stack(children: [
        Image.asset(
          'assets/WhatsApp Image 2025-11-13 at 22.48.01_754cc587.jpg',
          fit: BoxFit.cover,
          width: 450.w,
        ),
        Padding(
            padding: const EdgeInsets.only(left: 30),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  children: [
                    Text(
                      'Forgot\n password',
                      style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
              Text('Email',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff3f3d65),
                  )),
              SizedBox(
                height: 10.h,
              ),
              CommonTextField(
                controller: authController.email,
                hintText: 'Enter Email',
                prefixIcon: Icons.email,
              ),
              SizedBox(
                height: 150.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(LoginScreen());
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
                        authController.forgotPassword();
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
            ]))
      ])),
    ));
  }
}
