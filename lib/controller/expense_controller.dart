// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import '../model/expense_model.dart';

// class ExpenseController extends GetxController {
//   RxBool isLoading = false.obs;

//   String userId = "";

//   void setUser(String id) {
//     userId = id;
//   }

//   RxList<ExpenseModel> expenses = <ExpenseModel>[].obs;

//   final CollectionReference expenseCollection =
//       FirebaseFirestore.instance.collection('expenses');

//   Future<void> addExpense({
//     required String title,
//     required String category,
//     required double amount,
//     required Timestamp date,
//   }) async {
//     try {
//       isLoading.value = true;

//       DocumentReference docRef = expenseCollection.doc();

//       ExpenseModel expense = ExpenseModel(
//         docId: docRef.id,
//         title: title,
//         category: category,
//         amount: amount,
//         date: date,
//         userId: userId, // <-- yahan ab userId always correct milega
//       );

//       await docRef.set(expense.toMap());
//       expenses.add(expense);

//       Get.snackbar('Success', 'Expense added successfully');
//     } catch (e) {
//       Get.snackbar('Error', e.toString());
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<void> fetchExpenses() async {
//     if (userId.isEmpty) return;

//     try {
//       isLoading.value = true;

//       QuerySnapshot snapshot = await expenseCollection
//           .where('userId', isEqualTo: userId)
//           .orderBy('date', descending: true)
//           .get();

//       List<ExpenseModel> list = snapshot.docs
//           .map(
//               (doc) => ExpenseModel.fromMap(doc.data() as Map<String, dynamic>))
//           .toList();

//       expenses.assignAll(list);
//     } catch (e) {
//       Get.snackbar('Error', e.toString());
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<void> updateExpense(ExpenseModel expense) async {
//     try {
//       await expenseCollection.doc(expense.docId).update(expense.toMap());

//       int index = expenses.indexWhere((e) => e.docId == expense.docId);
//       if (index != -1) {
//         expenses[index] = expense;
//       }

//       Get.snackbar('Success', 'Expense updated');
//     } catch (e) {
//       Get.snackbar('Error', e.toString());
//     }
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../model/expense_model.dart';

class ExpenseController extends GetxController {
  RxBool isLoading = false.obs;

  // Current userId dynamically
  String get userId => FirebaseAuth.instance.currentUser?.uid ?? '';

  // RxList for automatic UI update
  RxList<ExpenseModel> expenses = <ExpenseModel>[].obs;

  final CollectionReference expenseCollection =
      FirebaseFirestore.instance.collection('expenses');

  // ------------------ ADD EXPENSE ------------------
  Future<void> addExpense({
    required String title,
    required double amount,
    required String category,
    Timestamp? date,
  }) async {
    try {
      isLoading.value = true;

      DocumentReference docRef = expenseCollection.doc();

      ExpenseModel expense = ExpenseModel(
        docId: docRef.id,
        title: title,
        amount: amount,
        category: category,
        userId: userId,
        date: date ?? Timestamp.now(),
      );

      await docRef.set(expense.toMap());
      expenses.add(expense);

      Get.snackbar('Success', 'Expense added successfully');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // ------------------ FETCH EXPENSES ------------------
  Future<void> fetchExpenses() async {
    try {
      isLoading.value = true;

      // 🔹 Ensure current user is logged in
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null || uid.isEmpty) return;

      // 🔹 Firestore query with correct userId
      QuerySnapshot snapshot = await expenseCollection
          .where('userId', isEqualTo: uid)
          .orderBy('date', descending: true)
          .get();

      // 🔹 Convert documents to ExpenseModel
      List<ExpenseModel> list = snapshot.docs
          .map(
              (doc) => ExpenseModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      // 🔹 Update observable list
      expenses.assignAll(list);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // ------------------ UPDATE EXPENSE ------------------
  Future<void> updateExpense(ExpenseModel expense) async {
    try {
      isLoading.value = true;

      await expenseCollection.doc(expense.docId).update(expense.toMap());

      int index = expenses.indexWhere((e) => e.docId == expense.docId);
      if (index != -1) {
        expenses[index] = expense;
      }

      Get.snackbar('Success', 'Expense updated');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // ------------------ DELETE EXPENSE ------------------
  Future<void> deleteExpense(String docId) async {
    try {
      await expenseCollection.doc(docId).delete();
      expenses.removeWhere((e) => e.docId == docId);

      Get.snackbar('Success', 'Expense deleted');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  // ------------------ CLEAR ALL ON LOGOUT ------------------
  void clearExpenses() {
    expenses.clear();
  }
}
