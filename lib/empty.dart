import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Empty Screen\n Change the initial Route Name"),),);
  }
}
