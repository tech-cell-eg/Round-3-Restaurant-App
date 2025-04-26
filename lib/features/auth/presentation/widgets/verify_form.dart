import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/ui/buttons.dart';
import 'package:food_app/core/utils/app_color.dart';

class VerifyForm extends StatefulWidget {
  const VerifyForm({super.key});

  @override
  State<VerifyForm> createState() => _VerifyFormState();
}

class _VerifyFormState extends State<VerifyForm> {
  late List<FocusNode> focusNodes;
  late List<TextEditingController> controllers;

  @override
  void initState() {
    super.initState();
    focusNodes = List.generate(4, (index) => FocusNode());
    controllers = List.generate(4, (index) => TextEditingController());
  }

  @override
  void dispose() {
    for (var node in focusNodes) {
      node.dispose();
    }
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty) {
      // Only keep the last entered character
      if (value.length > 1) {
        controllers[index].text = value.substring(value.length - 1);
        controllers[index].selection = TextSelection.fromPosition(
          TextPosition(offset: controllers[index].text.length),
        );
      }

      // Move to next field if not last
      if (index < 3) {
        FocusScope.of(context).requestFocus(focusNodes[index + 1]);
      } else {
        focusNodes[index].unfocus();
      }
    } else if (value.isEmpty && index > 0) {
      // Move to previous field on backspace
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Row(
          spacing: 10.w,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            4,
            (index) => Expanded(
              child: SizedBox(
                child: TextFormField(
                  controller: controllers[index],
                  focusNode: focusNodes[index],
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: AppColor.kPrimaryDark,
                        width: 1.0,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    hintText: "_",
                    hintStyle: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 30),
                  onChanged: (value) => _onChanged(value, index),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly, // Only allow digits
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        Buttons.fill(onPressed: () {}, label: "Verify"),
      ],
    );
  }
}
