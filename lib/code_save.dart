
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:new_project/auth/view/profile.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   bool isMonth = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         margin: EdgeInsets.only(top: 50, left: 20, right: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   children: [
//                     Text(
//                       'welcome back!',
//                       style: TextStyle(
//                           fontSize: 17,
//                           fontWeight: FontWeight.bold,
//                           color: Color(0xFF9BA0AB)),
//                     ),
//                     Text(
//                       'Mian Moawaz',
//                       style:
//                           TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
//                     )
//                   ],
//                 ),
//                 SizedBox(width: 20.w),
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(60),
//                   child: GestureDetector(
//                     onTap: () {
//                       Get.to(Profile());
//                     },
//                     child: Image.asset(
//                       'assets/moawaz.jpg',
//                       height: 70,
//                       width: 70,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Manage your\nexpense',
//               style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20.h),
//             Container(
//               height: 300,
//               width: 450,
//               padding: EdgeInsets.only(left: 20, right: 20, top: 15),
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: const Color.fromARGB(40, 0, 0, 0),
//                   width: 2.w,
//                 ),
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Expense',
//                         style: TextStyle(
//                             fontSize: 25, fontWeight: FontWeight.bold),
//                       ),
//                       Text(
//                         '\$300',
//                         style: TextStyle(
//                           color: Color(0xffee6856),
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       )
//                     ],
//                   ),
//                   SizedBox(height: 5),
//                   Text(
//                     '1 September 2025 - 30 September 2025',
//                     style: TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFF9BA0AB),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         width: 150,
//                         height: 150,
//                         child: PieChart(
//                           PieChartData(
//                             centerSpaceRadius: 35,
//                             sectionsSpace: 2,
//                             sections: [
//                               PieChartSectionData(
//                                 value: 50,
//                                 color: Colors.redAccent,
//                                 radius: 45,
//                               ),
//                               PieChartSectionData(
//                                 value: 30,
//                                 color: Colors.green,
//                                 radius: 45,
//                               ),
//                               PieChartSectionData(
//                                 value: 20,
//                                 color: Colors.blue,
//                                 radius: 45,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 100),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: const [
//                           LegendItem(
//                             color: Colors.redAccent,
//                             text: "Shopping  \$500",
//                           ),
//                           SizedBox(height: 8),
//                           LegendItem(
//                               color: Colors.green, text: "Grocery  \$300"),
//                           SizedBox(height: 8),
//                           LegendItem(color: Colors.blue, text: "Others  \$200"),
//                         ],
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 30.h,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       isMonth = true;
//                     });
//                   },
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
//                     decoration: BoxDecoration(
//                       color: isMonth ? Color(0xffee6856) : Colors.white,
//                       borderRadius: BorderRadius.circular(20),
//                       border: Border.all(color: Color(0xffee6856)),
//                     ),
//                     child: Text(
//                       "This Month",
//                       style: TextStyle(
//                         color: isMonth ? Colors.white : Color(0xffee6856),
//                         fontSize: 17,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 15),
//                 GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       isMonth = false;
//                     });
//                   },
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
//                     decoration: BoxDecoration(
//                       color: isMonth ? Colors.white : Color(0xffee6856),
//                       borderRadius: BorderRadius.circular(20),
//                       border: Border.all(color: Color(0xffee6856)),
//                     ),
//                     child: Text(
//                       "This Year",
//                       style: TextStyle(
//                         color: isMonth ? Color(0xffee6856) : Colors.white,
//                         fontSize: 17,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   padding: EdgeInsets.only(left: 20),
//                   height: 110,
//                   width: 210,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       border: Border.all(
//                         width: 2,
//                         color: const Color.fromARGB(40, 0, 0, 0),
//                       )),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Income',
//                         style: TextStyle(
//                             fontSize: 26, fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         height: 5.h,
//                       ),
//                       Text(
//                         '+\$5000',
//                         style: TextStyle(
//                             fontSize: 25,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.green),
//                       ),
//                       Container(
//                         height: 13,
//                         width: 140,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: Color(0xffee6856),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   width: 10.h,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       padding: EdgeInsets.only(left: 20),
//                       height: 110,
//                       width: 210,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           border: Border.all(
//                             width: 2,
//                             color: const Color.fromARGB(40, 0, 0, 0),
//                           )),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Expenses',
//                             style: TextStyle(
//                                 fontSize: 26, fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(
//                             height: 5.h,
//                           ),
//                           Text(
//                             '+\$3000',
//                             style: TextStyle(
//                                 fontSize: 25,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.green),
//                           ),
//                           Container(
//                             height: 13,
//                             width: 140,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color: Color(0xffee6856),
//                             ),
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(60),
//                 color: Color(0xffee6856),
//               ),
//               child: Row(
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(color: Colors.white),
//                     child: Image.asset(
//                       'assets/download.png',
//                       height: 40,
//                       width: 40,
//                       fit: BoxFit.cover,
//                     ),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class LegendItem extends StatelessWidget {
//   final Color color;
//   final String text;

//   const LegendItem({required this.color, required this.text});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Container(
//           width: 12,
//           height: 12,
//           decoration: BoxDecoration(
//             color: color,
//             shape: BoxShape.circle,
//           ),
//         ),
//         SizedBox(width: 6),
//         Text(text),
//       ],
//     );
//   }
// }
