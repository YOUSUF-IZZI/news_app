import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/common/widgets/custom_button.dart';
import 'package:news_app/features/news_page/presentation_layer/pages/home_page.dart';
import 'package:news_app/features/onboarding/presentation_layer/state_management/onboarding_page_controller_provider.dart';
import 'package:news_app/features/onboarding/presentation_layer/state_management/page_index_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';



class OnboardingComponent extends StatelessWidget {
  const OnboardingComponent({super.key, required this.image, required this.title, required this.description, });
  final String image, title, description ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, left: 15.w, right: 15.w, bottom: 60.h),
      child: Column(
        children: [
          SvgPicture.asset(image, height: 380.h, width: 380.w,),
          SizedBox(height: 70.h,),

          //page title
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.h,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
          SizedBox(height: 15.h,),

          //page description
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.h,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 40.h,),
          const Spacer(flex: 1,),

          //we will show one of two buttons according to the index number
          Consumer(builder: (context, ref, child) {
            final index = ref.watch(pageIndexProvider);
            final controller = ref.watch(onboardingPageControllerProvider);
            return index < 2 ?
            CustomButton(
                name: 'Next',
                onPressed: (){
                  controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
                }
            ) :
            CustomButton(
              name: 'Get Started',
              onPressed: () async{
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage(),),
                );
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('showHome', true);
              },
            );
          },)
        ],
      ),
    );
  }
}
