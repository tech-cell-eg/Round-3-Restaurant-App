import 'package:flutter/material.dart';
import 'package:food_app/core/ui/buttons.dart';
import 'package:food_app/core/ui/inputs.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_text_style.dart';
import 'package:food_app/core/validator/input.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 300,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/auth/location_image-removebg-preview.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Buttons.fill(
                onPressed: () async {
                  final result = await showModalBottomSheet<String>(
                    context: context,
                    builder: (context) => const AddressBottomSheet(),
                  );
                  if (result != null && context.mounted) {
                    String address = "Home • 123 Main St";
                    setState(() => address = result);
                  }
                },
                label: "ACCESS LOCATION",
              ),
              const SizedBox(height: 20),
              Text(
                "DFOOD WILL ACCESS YOUR LOCATION  \n        ONLY WHILE USING THE APP",
                style: AppTextStyle.header.copyWith(color: AppColor.kItemColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddressBottomSheet extends StatefulWidget {
  const AddressBottomSheet({super.key});

  @override
  State<AddressBottomSheet> createState() => _AddressBottomSheetState();
}

class _AddressBottomSheetState extends State<AddressBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void autofillAddress() {
    setState(() {
      controller.text = "Home • 123 Main St";
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Form(
                key: formKey,
                child: TextInputField(
                  label: "Address",
                  hintText: "Enter your address",
                  controller: controller,
                  hint: "Home • 123 Main St",
                  validator: InputValidator.validateAddress,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: autofillAddress,
                      icon: Icon(Icons.auto_fix_high),
                      label: Text("Autofill"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade200,
                        foregroundColor: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.pop(context, controller.text);
                        }
                      },
                      child: Text("Save"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
