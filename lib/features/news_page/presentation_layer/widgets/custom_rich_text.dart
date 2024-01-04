import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: RichText(
        //textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500),
          children: [
            TextSpan(
              text: ' News',
              style: TextStyle(
                  color: Theme.of(context).textTheme.bodyMedium?.color),
            ),
            const TextSpan(
              text: 'Flow',
              style: TextStyle(color: Colors.orange),
            )
          ],
        ),
      ),
    );
  }
}
