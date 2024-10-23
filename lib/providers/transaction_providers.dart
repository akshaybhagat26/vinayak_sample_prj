import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vinayak_expense_manager/data/fintech.dart';
import 'package:vinayak_expense_manager/repo/transaction_repo.dart';

final transactionNotifierProvider =
    StateNotifierProvider<TransactionNotifier, List<TransactionData>>((ref) {
  return TransactionNotifier();
});