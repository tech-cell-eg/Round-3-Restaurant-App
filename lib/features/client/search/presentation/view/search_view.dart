import 'package:flutter/material.dart';
import 'package:food_app/features/client/search/presentation/view/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SearchViewBody()),
      );
  }
}
