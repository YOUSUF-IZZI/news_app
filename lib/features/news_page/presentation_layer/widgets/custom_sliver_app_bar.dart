import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/common/providers/theme_mode_controller.dart';
import 'package:news_app/features/news_page/presentation_layer/widgets/theme_mode_switch.dart';
import '../../../../utils/colors.dart';
import 'category_list_view.dart';


class CustomSliverAppBar extends ConsumerWidget {
  const CustomSliverAppBar({super.key,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);
    return SliverAppBar(
      //backgroundColor: Theme.of(context).appBarTheme,
      title: Text(
        'Magazine',
        style: TextStyle(
            color: Theme.of(context).textTheme.bodyMedium?.color,
            fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      leading: const Icon(Icons.menu),
      actions: [
        darkMode ? Icon(CupertinoIcons.moon_stars, size: 28, color: Theme.of(context).appBarTheme.iconTheme?.color) : const Icon(Icons.wb_sunny, color: AppColors.appColor,) ,
        const Padding(
          padding: EdgeInsets.only(right: 16),
          child: ThemeModeSwitcher(),
        ),
      ],
      floating: true,
      expandedHeight: 130,
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: CategoryListView(),
        ),
      ),
    );
  }
}
