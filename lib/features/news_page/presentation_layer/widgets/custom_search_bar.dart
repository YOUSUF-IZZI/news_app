import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/news_page/presentation_layer/riverpod.dart';
import 'package:news_app/features/news_page/presentation_layer/widgets/search_button.dart';
import 'package:news_app/utils/colors.dart';


GlobalKey<FormState> formState = GlobalKey();

class CustomSearchBar extends ConsumerWidget {
  const CustomSearchBar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: formState,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            Expanded(
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
                    hintText: '  What you\'re searching for?',
                    hintStyle: TextStyle(
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                      fontSize: 14.sp,
                    ),
                    //suffixIcon: const SearchButton(),
                    // after clicking
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide: BorderSide(
                            color: AppColors.appColor,
                            width: 4.sp
                        )
                    ),
                    // before clicking
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide: BorderSide(
                            color: Theme.of(context).textTheme.bodyMedium!.color!,
                            width: 4.0.sp
                        )
                    )
                ),
              ),
            ),
            const SizedBox(width: 10,),
            const SearchButton(),
          ],
        ),
      ),
    );
  }
}


