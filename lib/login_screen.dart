import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_project/auth/view/home_screen.dart';
import 'package:new_project/auth/view/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                        hintStyle: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
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
                Container(
                  margin: EdgeInsets.only(right: 30),
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.password,
                          size: 35,
                          color: Color(0xff904c6e),
                        ),
                        hintText: 'Enter Password',
                        hintStyle: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
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
                      GestureDetector(
                        onTap: () {
                          Get.to(HomeScreen());
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Container(
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
    )

        //  Padding(
        //   padding: const EdgeInsets.all(10.0),
        //   child: SafeArea(
        //       child:
        //           Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //     Text(
        //       'welcome to flutter',
        //       style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        //     ),
        //     Text(
        //       'start flutter ui design',
        //       style: TextStyle(
        //           fontSize: 17,
        //           color: Color(0xFF9BA0AB),
        //           fontWeight: FontWeight.normal),
        //     ),
        //     SizedBox(
        //       height: 38,
        //     ),
        //     TextField(
        //       decoration: InputDecoration(
        //           filled: true,
        //           fillColor: Color(0xFFEAEEF5),
        //           prefixIcon: Icon(
        //             Icons.email_outlined,
        //           ),
        //           hintText: 'mian@gmail.com',
        //           hintStyle: TextStyle(color: Color(0xFF9BA0AB)),
        //           border: OutlineInputBorder(
        //             borderRadius: BorderRadius.circular(8),
        //             borderSide: BorderSide.none,
        //           )),
        //     ),
        //     SizedBox(
        //       height: 15,
        //     ),
        //     TextField(
        //       decoration: InputDecoration(
        //           filled: true,
        //           fillColor: Color(0xFFEAEEF5),
        //           prefixIcon: Icon(
        //             Icons.lock_outline,
        //           ),
        //           suffix: Icon(Icons.remove_red_eye),
        //           hintText: 'at least 8 character ',
        //           hintStyle: TextStyle(color: Color(0xFF9BA0AB)),
        //           border: OutlineInputBorder(
        //             borderRadius: BorderRadius.circular(8),
        //             borderSide: BorderSide.none,
        //           )),
        //     ),
        //     Align(
        //         alignment: Alignment.centerRight,
        //         child:
        //             TextButton(onPressed: () {}, child: Text('forgot password'))),
        //     ElevatedButton(
        //       onPressed: () {
        //         Get.to(SignupScreen());
        //       },
        //       style:
        //           ElevatedButton.styleFrom(fixedSize: Size(double.maxFinite, 55)),
        //       child: Text('login'),
        //     )
        //   ])),
        // ),
        );
  }
}
