import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/features/admin/chef/food/controllers/image_controller.dart';
import 'package:food_app/features/admin/chef/food/presentation/widgets/item_image_card.dart';

class GeneralImagesSection extends StatelessWidget {
  final ImageController controller;
  const GeneralImagesSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("UPLOAD PHOTO/VIDEO"),

        StatefulBuilder(
          builder: (context, setState) {
            return Row(
              spacing: 5.w,
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () async {
                    XFile? file = await ImagePicker().pickImage(
                      source: ImageSource.gallery,
                    );
                    if (file != null) {
                      setState(() => controller.add(file.path));
                    }
                  },
                  child: ItemImageCard(),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 5.w,
                      mainAxisSize: MainAxisSize.min,
                      children:
                          controller.value
                              .map(
                                (image) => ItemImageCard(
                                  path: image,
                                  onDelete:
                                      () => setState(
                                        () => controller.remove(image),
                                      ),
                                ),
                              )
                              .toList(),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
