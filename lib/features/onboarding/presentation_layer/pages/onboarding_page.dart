import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/onboarding/presentation_layer/components/onboarding_page_body.dart';
import 'package:news_app/features/onboarding/presentation_layer/state_management/page_index_provider.dart';
import 'package:news_app/features/onboarding/presentation_layer/widgets/page_indicator.dart';
import '../state_management/onboarding_page_controller_provider.dart';


class OnboardingPage extends ConsumerWidget {
  const OnboardingPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(onboardingPageControllerProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView(
            // We use controller in navigation and some useful things
            controller: controller,
            // onPageChanged provide us with index number
            onPageChanged: (value) {
              ref.read(pageIndexProvider.notifier).state = value;
            },
            //physics: const BouncingScrollPhysics(),
            children: const [
              OnboardingComponent(
                image: 'assets/images/onboarding/News-cuate.svg',
                title: 'Welcome to Your World of News',
                description: 'Dive into a personalized stream of news tailored just for you ',
              ),
              OnboardingComponent(
                  image: 'assets/images/onboarding/World Press Freedom Day-pana.svg',
                  title: 'Unfold the Stories that Shape Our World',
                  description: 'Magazine learns your interests and delivers the stories that matter most, right to your fingertips'
              ),
              OnboardingComponent(
                  image: 'assets/images/onboarding/World Press Freedom Day-bro.svg',
                  title: 'Discover Unfiltered Voices with Magazine',
                  description: 'Escape the echo chamber and experience news through a kaleidoscope of independent voices'
              ),
            ],
          ),
          Positioned(
            top: 420.h,
            child: const CustomPageIndicator(),
          )
        ],
      ),
    );
  }
}
