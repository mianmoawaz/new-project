import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_project/auth/view/home_screen.dart';
import 'package:new_project/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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
                    color: Colors.white),
              ),
              SizedBox(
                height: 100.h,
              ),
              Text(
                'Name',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                margin: EdgeInsets.only(right: 30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.person,
                        size: 26,
                        color: Color(0xff904c6e),
                      ),
                      hintText: 'Enter name',
                      hintStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'email',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                margin: EdgeInsets.only(right: 30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.email,
                        size: 26,
                        color: Color(0xff904c6e),
                      ),
                      hintText: 'Enter Email',
                      hintStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'password',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                margin: EdgeInsets.only(right: 30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.password,
                        size: 26,
                        color: Color(0xff904c6e),
                      ),
                      hintText: 'Enter Password',
                      hintStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Next',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(HomeScreen());
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
                    'Already have an account?',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(LoginScreen());
                    },
                    child: Text(' Login',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Color(0xff904c6e),
                        )),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    ))
        // Container(
        //   decoration: BoxDecoration(
        //       gradient: LinearGradient(
        //           colors: [Color(0xFF4A00E0), Color(0xFFFFC0CB)],
        //           begin: Alignment.topLeft,
        //           end: Alignment.bottomRight)),
        //   child: Padding(
        //     padding: const EdgeInsets.all(10.0),
        //     child: SafeArea(
        //         child:
        //             Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //       Text(
        //         'create an account!',
        //         style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        //       ),
        //       Text(
        //         'Sign up screen',
        //         style: TextStyle(
        //             fontSize: 20,
        //             color: Color(0xFF9BA0AB),
        //             fontWeight: FontWeight.normal),
        //       ),
        //       SizedBox(
        //         height: 38,
        //       ),
        //       TextField(
        //         decoration: InputDecoration(
        //             filled: true,
        //             fillColor: Color(0xFFEAEEF5),
        //             prefixIcon: Icon(
        //               Icons.person_outline,
        //             ),
        //             hintText: 'name',
        //             hintStyle: TextStyle(color: Color(0xFF9BA0AB)),
        //             border: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(8),
        //               borderSide: BorderSide.none,
        //             )),
        //       ),
        //       SizedBox(
        //         height: 15,
        //       ),
        //       TextField(
        //         decoration: InputDecoration(
        //             filled: true,
        //             fillColor: Color(0xFFEAEEF5),
        //             prefixIcon: Icon(
        //               Icons.email_outlined,
        //             ),
        //             hintText: 'mian@gmail.com',
        //             hintStyle: TextStyle(color: Color(0xFF9BA0AB)),
        //             border: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(8),
        //               borderSide: BorderSide.none,
        //             )),
        //       ),
        //       SizedBox(
        //         height: 15,
        //       ),
        //       TextField(
        //         decoration: InputDecoration(
        //             filled: true,
        //             fillColor: Color(0xFFEAEEF5),
        //             prefixIcon: Icon(
        //               Icons.lock_outline,
        //             ),
        //             suffix: Icon(Icons.remove_red_eye),
        //             hintText: 'at least 8 character ',
        //             hintStyle: TextStyle(color: Color(0xFF9BA0AB)),
        //             border: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(8),
        //               borderSide: BorderSide.none,
        //             )),
        //       ),
        //       SizedBox(
        //         height: 20,
        //       ),
        //       ElevatedButton(
        //         onPressed: () {
        //           Get.to(SignupScreen());
        //         },
        //         style: ElevatedButton.styleFrom(
        //           fixedSize: Size(double.maxFinite, 55),
        //         ),
        //         child: Text('signup'),
        //       )
        //     ])),
        //   ),
        // ));
        );
  }
}
