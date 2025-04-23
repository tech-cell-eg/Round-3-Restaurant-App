import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/ui/buttons.dart';
import 'package:food_app/core/ui/inputs.dart';
import 'package:food_app/core/utils/app_color.dart';
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
  late String _selectedLabel;
  bool _isLoading = false;

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
    _selectedLabel = widget.address?.label.toLowerCase() ?? 'home';
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
      setState(() => _isLoading = true);

      // Simulate network delay
      await Future.delayed(const Duration(seconds: 1));

      final newAddress = Address(
        id: widget.address?.id ?? DateTime.now().toString(),
        label: _selectedLabel.toUpperCase(),
        fullAddress: _addressController.text,
        street: _streetController.text,
        postCode: _postCodeController.text,
        apartment: _apartmentController.text,
      );

      setState(() => _isLoading = false);
      Navigator.pop(context, newAddress);
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
            onTap: () => Navigator.of(context).pop(),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: const Color.fromARGB(255, 219, 225, 231),
              child: SvgPicture.asset(
                "assets/icons/back.svg",
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
              const Text(
                'LABEL AS',
                style: TextStyle(fontSize: 14, color: AppColor.kPrimaryDark),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildLabelChip('Home'),
                  const SizedBox(width: 8),
                  _buildLabelChip('Work'),
                  const SizedBox(width: 8),
                  _buildLabelChip('Other'),
                ],
              ),
              const SizedBox(height: 30),

              Buttons.fill(
                onPressed: _saveAddress,
                label:
                    widget.address == null ? 'SAVE ADDRESS' : 'UPDATE ADDRESS',
                isLoading: _isLoading,
                fontSize: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabelChip(String label) {
    return ChoiceChip(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
      label: Text(label),
      selected: _selectedLabel == label.toLowerCase(),
      onSelected: (selected) {
        setState(() {
          _selectedLabel = label.toLowerCase();
        });
      },
      selectedColor: AppColor.kPrimaryColor,
      labelStyle: TextStyle(
        fontSize: 16,
        color:
            _selectedLabel == label.toLowerCase() ? Colors.white : Colors.black,
      ),
    );
  }
}
