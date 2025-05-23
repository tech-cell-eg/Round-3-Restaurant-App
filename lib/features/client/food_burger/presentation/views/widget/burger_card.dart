import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_text_style.dart';
import 'package:shimmer/shimmer.dart';

class BurgerCard extends StatelessWidget {
  final String image;
  final String name;
  final String restaurant;
  final double price;

  const BurgerCard({
    super.key,
    required this.image,
    required this.name,
    required this.restaurant,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 185.h,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 8.h,
        ), // ضبط الـ padding داخل BurgerCard
        child: Stack(
          alignment: Alignment.topCenter,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: 40.h,
              child: Card(
                elevation: 0.1,
                color: AppColor.kWhiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Container(
                  width: 175.w,
                  height: 140.h,
                  padding: EdgeInsets.only(top: 50.h, left: 10.w, right: 10.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        name,
                        style: AppTextStyle.subTitle.copyWith(
                          overflow: TextOverflow.ellipsis,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        restaurant,
                        style: AppTextStyle.description.copyWith(
                          color: AppColor.kItemColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${price.toStringAsFixed(0)}',
                              style: AppTextStyle.subTitle,
                            ),
                            IconButton(
                              onPressed: () {},
                              style: IconButton.styleFrom(
                                padding: EdgeInsets.all(4),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                backgroundColor: Colors.orange,
                              ),
                              icon: Icon(Icons.add, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: image,
                  height: 84.h,
                  width: 122.w,
                  placeholder:
                      (context, url) => Center(
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            width: 122.w,
                            height: 87.h,
                            color: Colors.white,
                          ),
                        ),
                      ),
                  errorWidget:
                      (context, url, error) =>
                          const Icon(Icons.broken_image, size: 80),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
