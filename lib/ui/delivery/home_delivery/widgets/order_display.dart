import 'package:flutter/material.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/recovery.dart';
import 'package:ivfoods_mobile_app/ui/delivery/order/widgets/to_delivery/order_to_delivery_display.dart';

class OrderDisplay extends StatefulWidget {
  final List<Recovery> recoveries;

  const OrderDisplay({Key? key, required this.recoveries}) : super(key: key);
  @override
  _OrderDisplayState createState() => _OrderDisplayState();
}

class _OrderDisplayState extends State<OrderDisplay> {
  @override
  Widget build(BuildContext context) {

    return OrderToDeliveryDisplay(recoveries: widget.recoveries);
  }
}
