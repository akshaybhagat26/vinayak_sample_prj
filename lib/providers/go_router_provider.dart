import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vinayak_expense_manager/ui/screens/account_settings.dart';
import 'package:vinayak_expense_manager/ui/screens/add_transaction_screen.dart';
import 'package:vinayak_expense_manager/ui/screens/bottom_navbar.dart';
import 'package:vinayak_expense_manager/ui/screens/category_details_screen.dart';
import 'package:vinayak_expense_manager/ui/screens/error_screen.dart';
import 'package:vinayak_expense_manager/ui/screens/login_screen.dart';
import 'package:vinayak_expense_manager/ui/screens/money_transfers_screen.dart';
import 'package:vinayak_expense_manager/ui/screens/transaction_details_screen.dart';
import 'package:vinayak_expense_manager/ui/screens/transaction_history_screen.dart';
import 'package:vinayak_expense_manager/utils/route_names.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: RouteNames.login.path(),
    routes: [
      GoRoute(
          path: RouteNames.login.path(),
          name: RouteNames.login,
          builder: (context, state) {
            return LoginScreen();
          }),
      GoRoute(
          path: RouteNames.bottomNav.path(),
          name: RouteNames.bottomNav,
          builder: (context, state) {
            return const BottomNavbarScreen();
          }),
      GoRoute(
          path: RouteNames.transactionDetails.path(),
          name: RouteNames.transactionDetails,
          builder: (context, state) {
            return const TransactionDetails();
          }),
      GoRoute(
          path: RouteNames.transactionHistory.path(),
          name: RouteNames.transactionHistory,
          builder: (context, state) {
            return const TransactionHistory();
          }),
      GoRoute(
          path: RouteNames.accountSettings.path(),
          name: RouteNames.accountSettings,
          builder: (context, state) {
            return const AccountSettings();
          }),
      GoRoute(
          path: RouteNames.moneyTransfers.path(),
          name: RouteNames.moneyTransfers,
          builder: (context, state) {
            return const MoneyTransfers();
          }),
      GoRoute(
          path: RouteNames.addExpense.path(),
          name: RouteNames.addExpense,
          builder: (context, state) {
            return const AddTransactionScreen();
          }),
           GoRoute(
          path: RouteNames.categoryDetails.path(),
          name: RouteNames.categoryDetails,
          builder: (context, state) {
            return const CategoryDetailsScreen(categoryName: '',);
          }),
    ],
    errorBuilder: (context, state) {
      return ErrorScreen(error: state.error.toString());
    },
  );
});
