import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/presentation_layer/widgets/custom_search_bar.dart';
import 'package:news_app/riverpod.dart';


class SearchButton extends ConsumerWidget {
  const SearchButton({super.key,});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialButton(
      height: 45.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      color: Colors.orange,
      highlightColor: Colors.pink,
      splashColor: Colors.redAccent,
      onPressed: () {
        if (formState.currentState!.validate()) {
          formState.currentState!.save();
          ref.read(isEveryThingMethodProvider.notifier).state = true;
        }
      },
      child: Icon(Icons.search, size: 35.sp,),
    );
  }
}