import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/news_page/presentation_layer/riverpod.dart';

import '../../../../utils/colors.dart';


class CategoryCard extends ConsumerWidget {
  const CategoryCard({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w, ),
      child: MaterialButton(
        elevation: 0.5,
        onPressed: (){
          ref.read(isEveryThingMethodProvider.notifier).state = false;
          ref.read(categoryProvider.notifier).state = category;
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.r),
        ),
        highlightColor: Colors.orangeAccent,
        splashColor: Colors.redAccent,
        color: category == ref.watch(categoryProvider) ? AppColors.appColor : const Color(0xFFF4F4F4),
        //child: Text(category, style: TextStyle(color: category == ref.watch(categoryProvider) ? Colors.white :  Colors.black),)
        child: Text(category, style: const TextStyle(color: Colors.black),),
      ),
    );
  }
}