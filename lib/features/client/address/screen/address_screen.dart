import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/ui/buttons.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/features/client/address/model/address_model.dart';
import 'package:food_app/features/client/address/screen/edit_screen.dart';
import 'package:food_app/features/client/address/widget/address_card_screen.dart';

class AddressListScreen extends StatefulWidget {
  const AddressListScreen({super.key});

  @override
  State<AddressListScreen> createState() => _AddressListScreenState();
}

class _AddressListScreenState extends State<AddressListScreen> {
  List<Address> addresses = [
    Address(
      id: '1',
      label: 'HOME',
      fullAddress: '2464 Royal Ln. Mesa, New Jersey 45463',
      street: 'Royal Ln.',
      postCode: '45463',
      apartment: '2464',
    ),
    Address(
      id: '2',
      label: 'WORK',
      fullAddress: '3891 Ranchview Dr. Richardson, California 62639',
      street: 'Ranchview Dr.',
      postCode: '62639',
      apartment: '3891',
    ),
  ];

  void navigateToAddEditAddress({Address? address}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddEditAddressScreen(address: address),
      ),
    );

    if (result != null) {
      setState(() {
        if (address != null) {
          // Update existing address
          final index = addresses.indexWhere((a) => a.id == address.id);
          if (index != -1) {
            addresses[index] = result;
          }
        } else {
          // Add new address
          addresses.add(result);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 60,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap:(){}, 
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
        title: const Text('My Address'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: TextButton(
              onPressed: () => navigateToAddEditAddress(),
              child: const Text(
                'Add New Address',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: addresses.length,
                itemBuilder: (context, index) {
                  final address = addresses[index];
                  return AddressCard(
                    address: address,
                    onDelete: () {
                      setState(() {
                        addresses.removeAt(index);
                      });
                    },
                    onEdit: () {
                      navigateToAddEditAddress(address: address);
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Buttons.fill(
              onPressed: () => navigateToAddEditAddress(),
              label: "Add New Address",
              fontSize: 18,
            ),
          ],
        ),
      ),
    );
  }
}
