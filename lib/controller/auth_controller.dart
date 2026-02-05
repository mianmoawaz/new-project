import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/auth/view/home_screen.dart';
import 'package:new_project/controller/expense_controller.dart';
import 'package:new_project/controller/income_controller.dart';
import 'package:new_project/login_screen.dart';
import 'package:new_project/model/user_model';
import 'package:new_project/utils/snackbar_utils.dart';

class AuthController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  RxBool isloading = false.obs;

  Future<void> signup() async {
    if (formkey.currentState!.validate()) {
      try {
        isloading.value = true;

        UserCredential user =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text.trim(),
          password: password.text.trim(),
        );

        String uid = user.user!.uid;

        UserModel newUser = UserModel(
          uid: uid,
          name: name.text.trim(),
          email: email.text.trim(),
        );

        await FirebaseFirestore.instance
            .collection("users")
            .doc(uid)
            .set(newUser.toMap());

        Get.put(ExpenseController(), permanent: true);
        Get.put(IncomeController(), permanent: true);

        await Get.find<ExpenseController>().fetchExpenses();
        await Get.find<IncomeController>().fetchIncome();

        Get.offAll(() => HomeScreen());
      } catch (e) {
        Get.snackbar('Error', e.toString());
      } finally {
        isloading.value = false;
      }
    }
  }

  Future<void> signin() async {
    if (formkey.currentState!.validate()) {
      try {
        isloading.value = true;

        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text.trim(),
          password: password.text.trim(),
        );

        if (Get.isRegistered<ExpenseController>()) {
          Get.delete<ExpenseController>(force: true);
        }
        if (Get.isRegistered<IncomeController>()) {
          Get.delete<IncomeController>(force: true);
        }

        final expense = Get.put(ExpenseController(), permanent: true);
        final income = Get.put(IncomeController(), permanent: true);

        await expense.fetchExpenses();
        await income.fetchIncome();

        Get.offAll(() => HomeScreen());
      } catch (e) {
        Get.snackbar('Error', e.toString());
      } finally {
        isloading.value = false;
      }
    }
  }

  Future<void> forgotPassword() async {
    if (formkey.currentState!.validate()) {
      try {
        isloading.value = true;

        await FirebaseAuth.instance.sendPasswordResetEmail(
          email: email.text.trim(),
        );

        Get.snackbar(
          "Success",
          "Password reset email sent successfully!",
          backgroundColor: Colors.green.withOpacity(0.8),
          colorText: Colors.white,
        );

        Get.to(LoginScreen());
      } catch (e) {
        Get.snackbar(
          'Error',
          e.toString(),
          backgroundColor: Colors.red.withOpacity(0.8),
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      } finally {
        isloading.value = false;
      }
    }
  }

  Future<void> logout() async {
    try {
      isloading.value = true;

      await FirebaseAuth.instance.signOut();

      if (Get.isRegistered<ExpenseController>()) {
        Get.find<ExpenseController>().clearExpenses();
        Get.delete<ExpenseController>(force: true);
      }
      if (Get.isRegistered<IncomeController>()) {
        Get.find<IncomeController>().clearIncome();
        Get.delete<IncomeController>(force: true);
      }

      Get.offAll(() => const LoginScreen());
      SnackbarUtil.showSuccess("Logout successful!");
    } catch (e) {
      SnackbarUtil.showError("Error logging out: ${e.toString()}");
    } finally {
      isloading.value = false;
    }
  }
}
