import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vinayak_expense_manager/data/fintech.dart';
import 'package:vinayak_expense_manager/providers/transaction_providers.dart';

class TransactionHistory extends ConsumerWidget {
  const TransactionHistory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(transactionNotifierProvider);

    final sortedTransactions = List<TransactionData>.from(transactions)
      ..sort((a, b) => b.transactionDate.compareTo(a.transactionDate));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction History'),
      ),
      body: sortedTransactions.isEmpty
          ? const Center(
              child: Text(
                'No Transactions Available',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: sortedTransactions.length,
              itemBuilder: (context, index) {
                final transaction = sortedTransactions[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: TransactionCard(transaction: transaction),
                );
              },
            ),
    );
  }
}

class TransactionCard extends StatelessWidget {
  final TransactionData transaction;

  const TransactionCard({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  transaction.transactionCategory,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  '₹${transaction.transactionAmount.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: transaction.transactionType == 'Income'
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              transaction.transactionNote.isNotEmpty
                  ? transaction.transactionNote
                  : 'No notes added',
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  transaction.transactionDate.toString().substring(0, 10),
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Icon(
                  transaction.transactionType == 'Income'
                      ? Icons.arrow_downward
                      : Icons.arrow_upward,
                  color: transaction.transactionType == 'Income'
                      ? Colors.green
                      : Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
