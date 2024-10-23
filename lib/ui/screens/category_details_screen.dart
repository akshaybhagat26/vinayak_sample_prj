import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vinayak_expense_manager/providers/transaction_providers.dart';
import 'package:vinayak_expense_manager/ui/screens/transaction_history_screen.dart';

class CategoryDetailsScreen extends ConsumerWidget {
  final String categoryName;

  const CategoryDetailsScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(transactionNotifierProvider);

    final filteredTransactions = transactions
        .where((transaction) => transaction.transactionCategory == categoryName)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('$categoryName Transactions'),
      ),
      body: filteredTransactions.isEmpty
          ? const Center(
              child: Text(
                'No Transactions in this category',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: filteredTransactions.length,
              itemBuilder: (context, index) {
                final transaction = filteredTransactions[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: TransactionCard(transaction: transaction),
                );
              },
            ),
    );
  }
}
