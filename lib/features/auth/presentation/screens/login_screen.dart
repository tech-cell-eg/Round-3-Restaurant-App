import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/app_color.dart';
import '../widgets/custom_button.dart';
import '../widgets/text_form_feild.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Dark blue background at top with SVG decoration
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            decoration: BoxDecoration(
              color: AppColor.kPrimaryDark,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Stack(
              children: [
                // SVG background decoration
                Positioned.fill(
                  child: SvgPicture.asset(
                    'assets/images/BG Asset.svg',
                    fit: BoxFit.cover,
                  ),
                ),
                // Content in the header
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Please sign in to your existing account',
                        style: TextStyle(fontSize: 16, color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // White form area
          Positioned(
            top: MediaQuery.of(context).size.height * 0.25,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Email Field
                    AppTextFormField(
                      label: 'EMAIL',
                      hintText: 'example@gmail.com',
                      prefixIcon: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),
                    // Password Field
                    AppTextFormField(
                      label: 'PASSWORD',
                      hintText: '············',
                      prefixIcon: Icons.lock,
                      obscureText: true,
                      suffixIcon: Icons.visibility_off,
                    ),
                    const SizedBox(height: 16),

                    // Remember me & Forgot password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: false,
                              onChanged: (value) {},
                              activeColor: AppColor.kPrimaryColor,
                            ),
                            const Text(
                              'Remember me',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColor.kBlackColor,
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/forgot-password');
                          },
                          child: const Text(
                            'Forgot Password',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColor.kPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),

                    // Login Button
                    AppButton(text: 'LOG IN', onPressed: () {}),
                    const SizedBox(height: 32),

                    // Sign up prompt
                    RichText(
                      text: const TextSpan(
                        text: 'Don\'t have an account?  ',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColor.kBlackColor,
                        ),
                        children: [
                          TextSpan(
                            text: 'SIGN UP',
                            style: TextStyle(
                              color: AppColor.kPrimaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Or divider
                    Row(
                      children: [
                        Expanded(child: Divider(color: AppColor.kGreyColor)),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'Or',
                            style: TextStyle(color: AppColor.kBlackColor),
                          ),
                        ),
                        Expanded(child: Divider(color: AppColor.kGreyColor)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
