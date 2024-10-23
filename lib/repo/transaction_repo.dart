import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:vinayak_expense_manager/data/fintech.dart';

class TransactionNotifier extends StateNotifier<List<TransactionData>> {
  TransactionNotifier() : super([]) {
    _loadTransactions();
  }

  final _boxName = 'transactionBox';

  Future<void> _loadTransactions() async {
    final box = await Hive.openBox<TransactionData>(_boxName);
    state = box.values.toList();
  }

  Future<void> addTransaction(TransactionData transaction) async {
    final box = await Hive.openBox<TransactionData>(_boxName);
    await box.put(transaction.transactionId, transaction);
    state = box.values.toList();
  }

  Future<void> deleteTransaction(String transactionId) async {
    final box = await Hive.openBox<TransactionData>(_boxName);
    await box.delete(transactionId);
    state = box.values.toList();
  }

  Future<void> editTransaction(String transactionId, TransactionData updatedTransaction) async {
    final box = await Hive.openBox<TransactionData>(_boxName);
    await box.put(transactionId, updatedTransaction);
    state = box.values.toList();
  }
}

final transactionNotifierProvider = StateNotifierProvider<TransactionNotifier, List<TransactionData>>((ref) {
  return TransactionNotifier();
});
