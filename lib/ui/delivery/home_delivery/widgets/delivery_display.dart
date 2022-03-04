import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ivfoods_mobile_app/core/platform/icon/lv_icons.dart';
import 'package:ivfoods_mobile_app/features/deliveries/domain/entities/deliveries_master.dart';
import 'package:ivfoods_mobile_app/features/deliveries/domain/entities/delivery.dart';
import 'package:ivfoods_mobile_app/features/deliveries/domain/entities/order.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';
import 'package:ivfoods_mobile_app/ui/delivery/delivery_detail/page/delivery_detail_page.dart';

class DeliveryDisplay extends StatefulWidget {
  final List<Delivery> deliveries;

  const DeliveryDisplay({Key? key, required this.deliveries}) : super(key: key);
  @override
  _DeliveryDisplayState createState() => _DeliveryDisplayState();
}

class _DeliveryDisplayState extends State<DeliveryDisplay> {
  var gen = new Random();
  int i= 0;
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(right: 35, left: 35),
        shrinkWrap: true,
        clipBehavior: Clip.none,
        itemCount: widget.deliveries.length,
        itemBuilder: (BuildContext context, int index){
          List<Order>? list = widget.deliveries[index].orderGroup!.orders;
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

          print(names);

          return InkWell(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => DeliveryDetailPage(code: widget.deliveries[index].code!)),);
            },
            child: Container(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                            Text(
                            change(names.values),
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: "Milliard",
                              fontSize: 16.sp,
                            ),
                          ),
                            SizedBox(height: 10.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Icon(
                                  Icons.location_on_outlined,
                                  size: 15.sp,
                                  color: Color(0XFF949494),
                                ),
                              SizedBox(width: 10.h,),
                              Flexible(
                                child: Text(
                                  widget.deliveries[index].country.toString() + " - " + widget.deliveries[index].city.toString()+ " - " + widget.deliveries[index].district.toString(),
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontFamily: "Milliard",
                                    color: Color(0XFF949494),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.access_time_rounded,
                                  size: 15.sp,
                                  color: Color(0XFF949494),
                                ),
                                SizedBox(width: 10.w,),
                                Text(
                                  getHour(widget.deliveries[index].createdAt.toString()).toString()+" min",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontFamily: "Milliard",
                                    color: Color(0XFF949494),
                                  ),
                                ),
                              ],
                            ),
                              SizedBox(height: 10.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                widget.deliveries[index].statusPayment == "paid" && widget.deliveries[index].orderGroup!.statusPayment == "paid"?
                              Icon(
                                Icons.monetization_on_outlined,
                                size: 15.sp,
                                color: Color(0XFF4784EE),
                              ): Icon(
                                  Icons.monetization_on_outlined,
                                  size: 15.sp,
                                  color: Color(0XFFBC2C3D),
                                ),
                              SizedBox(width: 5.w,),
                                widget.deliveries[index].statusPayment == "paid" && widget.deliveries[index].orderGroup!.statusPayment == "paid" ?
                              Text(
                                AppLocalizations.of(context)!.translate("paid"),
                                style: TextStyle(
                                  color: Color(0XFF4784EE),
                                  fontSize: 15.sp,
                                ),
                              ) : Text(
                                  AppLocalizations.of(context)!.translate("unPaid"),
                                style: TextStyle(
                                  color: Color(0XFFBC2C3D),
                                  fontSize: 15.sp,
                                ),
                              ),
                              SizedBox(width: 30.w,),
                              Icon(
                                LvIcons.dish,
                                size: 15.sp,
                                color: Color(0XFF4884EE),
                              ),
                              SizedBox(width: 5.w,),
                              Text(
                                "X "+getQuantity(widget.deliveries[index].orderGroup!.orders),
                                style: TextStyle(
                                  color: Color(0XFF4884EE),
                                  fontSize: 15.sp,
                                ),
                              ),
                              SizedBox(width: 24.w,),
                                widget.deliveries[index].status == "ready" ?
                              Row(
                                children: [
                                  Container(
                                    height: 18.r,
                                    width: 18.r,
                                    decoration: BoxDecoration(
                                        color: Color(0XFFF4EFFF),
                                        borderRadius: BorderRadius.circular(8)
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.clean_hands_sharp,
                                        size: 10.sp,
                                        color: Color(0XFFA27AFA),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 5.w,),
                                  Text(
                                    AppLocalizations.of(context)!.translate("ready"),
                                    style: TextStyle(
                                        color: Color(0XFFA27AFA),
                                        fontSize: 15.sp,
                                        fontFamily: "Milliard"
                                    ),
                                  ),
                                ],
                              ) : (widget.deliveries[index].status == "delivered") ?
                                Row(
                                  children: [
                                    Container(
                                      height: 18.r,
                                      width: 18.r,
                                      decoration: BoxDecoration(
                                          color: Color(0XFFEFFBF2),
                                          borderRadius: BorderRadius.circular(8)
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.check,
                                          size: 10.sp,
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
                                          fontFamily: "Milliard"
                                      ),
                                    ),
                                  ],
                                ): (widget.deliveries[index].status == "on_the_way") ?
                                Row(
                                  children: [
                                    Container(
                                      height: 18.r,
                                      width: 18.r,
                                      decoration: BoxDecoration(
                                          color: Color(0XFFFFF7E9),
                                          borderRadius: BorderRadius.circular(8)
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.access_time_sharp,
                                          size: 10.sp,
                                          color: Color(0XFFFBB634),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5.w,),
                                    Text(
                                      AppLocalizations.of(context)!.translate("onTheWay"),
                                      style: TextStyle(
                                          color: Color(0XFFFBB634),
                                          fontSize: 15.sp,
                                          fontFamily: "Milliard"
                                      ),
                                    ),
                                  ],
                                ) : Row(
                                  children: [
                                    Container(
                                      height: 18.r,
                                      width: 18.r,
                                      decoration: BoxDecoration(
                                          color: Color(0XFFFFF7E9),
                                          borderRadius: BorderRadius.circular(8)
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.access_time_sharp,
                                          size: 10.sp,
                                          color: Color(0XFFFBB634),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5.w,),
                                    Text(
                                      widget.deliveries[index].status!,
                                      style: TextStyle(
                                          color: Color(0XFFFBB634),
                                          fontSize: 15.sp,
                                          fontFamily: "Milliard"
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ],
                      )),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Color(0XFFBCBCBC),
                        size: 15.sp,
                      ),
                    ],
                  ),
                  Divider(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String getHour(String hour) {
    var parsedDate = DateTime.parse(hour);
    var dateNow = DateTime.now();
    var calculate = dateNow.difference(parsedDate);
    String formattedDate = DateFormat('kk:mm').format(parsedDate);
    return formattedDate;
  }

  String change(Iterable<String> values) {
    String value = "";
    int i = 0;
    values.forEach((element) {
      value = element;
    });
    return value;
  }

  String getQuantity(List<Order>? orders) {
    String quantity = "";
    orders!.forEach((element) {
      quantity = element.quantity.toString();
    });
    return quantity;
  }
}
