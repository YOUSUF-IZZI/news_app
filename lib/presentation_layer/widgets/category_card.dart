import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/riverpod.dart';


class CategoryCard extends ConsumerWidget {
  const CategoryCard({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.all(8.0.h),
      child: MaterialButton(
        onPressed: (){
          ref.read(categoryProvider.notifier).state = category;
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.r),
        ),
        highlightColor: Colors.orangeAccent,
        splashColor: Colors.redAccent,
        color: category == ref.watch(categoryProvider) ? Colors.orange : const Color(0xFFF4F4F4),
        child: Text(category),
      ),
    );
  }
}