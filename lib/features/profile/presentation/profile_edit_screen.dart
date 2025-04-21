import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/ui/buttons.dart';
import 'package:food_app/core/ui/inputs.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/features/profile/model/user.dart';
import 'package:image_picker/image_picker.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController phoneController;
  late TextEditingController nameController;
  late TextEditingController bioController;
  File? imageFile;
  late User user;
  @override
  void initState() {
    user = User(id: "1", name: "Muhammed Gamal", email: "jimmy@gmail.com");
    phoneController = TextEditingController(text: user.phone);
    nameController = TextEditingController(text: user.name);
    bioController = TextEditingController(text: user.bio);
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    nameController.dispose();
    bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            spacing: 12.h,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 60.r,
                    backgroundImage:
                        imageFile != null
                            ? FileImage(imageFile!)
                            : AssetImage(AppImages.assetsImagesUser),
                  ),
                  PositionedDirectional(
                    end: -2,
                    bottom: 5,
                    child: IconButton(
                      onPressed: () async {
                        XFile? file = await ImagePicker().pickImage(
                          source: ImageSource.gallery,
                        );
                        if (file != null) {
                          setState(() => imageFile = File(file.path));
                        }
                      },
                      icon: Icon(Icons.edit, color: Colors.white),
                      style: IconButton.styleFrom(
                        backgroundColor: AppColor.kPrimaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              Form(
                key: _formKey,
                child: Column(
                  spacing: 14.h,
                  children: [
                    TextInputField(
                      label: "FULL Name",
                      controller: nameController,
                      hint: "Enter your full name",
                    ),
                    TextInputField(
                      enabled: false,
                      label: "E-MAIl",
                      controller: TextEditingController(text: user.email),
                    ),
                    TextInputField(
                      label: "PHONE Number",
                      controller: phoneController,
                      hint: "Enter your phone number",
                    ),
                    TextInputField(
                      label: "Bio",
                      controller: bioController,
                      lines: 3,
                      hint: "Enter your bio",
                    ),
                  ],
                ),
              ),

              Buttons.fill(onPressed: () {}, label: "SAVE"),
            ],
          ),
        ),
      ),
    );
  }
}
