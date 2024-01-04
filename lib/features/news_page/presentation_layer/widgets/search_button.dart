import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/news_page/presentation_layer/riverpod.dart';
import 'package:news_app/utils/colors.dart';

import 'custom_search_bar.dart';


class SearchButton extends ConsumerWidget {
  const SearchButton({super.key,});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialButton(
      height: 55.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      color: AppColors.appColor,
      highlightColor: Colors.pink,
      splashColor: Colors.redAccent,
      onPressed: () {
        if (formState.currentState!.validate()) {
          formState.currentState!.save();
          ref.read(isEveryThingMethodProvider.notifier).state = true;
        }
      },
      child: Icon(Icons.search, size: 30.sp, color: Colors.black54,),
    );
  }
}