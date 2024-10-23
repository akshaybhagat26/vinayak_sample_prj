import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vinayak_expense_manager/data/fintech.dart';
import 'package:uuid/uuid.dart';
import 'package:vinayak_expense_manager/providers/transaction_providers.dart';

class AddTransactionScreen extends ConsumerStatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  _AddTransactionScreenState createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends ConsumerState<AddTransactionScreen> {
  final _amountController = TextEditingController();
  final _noteController = TextEditingController();
  String _selectedCategory = 'Grocery';
  String _transactionType = 'Expense'; 
  final List<String> _categories = [
    'Salary',
    'Rent',
    'Grocery',
    'Shopping',
    'Fuel',
    'Entertainment',
    'Other'
  ];
  final uuid = const Uuid();

  @override
  void dispose() {
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _addTransaction() async {
    final amount = double.tryParse(_amountController.text) ?? 0.0;
    final note = _noteController.text.trim();

    if (amount > 0 && note.isNotEmpty) {
      final newTransaction = TransactionData(
        transactionId: uuid.v4(),
        transactionDate: DateTime.now(),
        transactionAmount: amount,
        transactionType: _transactionType,
        transactionCategory: _transactionType == 'Expense' ? _selectedCategory : 'Income',
        transactionNote: note,
      );

      await ref.read(transactionNotifierProvider.notifier).addTransaction(newTransaction);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${_transactionType} added successfully!')),
      );

      Navigator.of(context).pop(); 
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid amount and note')),
      );
    }
  }

  void _setTransactionType(String type) {
    setState(() {
      _transactionType = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_transactionType == 'Expense' ? 'Add Expense' : 'Add Income'),
        backgroundColor: _transactionType == 'Expense' ? Colors.red : Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _setTransactionType('Expense'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 244, 67, 54),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Add Expense'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _setTransactionType('Income'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Add Income'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            if (_transactionType == 'Expense')
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                decoration: const InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(),
                ),
                items: _categories
                    .map((category) => DropdownMenuItem<String>(
                          value: category,
                          child: Text(category),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value!;
                  });
                },
              ),
            const SizedBox(height: 20),
            TextField(
              controller: _noteController,
              decoration: const InputDecoration(
                labelText: 'Note',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: _addTransaction,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _transactionType == 'Expense' ? Colors.red : Colors.green,
                ),
                child: Text(_transactionType == 'Expense' ? 'Add Expense' : 'Add Income'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
