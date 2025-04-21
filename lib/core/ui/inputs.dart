import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextInputField extends StatelessWidget {
  final String label;
  final bool enabled;
  final IconData? icon;
  final String hintText;
  final TextInputType keyboardType;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const TextInputField({
    super.key,
    this.icon,
    this.validator,
    this.onChanged,
    this.controller,
    required this.label,
    this.enabled = true,
    required this.hintText,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyle.label.copyWith(color: AppColor.kPrimaryDark),
        ),
        TextFormField(
          enabled: enabled,
          validator: validator,
          onChanged: onChanged,
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            prefix: icon != null ? Icon(icon) : null,
            hintText: hintText,
            hintStyle: const TextStyle(color: AppColor.kPrimaryDark),
            filled: true,
            fillColor: AppColor.kGreyColor,
            border: _buildNoneBorder(),
            enabledBorder: _buildNoneBorder(),
            focusedBorder: _buildFocusBorder(),
            errorBorder: _buildErrorBorder(),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 16,
            ),
          ),
        ),
      ],
    );
  }
}

class PasswordInputField extends StatefulWidget {
  final String label;
  final String hintText;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const PasswordInputField({
    super.key,
    required this.label,
    required this.hintText,
    this.controller,
    this.validator,
    this.onChanged,
  });

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: AppTextStyle.label.copyWith(color: AppColor.kPrimaryDark),
        ),
        TextFormField(
          controller: widget.controller,
          obscureText: obscureText,
          validator: widget.validator,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: AppColor.kPrimaryDark),
            filled: true,
            fillColor: AppColor.kGreyColor,
            prefix: Icon(Icons.lock_outlined, color: AppColor.kPrimaryDark),
            suffixIcon: Icon(
              obscureText
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: AppColor.kPrimaryDark,
            ),
            border: _buildNoneBorder(),
            enabledBorder: _buildNoneBorder(),
            focusedBorder: _buildFocusBorder(),
            errorBorder: _buildErrorBorder(),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 16,
            ),
          ),
        ),
      ],
    );
  }
}

InputBorder _buildFocusBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(color: AppColor.kPrimaryColor, width: 1.5),
  );
}

InputBorder _buildErrorBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(color: AppColor.kRedColor, width: 1.5),
  );
}

InputBorder _buildNoneBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide.none,
  );
}
