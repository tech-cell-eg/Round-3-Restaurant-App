import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_color.dart';
import '../../cubit/auth/auth_cubit.dart';
import 'custom_button.dart';
import 'text_form_feild.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Text(
            'Please enter your email to receive a reset code',
            style: TextStyle(
              fontSize: 16,
              color: AppColor.kBlackColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          AppTextFormField(
            label: 'EMAIL',
            hintText: 'example@gmail.com',
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Icons.email,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 32),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              } else if (state is AuthSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Password reset link sent to your email'),
                  ),
                );
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              return AppButton(
                text: 'SEND CODE',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context
                        .read<AuthCubit>()
                        .forgotPassword(_emailController.text.trim());
                  }
                },
                isLoading: state is AuthLoading,
              );
            },
          ),
          const SizedBox(height: 32),
          // Virtual Keyboard Placeholder
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColor.kGreyColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P']
                      .map((char) => Text(char))
                      .toList(),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L']
                      .map((char) => Text(char))
                      .toList(),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: ['Z', 'X', 'C', 'V', 'B', 'N', 'M']
                      .map((char) => Text(char))
                      .toList(),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('123'),
                    const SizedBox(width: 32),
                    const Text('space'),
                    const SizedBox(width: 32),
                    const Text('Go'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}