import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/core/platform/lv_icons.dart';
import 'package:ivfoods_mobile_app/ui/delivery/order/widgets/all/order_all_display.dart';

class OrderAll extends StatefulWidget {
  @override
  _OrderAllState createState() => _OrderAllState();
}

class _OrderAllState extends State<OrderAll> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(416, 897),
        orientation: Orientation.portrait);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.red,
            width: size.width,

          ),
        ),
      ),
    );
  }
}
