import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key,});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500)
            ,
            children: const [
              TextSpan(text: 'News'),
              TextSpan(
                  text: 'Cloud', style: TextStyle(color: Colors.orange))
            ]
        ),
      ),
    );
  }
}