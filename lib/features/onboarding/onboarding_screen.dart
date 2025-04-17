import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/ui/buttons.dart';
import 'package:food_app/core/helper/shared_preference.dart';
import 'package:food_app/features/onboarding/widget/dot_indicator.dart';
import 'package:food_app/features/onboarding/widget/onboarding_view.dart';
import 'package:food_app/features/onboarding/data/onboarding_views.dart';

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
    Navigator.pushReplacementNamed(context, '/login');
  }

  bool get isLastPage => currentIndex == onboardingViews.length - 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 13,
              child: Column(
                children: [
                  Expanded(
                    flex: 9,
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
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        onboardingViews.length,
                        (i) => DotIndicator(isSelected: currentIndex == i),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex:2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Buttons.fill(
                      onPressed: isLastPage ? _finishOnboarding : _goToNextPage,
                      label: isLastPage ? "Get Started" : "Next",
                    ),
                    if (!isLastPage)
                      Buttons.text(onPressed: _finishOnboarding, label: "Skip")
                    else
                      Buttons.text(onPressed: null, label: ""),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
