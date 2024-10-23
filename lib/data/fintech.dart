import 'package:hive/hive.dart';

part 'fintech.g.dart';

@HiveType(typeId: 0)
class TransactionData {
  @HiveField(0)
  String transactionId;

  @HiveField(1)
  DateTime transactionDate;

  @HiveField(2)
  double transactionAmount;

  @HiveField(3)
  String transactionType; 

  @HiveField(4)
  String transactionCategory;

  @HiveField(5)
  String transactionNote;

  TransactionData({
    required this.transactionId,
    required this.transactionDate,
    required this.transactionAmount,
    required this.transactionType,
    required this.transactionCategory,
    required this.transactionNote,
  });
}

@HiveType(typeId: 1)
class UserData {
  @HiveField(0)
  String userId;

  @HiveField(1)
  String userName;

  @HiveField(2)
  String userEmail;

  @HiveField(3)
  String userPassword;

  @HiveField(4)
  List<TransactionData> userTransactions;

  @HiveField(5)
  String userCurrency;

  @HiveField(6)
  double monthlyLimit;

  @HiveField(7)
  double userBalance;

  @HiveField(8)
  double userIncome;

  @HiveField(9)
  double userExpense;

  UserData({
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.userPassword,
    required this.userTransactions,
    required this.userCurrency,
    required this.monthlyLimit,
    required this.userBalance,
    required this.userIncome,
    required this.userExpense,
  });
  
}
