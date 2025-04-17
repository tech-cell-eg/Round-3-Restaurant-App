import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/features/home/presentation/widgets/text_form_search.dart';

class CustomSearchAnchor extends StatelessWidget {
  const CustomSearchAnchor({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327.w,
      height: 62.h,
      child: SearchAnchor(
        builder: (BuildContext context, SearchController controller) {
          return TextFormSearch(
            onTap: () {
              controller.openView();
            },
          );
        },
        suggestionsBuilder: (
          BuildContext context,
          SearchController controller,
        ) {
          return [Center(child: Text("Search"))];
        },
      ),
    );
  }
}
