import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/common/providers/theme_mode_controller.dart';
import 'package:news_app/features/news_page/presentation_layer/pages/home_page.dart';
import 'package:news_app/features/onboarding/presentation_layer/pages/onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // Locking Device orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final preferences = await SharedPreferences.getInstance();
  final showHome = preferences.getBool('showHome') ?? false;
  runApp(ProviderScope(child: NewsApp(showHome: showHome,)));
}

class NewsApp extends StatelessWidget {
  //const NewsApp({super.key});
  const NewsApp({super.key, required this.showHome});
  final bool showHome;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411, 867),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Consumer(builder: (context, ref, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            //home: OnboardingPage(),
            home: showHome ? const HomePage() : const OnboardingPage(),
            themeMode: ref.watch(darkModeProvider) ? ThemeMode.dark : ThemeMode.light,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
          );
        },);
      },
    );
  }
}
