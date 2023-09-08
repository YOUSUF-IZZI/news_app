import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.name});

  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 65.h,
        width: 140.w,
        decoration: BoxDecoration(
          color: Colors.amberAccent,
          /*image: const DecorationImage(
            image: AssetImage('assets/images/Logo.png')
          ),*/
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
            child: Text(name, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),)
        ),
      ),
    );
  }
}