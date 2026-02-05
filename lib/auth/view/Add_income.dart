import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:new_project/controller/income_controller.dart';

class AddIncome extends StatefulWidget {
  const AddIncome({super.key});

  @override
  State<AddIncome> createState() => _AddIncomeState();
}

class _AddIncomeState extends State<AddIncome> {
  final IncomeController incomeController = Get.put(IncomeController());

  final TextEditingController amountController = TextEditingController();

  DateTime? selectedDate;

  Future<void> pickDate() async {
    DateTime now = DateTime.now();

    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? now,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.deepOrange,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (newDate != null) {
      setState(() {
        selectedDate = newDate;
      });
    }
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
              // 🔙 Back Button
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color(0xffee6856),
                      ),
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                  SizedBox(width: 60.w),
                  const Text(
                    'Add Income',
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

              // AMOUNT INPUT
              const Text(
                'Enter Amount',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),

              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "  Amount",
                  ),
                ),
              ),

              SizedBox(height: 25),

              const Text(
                "Select Date",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              GestureDetector(
                onTap: pickDate,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_today,
                          color: Colors.deepOrange),
                      SizedBox(width: 12),
                      Text(
                        selectedDate == null
                            ? "Select Date"
                            : DateFormat('dd-MM-yyyy').format(selectedDate!),
                        style: const TextStyle(fontSize: 16),
                      ),
                      const Spacer(),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 40.h),

              // SUBMIT BUTTON
              Center(
                child: GestureDetector(
                  onTap: () {
                    if (amountController.text.isEmpty) {
                      Get.snackbar("Error", "Enter amount");
                      return;
                    }
                    if (selectedDate == null) {
                      Get.snackbar("Error", "Select date");
                      return;
                    }

                    double amount = double.parse(amountController.text);

                    incomeController.addIncome(
                      amount,
                      "Income",
                      selectedDate!,
                    );

                    Get.back();
                  },
                  child: Container(
                    height: 60,
                    width: 180,
                    decoration: BoxDecoration(
                        color: const Color(0xffee6856),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
}
