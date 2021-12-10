import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(416, 897),
        orientation: Orientation.portrait);
    return OrderToDeliveryDisplay(recoveries: widget.recoveries);
  }
}
