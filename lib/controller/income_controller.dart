import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../model/income_model.dart';

class IncomeController extends GetxController {
  RxBool isLoading = false.obs;
  var incomes = <IncomeModel>[].obs;
  void clearIncome() {
    incomes.clear();
  }

  String get userId => FirebaseAuth.instance.currentUser!.uid;

  Future<void> addIncome(double amount, String category, DateTime date) async {
    try {
      isLoading.value = true;
      var doc = await FirebaseFirestore.instance.collection("income").add({
        "userId": userId,
        "amount": amount,
        "category": category,
        "date": date.toIso8601String(),
      });

      incomes.add(IncomeModel(
        id: doc.id,
        amount: amount,
        category: category,
        date: date,
      ));

      Get.snackbar('Success', 'Income added successfully');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchIncome() async {
  try {
    isLoading.value = true;

    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null || uid.isEmpty) return;

    var snapshot = await FirebaseFirestore.instance
        .collection("income")
        .where("userId", isEqualTo: uid)
        .orderBy('date', descending: true)
        .get();

    incomes.value = snapshot.docs
        .map((doc) => IncomeModel.fromMap(doc.data(), doc.id))
        .toList();
  } catch (e) {
    Get.snackbar('Error', e.toString());
  } finally {
    isLoading.value = false;
  }
}


  /// DELETE INCOME
  Future<void> deleteIncome(String id) async {
    try {
      await FirebaseFirestore.instance.collection("income").doc(id).delete();
      incomes.removeWhere((income) => income.id == id);
      Get.snackbar('Success', 'Income deleted');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  /// Monthly Income
  double getMonthlyIncome() {
    final now = DateTime.now();
    return incomes
        .where((e) => e.date.month == now.month && e.date.year == now.year)
        .fold(0.0, (sum, e) => sum + e.amount);
  }

  /// Yearly Income
  double getYearlyIncome() {
    final now = DateTime.now();
    return incomes
        .where((e) => e.date.year == now.year)
        .fold(0.0, (sum, e) => sum + e.amount);
  }

  /// Total Income
  double get totalIncome => incomes.fold(0, (sum, item) => sum + item.amount);
}
