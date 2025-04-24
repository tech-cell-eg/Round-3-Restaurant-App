import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/ui/buttons.dart';
import 'package:food_app/core/ui/inputs.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/app_text_style.dart';
import 'package:food_app/features/address/model/address_model.dart';

class AddEditAddressScreen extends StatefulWidget {
  final Address? address;

  const AddEditAddressScreen({super.key, this.address});

  @override
  State<AddEditAddressScreen> createState() => _AddEditAddressScreenState();
}

class _AddEditAddressScreenState extends State<AddEditAddressScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _addressController;
  late TextEditingController _streetController;
  late TextEditingController _postCodeController;
  late TextEditingController _apartmentController;
  late String selectedLabel;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with existing address data or empty values
    _addressController = TextEditingController(
      text: widget.address?.fullAddress ?? '',
    );
    _streetController = TextEditingController(
      text: widget.address?.street ?? '',
    );
    _postCodeController = TextEditingController(
      text: widget.address?.postCode ?? '',
    );
    _apartmentController = TextEditingController(
      text: widget.address?.apartment ?? '',
    );
    selectedLabel = widget.address?.label.toLowerCase() ?? 'home';
  }

  @override
  void dispose() {
    _addressController.dispose();
    _streetController.dispose();
    _postCodeController.dispose();
    _apartmentController.dispose();
    super.dispose();
  }

  Future<void> _saveAddress() async {
    if (_formKey.currentState!.validate()) {
      setState(() => isLoading = true);

      // Simulate network delay
      await Future.delayed(const Duration(seconds: 1));

      // final newAddress = Address(
      //   id: widget.address?.id ?? DateTime.now().toString(),
      //   label: selectedLabel.toUpperCase(),
      //   fullAddress: _addressController.text,
      //   street: _streetController.text,
      //   postCode: _postCodeController.text,
      //   apartment: _apartmentController.text,
      // );

      setState(() => isLoading = false);
      // Navigator.pop(context, newAddress);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.address == null ? 'Add New Address' : 'Edit Address',
        ),
        leadingWidth: 60,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {},
            //() => Navigator.of(context).pop(),
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
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextInputField(
                label: 'ADDRESS',
                hint: "3235 Royal Ln. mesa, new jersy 34567",
                controller: _addressController,
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
                      controller: _streetController,
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
                      controller: _postCodeController,
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
                controller: _apartmentController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter apartment';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Text(
                'LABEL AS',
                style: AppTextStyle.description.copyWith(
                  color: AppColor.kPrimaryDark,
                ),
              ),
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
                label:
                    widget.address == null ? 'SAVE ADDRESS' : 'UPDATE ADDRESS',
                isLoading: isLoading,
                fontSize: 15,
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
      selected: selectedLabel == label.toLowerCase(),
      onSelected: (selected) {
        setState(() {
          selectedLabel = label.toLowerCase();
        });
      },
      selectedColor: AppColor.kPrimaryColor,
      labelStyle: AppTextStyle.subTitle.copyWith(
        color:
            selectedLabel == label.toLowerCase() ? Colors.white : Colors.black,
      ),
    );
  }
}
