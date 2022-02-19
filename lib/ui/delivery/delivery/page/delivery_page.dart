import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/ui/delivery/delivery/widgets/all/delivery_all.dart';
import 'package:ivfoods_mobile_app/ui/delivery/order/widgets/sub_widgets/custom_tab_view_order.dart';
import 'package:ivfoods_mobile_app/ui/delivery/delivery/widgets/carry_out/delivery_carry_out.dart';
import 'package:ivfoods_mobile_app/ui/delivery/delivery/widgets/in_progress/delivery_in_progress.dart';
import 'package:ivfoods_mobile_app/ui/delivery/delivery/widgets/no_deliverys/no_deliverys.dart';
import 'package:ivfoods_mobile_app/ui/delivery/delivery/widgets/to_delivery/delivery_to_deliver.dart';

class DeliveryPage extends StatefulWidget {
  @override
  _DeliveryPageState createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  List<String> data = ['À livrer', 'En cours', 'Effectuée', 'Tout'];
  int initPosition = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> widget = [DeliveryToDeliver(), DeliveryInProgress(), DeliveryCarryOut(), DeliveryAll()];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Deliverys",
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: CustomTabView(
            initPosition: initPosition,
            itemCount: data.length,
            tabBuilder: (context, index) => Tab(text: data[index]),
            pageBuilder: (context, index) => widget[index],
            onPositionChange: (index){
              print('current position: $index');
              initPosition = index;
            },
            onScroll: (position) => print('$position'),
          ),
        ),
      ),
    );
  }
}

