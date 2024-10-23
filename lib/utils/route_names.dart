class RouteNames {
  static const String login = 'login';
  static const String bottomNav = 'bottomNav';
  static const String transactionHistory = 'transactionHistory';
  static const String transactionDetails = 'transactionDetails';
  static const String accountSettings = 'accountSettings';
  static const String moneyTransfers = 'moneyTransfers';
  static const String addExpense = 'addExpense';
  static const String categoryDetails = 'categoryDetails';
}

extension GoRouterPath on String {
  String path()=> '/$this';
}
