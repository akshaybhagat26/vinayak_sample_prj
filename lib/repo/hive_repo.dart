import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:vinayak_expense_manager/data/fintech.dart';

class HiveRepo {
  final transDataBoxName = 'transDataBoxName';
  final userDataBoxName = 'userDataBoxName';

  void registerAdapter() {
    Hive.registerAdapter(TransactionDataAdapter());
  }
  
  void registerUserAdapter() {
    Hive.registerAdapter(UserDataAdapter());
  }

  Future addUserToHive(UserData userData) async {
    final userBox =
        await Hive.openBox<UserData>(transDataBoxName);
    if (userBox.isOpen) {
      await userBox.put(userData.userId, userData);
      Hive.close();
    } else {
      throw Exception('Box is not open');
    }
  }

  Future<UserData> getUserFromHive(String userId) async {
    final userBox =
        await Hive.openBox<UserData>(transDataBoxName);
    if (userBox.isOpen) {
      return userBox.get(userId)!;
    } else {
      throw Exception('Box is not open');
    }
  }
}

final hiveRepoProvider = Provider<HiveRepo>((ref) => HiveRepo());
