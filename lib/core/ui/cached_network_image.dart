import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:shimmer/shimmer.dart';

class CustomCachedNetWorkImage extends StatelessWidget {
  const CustomCachedNetWorkImage({
    super.key,
    required this.image,
    required this.height,
    required this.width,
    required this.imageError,
  });

  final String image;
  final String imageError;

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      height: height,
      width: width,
      placeholder:
          (context, url) => Center(
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(width: 200, height: 100, color: Colors.white),
            ),
          ),
      errorWidget:
          (context, url, error) => Image.asset(imageError, fit: BoxFit.fill),
      fit: BoxFit.cover,
    );
  }
}
