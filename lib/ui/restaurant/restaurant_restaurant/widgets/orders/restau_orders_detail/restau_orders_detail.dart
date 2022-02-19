import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_for_owner_restaurant/domain/entities/order.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/orders/restau_orders_detail/restau_orders_detail_display.dart';
class RestauOrderDetails extends StatefulWidget {
  final Order order;
  final int index;
  const RestauOrderDetails({Key? key, required this.order, required this.index}) : super(key: key);

  @override
  _RestauOrderDetailsState createState() => _RestauOrderDetailsState();
}

class _RestauOrderDetailsState extends State<RestauOrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          "Order detail",
          style: TextStyle(
              color: Colors.black,
              fontFamily: "Milliard",
              fontSize: 20.sp,
              fontWeight: FontWeight.w400
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: RestauOrderDetailsDisplay(index: widget.index,),
      backgroundColor: Colors.white,
    );
  }
}
