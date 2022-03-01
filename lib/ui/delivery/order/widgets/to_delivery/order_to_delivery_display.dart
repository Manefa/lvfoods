import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/core/platform/icon/lv_icons.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/recovery.dart';
import 'package:ivfoods_mobile_app/ui/delivery/order_detail/page/order_detail_page.dart';

class OrderToDeliveryDisplay extends StatefulWidget {
  final List<Recovery>? recoveries;

  const OrderToDeliveryDisplay({Key? key, this.recoveries}) : super(key: key);
  @override
  _OrderToDeliveryDisplayState createState() => _OrderToDeliveryDisplayState();
}

class _OrderToDeliveryDisplayState extends State<OrderToDeliveryDisplay> {
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child : ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.only(right: 35, left: 35),
          shrinkWrap: true,
          clipBehavior: Clip.none,
          itemCount: widget.recoveries!.length,
          itemBuilder: (BuildContext context, int index){
            return InkWell(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => OrderDetailPage(restaurantName: widget.recoveries![index].restaurant!.name,)),);
              },
              child: Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        //Le expanded permet d"annuler L'overflowed
                        Expanded(
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              widget.recoveries![index].restaurant!.name!,
                              style: TextStyle(
                                fontFamily: "Milliard",
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 10.h,),
                            //Nombre de plat
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(
                                  LvIcons.dish,
                                  size: 15.sp,
                                  color:  Color(0XFF4884EE),
                                ),
                                SizedBox(width: 3.w,),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    "X "+widget.recoveries![index].quantity.toString(),
                                    style: TextStyle(
                                      color:  Color(0XFF4884EE),
                                      fontFamily: "Milliard",
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h,),
                            //Location Deli
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Icon(
                                  Icons.location_on_outlined,
                                  size: 15.sp,
                                  color: Color(0XFF949494),
                                ),
                                SizedBox(width: 10.w,),
                                Flexible(
                                  child: Text(
                                    widget.recoveries![index].restaurant!.address!,
                                    style: TextStyle(
                                      fontFamily: "Milliard",
                                      fontSize: 15.sp,
                                      color: Color(0XFF949494),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),),
                        //Right Icon
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color(0XFFBCBCBC),
                          size: 15.sp,
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h,),
                    Divider(),
                  ],
                ),
              ),
            );
          },
        ),
    );
  }
}
