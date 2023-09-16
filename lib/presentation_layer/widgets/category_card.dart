import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/presentation_layer/pages/category_news_page.dart';


class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});

  final String category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CategoryNewsPage(category: category);
        },),);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 65.h,
          width: 140.w,
          decoration: BoxDecoration(
            color: Colors.amberAccent,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
              child: Text(category, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),)
          ),
        ),
      ),
    );
  }
}