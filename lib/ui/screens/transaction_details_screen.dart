import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vinayak_expense_manager/providers/transaction_providers.dart';
import 'package:vinayak_expense_manager/ui/screens/category_details_screen.dart';
import 'package:vinayak_expense_manager/ui/screens/transaction_history_screen.dart';

class TransactionDetails extends ConsumerWidget {
  const TransactionDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(transactionNotifierProvider);

    const totalExpense = 1200.0;
    const monthlyBalance = 3000.0;

    final sortedTransactions = [...transactions]..sort((a, b) => b.transactionDate.compareTo(a.transactionDate));
    final recentTransactions = sortedTransactions.take(3).toList();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 150.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Home'),
              background: Container(
                color: Colors.blueAccent,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Expense',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Text(
                            'Monthly Balance',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         
                          Text(
                            '₹$totalExpense',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '₹$monthlyBalance',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildListDelegate(
              [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Recent Transactions',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: recentTransactions.length,
                  itemBuilder: (context, index) {
                    final transaction = recentTransactions[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TransactionCard(transaction: transaction),
                    );
                  },
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Expense Categories',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    children: _buildExpenseCategoryCards(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildExpenseCategoryCards(BuildContext context) {
    final categories = [
      {'name': 'Bills', 'icon': Icons.receipt, 'color': Colors.blue},
      {'name': 'Shopping', 'icon': Icons.shopping_bag, 'color': Colors.pink},
      {'name': 'Groceries', 'icon': Icons.local_grocery_store, 'color': Colors.green},
      {'name': 'Fuel', 'icon': Icons.local_gas_station, 'color': Colors.orange},
      {'name': 'Entertainment', 'icon': Icons.movie, 'color': Colors.red},
      {'name': 'Other', 'icon': Icons.category, 'color': Colors.purple},
    ];

    return categories
        .map(
          (category) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryDetailsScreen(categoryName: category['name'] as String),
                ),
              );
            },
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(category['icon'] as IconData, size: 40, color: category['color'] as Color),
                  const SizedBox(height: 8),
                  Text(
                    category['name'] as String,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        )
        .toList();
  }
}
