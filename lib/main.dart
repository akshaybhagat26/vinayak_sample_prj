

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vinayak_expense_manager/providers/go_router_provider.dart';
import 'package:vinayak_expense_manager/repo/hive_repo.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  HiveRepo().registerAdapter();
  HiveRepo().registerUserAdapter();

  runApp(const ProviderScope(child: FinTechApp()));
}

class FinTechApp extends ConsumerStatefulWidget {
  const FinTechApp({super.key});

  @override
  ConsumerState<FinTechApp> createState() => _FinTechApp();
}

class _FinTechApp extends ConsumerState<FinTechApp> {

  @override
  Widget build(BuildContext context) {
    final goRouterConfig = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: goRouterConfig,
    );
  }
}