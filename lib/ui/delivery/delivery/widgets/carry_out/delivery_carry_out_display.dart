import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ivfoods_mobile_app/core/platform/icon/lv_icons.dart';
import 'package:ivfoods_mobile_app/features/deliveries/domain/entities/delivery.dart';
import 'package:ivfoods_mobile_app/features/deliveries/domain/entities/order.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';
import 'package:ivfoods_mobile_app/ui/delivery/delivery_detail/page/delivery_detail_page.dart';

class DeliveryCarryOutDisplay extends StatefulWidget {
  final List<Delivery> deliveries;

  const DeliveryCarryOutDisplay({Key? key, required this.deliveries}) : super(key: key);
  @override
  _DeliveryCarryOutDisplayState createState() => _DeliveryCarryOutDisplayState();
}

class _DeliveryCarryOutDisplayState extends State<DeliveryCarryOutDisplay> {
  var gen = new Random();
  int i= 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    List<Delivery> _ordersCarryOut = List.empty();
    List<Delivery> _ordersCarryOutReal = _ordersCarryOut.toList();

    var toRemove = [];
    _ordersCarryOutReal = widget.deliveries;

    _ordersCarryOutReal.forEach((x) {
      if(x.status  != "delivered"){
        toRemove.add(x);
      }
    });

    _ordersCarryOutReal.removeWhere((element) => toRemove.contains(element));

    return _ordersCarryOutReal.isNotEmpty ? SingleChildScrollView(
      child : ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        clipBehavior: Clip.none,
        itemCount: _ordersCarryOutReal.length,
        itemBuilder: (BuildContext context, int index){
          List<Order>? list = _ordersCarryOutReal[index].orderGroup!.orders;
          String getValues(List<Order> values){
            String name = "";
            values.forEach((element){
              name = name+element.item!.name.toString()+", ";
            });
            return name;
          }
          Map<int, String> names = new Map.fromIterable(
            list!,
            key: (key) => gen.nextInt(list.length),
            value: (value) => getValues(list),
          );
          return InkWell(
            highlightColor: Colors.white,
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => DeliveryDetailPage(code: _ordersCarryOutReal[index].code!,)),);
            },
            child: Center(
              child: Container(
                color: Colors.white,
                width: 344.w,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                change(names.values),
                                style: TextStyle(
                                  fontFamily: "Milliard",
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(height: 10.h,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Icon(
                                  Icons.location_on_outlined,
                                  size: 15.sp,
                                  color: Color(0XFF949494),
                                ),
                                SizedBox(width: 10.w,),
                                Text(
                                  _ordersCarryOutReal[index].country.toString()+ " - "+_ordersCarryOutReal[index].city.toString()+ " - "+_ordersCarryOutReal[index].district.toString(),
                                  style: TextStyle(
                                    fontFamily: "Milliard",
                                    fontSize: 15.sp,
                                    color: Color(0XFF949494),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Icon(
                                  Icons.access_time_rounded,
                                  size: 15.sp,
                                  color: Color(0XFF949494),
                                ),
                                SizedBox(width: 10.w,),
                                Text(
                                  getHour(_ordersCarryOutReal[index].createdAt.toString())+" "+AppLocalizations.of(context)!.translate("hoursAgo"),
                                  style: TextStyle(
                                    fontFamily: "Milliard",
                                    fontSize: 15.sp,
                                    color: Color(0XFF949494),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h,),
                            IntrinsicHeight(child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  LvIcons.dollar__1_,
                                  size: 15.sp,
                                  color: _ordersCarryOutReal[index].statusPayment == "paid" && _ordersCarryOutReal[index].orderGroup!.statusPayment == "paid" ? Color(0XFF4884EE) : Color(0XFFBC2C3D),
                                ),
                                SizedBox(width: 5.w,),
                                Text(
                                  _ordersCarryOutReal[index].statusPayment == "paid" && _ordersCarryOutReal[index].orderGroup!.statusPayment == "paid" ? AppLocalizations.of(context)!.translate("paid") : AppLocalizations.of(context)!.translate("unPaid"),
                                  style: TextStyle(
                                    fontFamily: "Milliard",
                                    fontSize: 15.sp,
                                    color: _ordersCarryOutReal[index].statusPayment == "paid" && _ordersCarryOutReal[index].orderGroup!.statusPayment == "paid" ? Color(0XFF4884EE) : Color(0XFFBC2C3D),
                                  ),
                                ),
                                VerticalDivider(),
                                Icon(
                                  LvIcons.dish,
                                  size: 15.sp,
                                  color:  Color(0XFF4884EE),
                                ),
                                SizedBox(width: 3.w,),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    "X "+getQuantity(_ordersCarryOutReal[index].orderGroup!.orders),
                                    style: TextStyle(
                                      color:  Color(0XFF4884EE),
                                      fontFamily: "Milliard",
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                ),
                                VerticalDivider(),
                                //IconDelivred
                                Container(
                                  height: 20.r,
                                  width: 20.r,
                                  decoration: BoxDecoration(
                                    color: Color(0XFFEFFBF2),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.check,
                                      size: 14.sp,
                                      color: Color(0XFF68D389),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5.w,),
                                Text(
                                  AppLocalizations.of(context)!.translate("delivered"),
                                  style: TextStyle(
                                    color: Color(0XFF68D389),
                                    fontSize: 15.sp,
                                    fontFamily: "Milliard",
                                  ),
                                ),
                              ],
                            ),)

                          ],
                        )),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color(0XFFBCBCBC),
                          size: 15.sp,
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h,),
                    Divider(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ): Container(
      width: size.width,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 105.h,),
          Container(
            width: 237.w,
            height: 231.h,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/no_order.png"),
                  fit: BoxFit.contain,
                )
            ),
          ),
          SizedBox(height: 48.h,),
          Text(
            "No Deliverys !",
            style: TextStyle(
              fontFamily: "Milliard",
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 30.h,),
          Text(
            AppLocalizations.of(context)!.translate("noDeliveryDetail"),
            style: TextStyle(
              fontSize: 15.sp,
              fontFamily: "Milliard",
            ),
          ),
        ],
      ),
    );
  }

  String change(Iterable<String> values) {
    String value = "";
    values.forEach((element) {
      value = element;
    });
    return value;
  }


  String getQuantity(List<Order>? orders) {
    int? quantity = 0;
    orders!.forEach((element) {
      quantity = quantity!.toInt() + element.quantity!.toInt();
    });
    return quantity.toString();
  }

  String getStatusPayment(List<Order>? orders, int index) {
    String statusPayment = "";
    orders!.forEach((element) {
        statusPayment = element.statusPayment!;
    });
    return statusPayment;
  }

  String getHour(String hour) {
    var parsedDate = DateTime.parse(hour);
    var dateNow = DateTime.now();
    var calculate = dateNow.difference(parsedDate);
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(parsedDate);
    var hours = parseDuration(calculate.toString());
    print(hours.inHours);
    return hours.inHours.toString();
  }

  Duration parseDuration(String s) {
    int hours = 0;
    int minutes = 0;
    int micros;
    List<String> parts = s.split(':');
    if (parts.length > 2) {
      hours = int.parse(parts[parts.length - 3]);
    }
    if (parts.length > 1) {
      minutes = int.parse(parts[parts.length - 2]);
    }
    micros = (double.parse(parts[parts.length - 1]) * 1000000).round();
    return Duration(hours: hours, minutes: minutes, microseconds: micros);
  }
}
