import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:new_project/auth/view/Add_expense.dart';
import 'package:new_project/auth/view/Add_income.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 45, left: 20),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xffee6856),
                    ),
                    child: Icon(Icons.arrow_back),
                  ),
                ),
                SizedBox(
                  width: 120.w,
                ),
                Text(
                  'profile',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(100),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  'assets/moawaz.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              margin: EdgeInsets.only(left: 20, right: 20),
              height: 65,
              width: 400,
              decoration: BoxDecoration(
                  color: Color.fromARGB(227, 238, 104, 86),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 40,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    children: [
                      Text(
                        'Name',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Mian Moawaz',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 65,
              width: 400,
              decoration: BoxDecoration(
                  color: Color.fromARGB(227, 238, 104, 86),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 40,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 80),
                        child: Text(
                          'Email',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        'mianmoawaz0@gmail.com',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            GestureDetector(
              onTap: () {
                Get.to(AddExpense());
              },
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                margin: EdgeInsets.only(left: 20, right: 20),
                height: 65,
                width: 400,
                decoration: BoxDecoration(
                    color: Color.fromARGB(227, 238, 104, 86),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    Icon(
                      Icons.credit_card,
                      color: Colors.white,
                      size: 40,
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      'Add Expense',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            GestureDetector(
              onTap: () {
                Get.to(AddIncome());
              },
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                margin: EdgeInsets.only(left: 20, right: 20),
                height: 65,
                width: 400,
                decoration: BoxDecoration(
                    color: Color.fromARGB(227, 238, 104, 86),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    Icon(
                      Icons.attach_money,
                      color: Colors.white,
                      size: 40,
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      'Add income',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              margin: EdgeInsets.only(left: 20, right: 20),
              height: 65,
              width: 400,
              decoration: BoxDecoration(
                  color: Color.fromARGB(227, 238, 104, 86),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Icon(
                    Icons.logout,
                    color: Colors.white,
                    size: 40,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    'Logout',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              margin: EdgeInsets.only(left: 20, right: 20),
              height: 65,
              width: 400,
              decoration: BoxDecoration(
                  color: Color.fromARGB(227, 238, 104, 86),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 40,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    'Delete account',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
