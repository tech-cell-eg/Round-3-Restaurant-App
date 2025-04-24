import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/ui/buttons.dart';
import 'package:food_app/core/ui/inputs.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/app_text_style.dart';


class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController postCodeController = TextEditingController();
  final TextEditingController apartmentController = TextEditingController();
  String selectedLabel = 'Home';
  bool isLoading = false;

  @override
  void dispose() {
    addressController.dispose();
    streetController.dispose();
    postCodeController.dispose();
    apartmentController.dispose();
    super.dispose();
  }

  Future<void> _saveAddress() async {
    if (formKey.currentState!.validate()) {
      setState(() => isLoading = true);

      // Simulate network delay
      await Future.delayed(const Duration(seconds: 1));

      // final newAddress = Address(
      //   label: selectedLabel.toUpperCase(),
      //   fullAddress: addressController.text,
      //   street: streetController.text,
      //   postCode: postCodeController.text,
      //   apartment: apartmentController.text,
      //   id: '',
      // );

      setState(() => isLoading = false);
      // Navigator.pop(context, newAddress);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Address'),
        leadingWidth: 60,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {},
            // () => Navigator.of(context).pop(),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: const Color.fromARGB(255, 219, 225, 231),
              child: SvgPicture.asset(
                AppImages.assetsIconsBack,
                width: 20,
                height: 20,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextInputField(
                icon: Icons.location_on,
                label: 'ADDRESS',
                hint: "3235 Royal Ln. mesa, new jersy 34567",
                controller: addressController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextInputField(
                      label: 'STREET',
                      hint: "hason nagar",
                      controller: streetController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter street';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextInputField(
                      label: 'POST CODE',
                      hint: "34567",
                      controller: postCodeController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter post code';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextInputField(
                label: 'APPARTMENT',
                hint: "345",

                controller: apartmentController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter apartment';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              const Text('LABEL AS', style: AppTextStyle.description),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buildLabelChip('Home'),
                  const SizedBox(width: 8),
                  buildLabelChip('Work'),
                  const SizedBox(width: 8),
                  buildLabelChip('Other'),
                ],
              ),
              const SizedBox(height: 30),
              Buttons.fill(
                onPressed: _saveAddress,
                label: 'Save Location',
                isLoading: isLoading,
                fontSize: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLabelChip(String label) {
    return ChoiceChip(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
      label: Text(label),
      selected: selectedLabel == label,
      onSelected: (selected) {
        setState(() {
          selectedLabel = label;
        });
      },
      selectedColor: AppColor.kPrimaryColor,
      labelStyle: AppTextStyle.subTitle.copyWith(
        color: selectedLabel == label ? Colors.white : Colors.black,
      ),
    );
  }
}
