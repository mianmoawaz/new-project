import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddIncome extends StatefulWidget {
  const AddIncome({super.key});

  @override
  State<AddIncome> createState() => _AddIncomeState();
}

class _AddIncomeState extends State<AddIncome> {
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
              /// HEADER
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
                  SizedBox(width: 60.w),
                  Text(
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

              /// AMOUNT
              Text(
                'Enter Amount',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),

              Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "  Amount",
                  ),
                ),
              ),

              SizedBox(height: 25),

              /// DATE PICKER TITLE
              Text(
                "Select Date",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

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
                        fontWeight: FontWeight.bold,
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
