import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:new_project/controller/expense_controller.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final ExpenseController expenseController = Get.put(ExpenseController());
  String selectedCategory = "Category";
  bool showDropdown = false;

  DateTime? selectedDate;
  final TextEditingController amountController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  Future<void> pickDate() async {
    DateTime now = DateTime.now();
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? now,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (newDate != null) {
      setState(() {
        selectedDate = newDate;
      });
    }
  }

  void submitExpense() {
    if (amountController.text.isEmpty ||
        selectedCategory == "Category" ||
        selectedDate == null) {
      Get.snackbar("Error", "Please fill all fields",
          colorText: Colors.white, backgroundColor: Colors.red);
      return;
    }

    double amount = double.tryParse(amountController.text.trim()) ?? 0;

    expenseController.addExpense(
      title: descriptionController.text.trim().isEmpty
          ? selectedCategory
          : descriptionController.text.trim(),
      category: selectedCategory,
      amount: amount,
      date: Timestamp.fromDate(selectedDate!), // ✔ REQUIRED
    );

    amountController.clear();
    descriptionController.clear();

    setState(() {
      selectedCategory = "Category";
      selectedDate = null;
    });

    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 45, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
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
                  SizedBox(width: 60.w),
                  Text(
                    'Add Expense',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  )
                ],
              ),

              SizedBox(height: 40.h),
              Padding(
                padding: const EdgeInsets.only(left: 80),
                child: Image.asset('assets/download (1).png'),
              ),
              SizedBox(height: 30.h),

              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Amount",
                ),
              ),

              SizedBox(height: 20.h),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: selectedCategory,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              showDropdown = !showDropdown;
                            });
                          },
                          child: Icon(Icons.arrow_drop_down, size: 30),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                  ),
                  if (showDropdown)
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5,
                                offset: Offset(0, 3))
                          ]),
                      child: Column(
                        children: [
                          _buildItem("Shopping"),
                          _buildItem("Grocery"),
                          _buildItem("Milk"),
                          _buildItem("Other"),
                        ],
                      ),
                    ),
                ],
              ),

              SizedBox(height: 20.h),

              GestureDetector(
                onTap: pickDate,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.calendar_today, color: Colors.deepOrange),
                      SizedBox(width: 12),
                      Text(
                        selectedDate == null
                            ? "Select Date"
                            : DateFormat('dd-MM-yyyy').format(selectedDate!),
                        style: TextStyle(fontSize: 16),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 40.h),

              Center(
                child: GestureDetector(
                  onTap: submitExpense,
                  child: Container(
                    height: 60,
                    width: 180,
                    decoration: BoxDecoration(
                        color: Color(0xffee6856),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      "Submit",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),

              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(String title) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedCategory = title;
          showDropdown = false;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(title, style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
