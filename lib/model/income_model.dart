class IncomeModel {
  String id;
  double amount;
  String category;
  DateTime date;

  IncomeModel({
    required this.id,
    required this.amount,
    required this.category,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      "amount": amount,
      "category": category,
      "date": date.toIso8601String(),
    };
  }

  factory IncomeModel.fromMap(Map<String, dynamic> map, String docId) {
    return IncomeModel(
      id: docId,
      amount: (map["amount"] as num).toDouble(),
      category: map["category"],
      date: DateTime.parse(map["date"]),
    );
  }
}
