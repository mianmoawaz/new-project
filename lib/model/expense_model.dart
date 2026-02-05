import 'package:cloud_firestore/cloud_firestore.dart';

class ExpenseModel {
  final String docId;
  final String title;
  final double amount;
  final String category;
  final Timestamp date;
  final String userId;

  ExpenseModel({
    required this.docId,
    required this.title,
    required this.amount,
    required this.category,
    required this.userId,
    Timestamp? date,
  }) : date = date ?? Timestamp.now();

  Map<String, dynamic> toMap() {
    return {
      'docId': docId,
      'title': title,
      'amount': amount,
      'category': category,
      'date': date,
      'userId': userId,
    };
  }

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      docId: map['docId'] ?? '',
      title: map['title'] ?? '',
      amount: (map['amount'] ?? 0).toDouble(),
      category: map['category'] ?? '',
      userId: map['userId'] ?? '',
      date: map['date'] ?? Timestamp.now(),
    );
  }
}
// factory TodoModel.fromMap(Map<String, dynamic> map) {
//     return TodoModel(
//       title: map['title'] ?? '',
//       description: map['description'] ?? '',
//       docId: map['docid'] ?? '',
//       uId: map['uId'] ?? '',
//     );
//   }