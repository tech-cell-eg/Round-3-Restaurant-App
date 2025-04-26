import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/ui/buttons.dart';
import 'package:food_app/core/helper/shared_preference.dart';
import 'package:food_app/features/client/onboarding/widget/dot_indicator.dart';
import 'package:food_app/features/client/onboarding/widget/onboarding_view.dart';
import 'package:food_app/features/client/onboarding/data/onboarding_views.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: currentIndex);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _finishOnboarding() {
    SharedPreference.setBool(key: "onboarding", value: true);
    Navigator.pushReplacementNamed(context, 'login');
  }

  bool get isLastPage => currentIndex == onboardingViews.length - 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: 10.h,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    physics: const BouncingScrollPhysics(),
                    onPageChanged:
                        (index) => setState(() => currentIndex = index),
                    itemCount: onboardingViews.length,
                    itemBuilder:
                        (context, index) =>
                            OnboardingView(onboardingViews[index]),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onboardingViews.length,
                    (i) => DotIndicator(isSelected: currentIndex == i),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 95.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Buttons.fill(
                    onPressed: isLastPage ? _finishOnboarding : _goToNextPage,
                    label: isLastPage ? "Get Started" : "Next",
                  ),
                  isLastPage
                      ? Buttons.text(onPressed: null, label: "")
                      : Buttons.text(
                        label: "Skip",
                        onPressed: _finishOnboarding,
                      ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
