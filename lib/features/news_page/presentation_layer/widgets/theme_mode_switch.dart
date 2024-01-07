import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/common/providers/theme_mode_controller.dart';
import 'package:news_app/utils/colors.dart';


class ThemeModeSwitcher extends ConsumerWidget {
  const ThemeModeSwitcher({super.key,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(darkModeProvider);
    return Switch.adaptive(
      activeColor: Colors.deepPurple,
      hoverColor: AppColors.appColor,
      applyCupertinoTheme: true,
      focusColor: AppColors.appColor,
      value: themeMode,
      onChanged: (val){
        ref.read(darkModeProvider.notifier).changeThemeMode();
      },
    );
  }
}

