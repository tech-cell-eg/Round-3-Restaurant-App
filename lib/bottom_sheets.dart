import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/app_text_style.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SlidingBottomSheetOrders extends StatefulWidget {
  const SlidingBottomSheetOrders({super.key});

  @override
  _SlidingBottomSheetOrdersState createState() => _SlidingBottomSheetOrdersState();
}

class _SlidingBottomSheetOrdersState extends State<SlidingBottomSheetOrders> {
  final PanelController _panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                _panelController.open();
              },
              child: const Text("Open Bottom Sheet"),
            ),
          ),
          SlidingUpPanel(
            controller: _panelController,
            minHeight: 20.h,
            maxHeight: MediaQuery.of(context).size.height * 0.85,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
            panelBuilder: (ScrollController sc) => _panel(sc),
            body: const Center(child: Text("Main Screen Content")),
          ),
        ],
      ),
    );
  }

  Widget _panel(ScrollController sc) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40.w,
              height: 5.h,
              margin: EdgeInsets.only(bottom: 20.h),
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
          Text(
            "20 Running Orders",
            style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 24.h),
          Expanded(
            child: ListView.separated(
              controller: sc,
              itemBuilder: (context, index) => const ItemBottomSheet(),
              separatorBuilder: (_, __) => SizedBox(height: 20.h),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class ItemBottomSheet extends StatelessWidget {
  const ItemBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        spacing: 8.w,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.asset(
              AppImages.assetsImagesFoodVegetables,
              height: 102.h,
              width: 102.w,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "#Breakfast",
                style: AppTextStyle.textStyle14.copyWith(
                  color: AppColor.kPrimaryColor,
                ),
              ),
              Text("Chicken Thai Biriyani", style: AppTextStyle.textStyle14),
              Text(
                "ID: 32053",
                style: AppTextStyle.textStyle14.copyWith(
                  color: AppColor.kItemColor,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                spacing: 8.w,
                children: [
                  Text("\$60", style: AppTextStyle.textStyle14),
                  SizedBox(width: 10.w),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Done",
                      style: AppTextStyle.textStyle13.copyWith(
                        color: AppColor.kWhiteColor,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 1,
                          color: AppColor.kPrimaryColor,
                        ),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Cancel",
                      style: AppTextStyle.textStyle14.copyWith(
                        color: AppColor.kPrimaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
