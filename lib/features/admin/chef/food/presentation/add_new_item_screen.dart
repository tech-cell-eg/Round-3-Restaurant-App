import 'package:flutter/material.dart';
import 'package:food_app/core/ui/buttons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/features/admin/chef/food/controllers/image_controller.dart';
import 'package:food_app/features/admin/chef/food/controllers/check_box_controller.dart';
import 'package:food_app/features/admin/chef/food/controllers/ingredient_controller.dart';
import 'package:food_app/features/admin/chef/food/presentation/views/add_item_general.dart';
import 'package:food_app/features/admin/chef/food/presentation/views/add_item_ingredients.dart';

class AddNewItemScreen extends StatefulWidget {
  const AddNewItemScreen({super.key});

  @override
  State<AddNewItemScreen> createState() => _AddNewItemScreenState();
}

class _AddNewItemScreenState extends State<AddNewItemScreen> {
  late ImageController images;
  late CheckboxController isPickup, isDelivery;
  late IngredientController basicController, spicesController, fruitsController;
  late TextEditingController nameController,
      priceController,
      descriptionController;

  @override
  void initState() {
    images = ImageController();
    isPickup = CheckboxController(true);
    isDelivery = CheckboxController(false);

    nameController = TextEditingController();
    priceController = TextEditingController();
    descriptionController = TextEditingController();

    basicController = IngredientController();
    spicesController = IngredientController();
    fruitsController = IngredientController();
    super.initState();
  }

  @override
  void dispose() {
    images.dispose();

    basicController.dispose();
    spicesController.dispose();
    fruitsController.dispose();

    isPickup.dispose();
    isDelivery.dispose();

    nameController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void reset() {
    setState(() {
      isPickup.value = true;
      isDelivery.value = false;

      images.clear();

      nameController.clear();
      priceController.clear();
      descriptionController.clear();

      basicController.value.clear();
      spicesController.value.clear();
      fruitsController.value.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Item"),
        actions: [Buttons.text(onPressed: reset, label: "RESET")],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            spacing: 16.h,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AddItemGeneralDataView(
                images: images,
                isPickup: isPickup,
                name: nameController,
                isDelivery: isDelivery,
                price: priceController,
                description: descriptionController,
              ),
              AddItemIngredientsView(
                basicController: basicController,
                spicesController: spicesController,
                fruitsController: fruitsController,
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  child: Buttons.fill(onPressed: () {}, label: "SAVE CHANGES"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
