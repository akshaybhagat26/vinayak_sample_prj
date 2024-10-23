import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vinayak_expense_manager/ui/screens/account_settings.dart';
import 'package:vinayak_expense_manager/ui/screens/money_transfers_screen.dart';
import 'package:vinayak_expense_manager/ui/screens/transaction_details_screen.dart';
import 'package:vinayak_expense_manager/ui/screens/transaction_history_screen.dart';
import 'package:vinayak_expense_manager/utils/route_names.dart';

class BottomNavbarScreen extends StatefulWidget {
  const BottomNavbarScreen({super.key});

  @override
  State<BottomNavbarScreen> createState() => _BottomNavbar();
}

class _BottomNavbar extends State<BottomNavbarScreen> {
  final List<BottomNavigationBarItem> items = const [
     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
     BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
     BottomNavigationBarItem(icon: Icon(Icons.attach_money_sharp), label: 'Transfers'),
     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
  ];

  final List<Widget> screens = [
    const TransactionDetails(),
    const TransactionHistory(),
    const MoneyTransfers(),
    const AccountSettings()
  ];

  int bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: bottomNavIndex,
        children: screens,
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          context.push(RouteNames.addExpense.path());
        },
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        currentIndex: bottomNavIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {});
          bottomNavIndex = index;
        },
        ),
    );
  }
}