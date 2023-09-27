import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/presentation_layer/widgets/search_button.dart';
import 'package:news_app/riverpod.dart';


GlobalKey<FormState> formState = GlobalKey();

class CustomSearchBar extends ConsumerWidget {
  const CustomSearchBar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: formState,
      child: TextFormField(
        cursorWidth: 3.0.sp,
        cursorColor: Colors.black,

        validator: (text){
          if (text!.isEmpty) {
            return 'You must enter something';
          }
          return null;
        },

        // works when we activate it
        onSaved: (text){
          ref.read(searchValueProvider.notifier).state = text!;
        },

        decoration: InputDecoration(
            hintText: '  What you\'re searching for',
            hintStyle: TextStyle(color: Colors.black, fontSize: 12.sp),
            suffixIcon: const SearchButton(),
            // after clicking
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide: BorderSide(
                    color: Colors.orange,
                    width: 4.sp
                )
            ),
            // before clicking
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide: BorderSide(
                    color: Colors.orange,
                    width: 4.0.sp
                )
            )
        ),
      ),
    );
  }
}


