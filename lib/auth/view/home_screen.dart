import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_project/controller/expense_controller.dart';
import 'package:new_project/auth/view/profile.dart';
import 'package:new_project/controller/income_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMonth = true;
  final ExpenseController expenseController = Get.find<ExpenseController>();
  final IncomeController incomeController = Get.find<IncomeController>();

  @override
  void initState() {
    super.initState();
    expenseController.fetchExpenses();
    incomeController.fetchIncome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'welcome back!',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF9BA0AB)),
                      ),
                      Text(
                        'Mian Moawaz',
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(width: 20.w),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(Profile());
                      },
                      child: Image.asset(
                        'assets/moawaz.jpg',
                        height: 70,
                        width: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Manage your\nexpense',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.h),
              Obx(() {
                if (expenseController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }

                double totalExpense = expenseController.expenses
                    .fold(0, (sum, e) => sum + e.amount);

                Map<String, double> categoryTotals = {};
                for (var e in expenseController.expenses) {
                  if (categoryTotals.containsKey(e.category)) {
                    categoryTotals[e.category] =
                        categoryTotals[e.category]! + e.amount;
                  } else {
                    categoryTotals[e.category] = e.amount;
                  }
                }

                List<PieChartSectionData> pieSections =
                    categoryTotals.entries.map((entry) {
                  Color color;
                  if (entry.key == "Shopping")
                    color = Colors.redAccent;
                  else if (entry.key == "Grocery")
                    color = Colors.green;
                  else
                    color = Colors.blue;

                  return PieChartSectionData(
                    value: entry.value,
                    color: color,
                    radius: 45,
                  );
                }).toList();

                return Container(
                  height: 300,
                  width: 450,
                  padding: EdgeInsets.only(left: 20, right: 20, top: 15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(40, 0, 0, 0),
                      width: 2.w,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Expense',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '\$${totalExpense.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: Color(0xffee6856),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                        '1 September 2025 - 30 September 2025',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF9BA0AB),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 150,
                            height: 150,
                            child: PieChart(
                              PieChartData(
                                centerSpaceRadius: 35,
                                sectionsSpace: 2,
                                sections: pieSections.isEmpty
                                    ? [
                                        PieChartSectionData(
                                            value: 1,
                                            color: Colors.grey,
                                            radius: 30)
                                      ]
                                    : pieSections,
                              ),
                            ),
                          ),
                          SizedBox(width: 100),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: categoryTotals.entries.map((entry) {
                              Color color;
                              if (entry.key == "Shopping")
                                color = Colors.redAccent;
                              else if (entry.key == "Grocery")
                                color = Colors.green;
                              else
                                color = Colors.blue;

                              return Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: LegendItem(
                                    color: color,
                                    text:
                                        "${entry.key}  \$${entry.value.toStringAsFixed(2)}"),
                              );
                            }).toList(),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              }),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isMonth = true;
                      });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      decoration: BoxDecoration(
                        color: isMonth ? Color(0xffee6856) : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Color(0xffee6856)),
                      ),
                      child: Text(
                        "This Month",
                        style: TextStyle(
                          color: isMonth ? Colors.white : Color(0xffee6856),
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isMonth = false;
                      });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      decoration: BoxDecoration(
                        color: isMonth ? Colors.white : Color(0xffee6856),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Color(0xffee6856)),
                      ),
                      child: Text(
                        "This Year",
                        style: TextStyle(
                          color: isMonth ? Color(0xffee6856) : Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      height: 120,
                      width: 210,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            width: 2,
                            color: const Color.fromARGB(40, 0, 0, 0),
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Income',
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5.h),
                          Obx(() => Text(
                                '+\$${incomeController.incomes.map((e) => e.amount).fold(0.0, (sum, a) => sum + a).toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              )),
                          Container(
                            height: 13,
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffee6856),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 10.h),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      height: 120,
                      width: 210,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            width: 2,
                            color: const Color.fromARGB(40, 0, 0, 0),
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Expenses',
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5.h),
                          Obx(() => Text(
                                '+\$${expenseController.expenses.map((e) => e.amount).fold(0.0, (sum, amount) => sum + amount).toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              )),
                          Container(
                            height: 13,
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffee6856),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  color: Color(0xffee6856),
                ),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(color: Colors.white),
                      child: Image.asset(
                        'assets/download.png',
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String text;

  const LegendItem({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 6),
        Text(text),
      ],
    );
  }
}
