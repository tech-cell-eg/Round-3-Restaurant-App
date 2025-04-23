import 'package:flutter/material.dart';
import 'package:food_app/features/auth/presentation/widgets/auth_widget.dart';
import 'package:food_app/features/auth/presentation/widgets/verifiy_form.dart';

class VerifiyScreen extends StatelessWidget {
  const VerifiyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthScreen(
        showBackArrow: true,
        title: "Verification",
        subtitle:
            "We have sent a code to your email \n             example@gmail.com",
        form: const VerifiyForm(),
        formHeightRatio: 0.66,
      ),
    );
  }
}
