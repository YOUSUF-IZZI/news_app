import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/presentation_layer/widgets/category_card.dart';


class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key, });

  final List<String> categoryList = const [
    'Business',
    'Entertainment',
    'Health',
    'Science',
    'Technology',
    'Sport',
    'General'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65.h,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          return CategoryCard(name: categoryList[index],);
        },
      ),
    );
  }
}