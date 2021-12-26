import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/orders/restau_orders_detail/restau_orders_detail_display.dart';
class RestauOrderDetails extends StatefulWidget {
  const RestauOrderDetails({Key? key}) : super(key: key);

  @override
  _RestauOrderDetailsState createState() => _RestauOrderDetailsState();
}

class _RestauOrderDetailsState extends State<RestauOrderDetails> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(416, 897),
        orientation: Orientation.portrait);
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
      body: RestauOrderDetailsDisplay(),
      backgroundColor: Colors.white,
    );
  }
}
