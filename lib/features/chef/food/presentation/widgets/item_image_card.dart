import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemImageCard extends StatelessWidget {
  final String? path;
  final Function()? onDelete;
  const ItemImageCard({super.key, this.path, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12.r),
      ),
      child:
          path == null
              ? const Icon(Icons.add_a_photo_outlined)
              : ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Stack(
                  children: [
                    path!.contains("http")
                        ? Image.network(path!, fit: BoxFit.cover)
                        : Image.file(
                          File(path!),
                          fit: BoxFit.cover,
                          height: 100.h,
                          width: 100.w,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.error);
                          },
                        ),
                    Positioned(
                      top: -5.h,
                      right: -5.w,
                      child: CircleAvatar(
                        radius: 18.r,
                        backgroundColor: Colors.white,
                        child: IconButton(
                          onPressed: onDelete,
                          icon: const Icon(Icons.delete, color: Colors.red),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
    );
  }
}
