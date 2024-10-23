import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProviders  extends StateNotifier<bool> {
   ThemeProviders() : super(false);
   final SharedPreferencesAsync asyncPref = SharedPreferencesAsync();

  Future toggleTheme() async {
    state = !state;
    await asyncPref.setBool('theme', state);
  }

  Future getSavedTheme() async {
    final bool? savedTheme = await asyncPref.getBool('theme');
    state = savedTheme ?? false;
  }
}

final themeProvider = StateNotifierProvider<ThemeProviders, bool>((ref) => ThemeProviders());