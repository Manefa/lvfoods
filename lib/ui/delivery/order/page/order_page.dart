import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';
import 'package:ivfoods_mobile_app/ui/delivery/order/widgets/no_orders/no_orders.dart';
import 'package:ivfoods_mobile_app/ui/delivery/order/widgets/to_delivery/order_to_deliver.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  List<String> data = ['À livrer', 'Tout'];
  int initPosition = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> widget = [OrderToDeliver(), NoOrders()];
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.white,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.translate("orders"),
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontFamily: "Milliard",
              fontWeight: FontWeight.w500
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: SafeArea(
          child: OrderToDeliver(),
        ),
      ),
    );
  }
}

