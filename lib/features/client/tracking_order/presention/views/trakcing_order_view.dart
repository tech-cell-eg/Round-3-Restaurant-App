import 'package:flutter/material.dart';
import 'package:food_app/features/client/tracking_order/presention/views/widgets/tracking_order_view_body.dart';

class TrackingOrderView extends StatelessWidget {
  const TrackingOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TrackingOrderViewBody(),
    );
  }
}