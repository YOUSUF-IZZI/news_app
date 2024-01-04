import 'package:flutter_riverpod/flutter_riverpod.dart';


class ThemeModeNotifier extends StateNotifier<bool>
{
  ThemeModeNotifier() : super(false);

  void changeThemeMode(){
    state = !state;
  }

}


final darkModeProvider = StateNotifierProvider<ThemeModeNotifier, bool>((ref) {
  return ThemeModeNotifier();
});