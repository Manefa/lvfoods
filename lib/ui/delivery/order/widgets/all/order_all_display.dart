import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/core/platform/lv_icons.dart';


enum Level {
  toDelivery, InProgress, carryOut
}

class OrderAllModel{
  final String name;
  final String location;
  final String hours;
  final int qtt;
  final bool state;
  final Level level;

  OrderAllModel({required this.name, required this.location, required this.hours, required this.qtt, required this.state, required this.level});
}

OrderAllModel items1 = new OrderAllModel(
  name: "Taro Sauce Jaune",
  location: "Byem-assi. Yaoundé",
  hours: "3",
  qtt: 2,
  state: true,
  level: Level.carryOut,
);

OrderAllModel items2 = new OrderAllModel(
  name: "Shawarma",
  location: "Byem-assi. Yaoundé",
  hours: "2",
  qtt: 2,
  state: false,
  level: Level.InProgress,
);

OrderAllModel items3 = new OrderAllModel(
  name: "Poulet rôtie, Pamplemousse 1L",
  location: "Byem-assi. Yaoundé",
  hours: "8",
  qtt: 2,
  state: true,
  level: Level.toDelivery,
);

OrderAllModel items4 = new OrderAllModel(
  name: "Taro Sauce Jaune",
  location: "Byem-assi. Yaoundé",
  hours: "3",
  qtt: 2,
  state: false,
  level: Level.toDelivery,
);

OrderAllModel items5 = new OrderAllModel(
  name: "Eru couscous manioc",
  location: "Byem-assi. Yaoundé",
  hours: "3",
  qtt: 2,
  state: true,
  level: Level.carryOut,
);

OrderAllModel items6 = new OrderAllModel(
  name: "Pizza Roma supplément de fromage",
  location: "Byem-assi. Yaoundé",
  hours: "3",
  qtt: 2,
  state: false,
  level: Level.InProgress,
);


class OrderAllDisplay extends StatefulWidget {
  @override
  _OrderAllDisplayState createState() => _OrderAllDisplayState();
}

class _OrderAllDisplayState extends State<OrderAllDisplay> {
  @override
  Widget build(BuildContext context) {
    List<OrderAllModel> items = [items6, items2, items3, items4, items5, items6];
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(416, 897),
        orientation: Orientation.portrait);
    return SingleChildScrollView(
      child : ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(right: 35, left: 35),
        shrinkWrap: true,
        clipBehavior: Clip.none,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index){
          return Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          items[index].name,
                          style: TextStyle(
                            fontFamily: "Milliard",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10.h,),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.location_on_outlined,
                              size: 15.sp,
                              color: Color(0XFF949494),
                            ),
                            SizedBox(width: 10.w,),
                            Text(
                              items[index].location,
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.access_time_rounded,
                              size: 15.sp,
                              color: Color(0XFF949494),
                            ),
                            SizedBox(width: 10.w,),
                            Text(
                              items[index].hours+" Hours Ago",
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              LvIcons.dollar__1_,
                              size: 15.sp,
                              color: items[index].state ? Color(0XFF4884EE) : Color(0XFFBC2C3D),
                            ),
                            SizedBox(width: 5.w,),
                            Text(
                              items[index].state ? "Paid" : "Unpaid",
                              style: TextStyle(
                                fontFamily: "Milliard",
                                fontSize: 15.sp,
                                color: items[index].state ? Color(0XFF4884EE) : Color(0XFFBC2C3D),
                              ),
                            ),
                            SizedBox(width: 16.w,),
                            Container(
                              height: 12.h,
                              width: 1.w,
                              color: Color(0XFFBCBCBC),
                            ),
                            SizedBox(width: 16.w,),
                            Icon(
                              LvIcons.dish,
                              size: 15.sp,
                              color:  Color(0XFF4884EE),
                            ),
                            SizedBox(width: 3.w,),
                            Padding(
                              padding: const EdgeInsets.only(top: 2.0),
                              child: Text(
                                "X "+items[index].qtt.toString(),
                                style: TextStyle(
                                  color:  Color(0XFF4884EE),
                                  fontFamily: "Milliard",
                                  fontSize: 15.sp,
                                ),
                              ),
                            ),
                            SizedBox(width: 16.w,),
                            Container(
                              height: 12.h,
                              width: 1.w,
                              color: Color(0XFFBCBCBC),
                            ),
                            SizedBox(width: 16.w,),
                            items[index].level == Level.carryOut ?
                            Container(
                              height: 20.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                color: Color(0XFFEFFBF2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.check,
                                size: 12.sp,
                                color: Color(0XFF68D389),
                              ),
                            ) : (
                                items[index].level == Level.toDelivery ?
                                Container(
                                  height: 20.h,
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                    color: Color(0XFFF4EFFF),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                    Icons.clean_hands_sharp,
                                    size: 12.sp,
                                    color: Color(0XFFA27AFA),
                                  ),
                                ) : Container(
                                  height: 20.h,
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                    color: Color(0XFFFFF7E9),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                    Icons.access_time_rounded,
                                    size: 12.sp,
                                    color: Color(0XFFFBB634),
                                  ),
                                )
                            ),
                            SizedBox(width: 5.w,),
                            items[index].level == Level.carryOut ?
                            Text(
                              "Delivered",
                              style: TextStyle(
                                color: Color(0XFF68D389),
                                fontSize: 15.sp,
                                fontFamily: "Milliard",
                              ),
                            ) : (
                                items[index].level == Level.toDelivery ?
                                Text(
                                  "Ready",
                                  style: TextStyle(
                                    color: Color(0XFFA27AFA),
                                    fontSize: 15.sp,
                                    fontFamily: "Milliard",
                                  ),
                                ) : Text(
                                  "In Progress",
                                  style: TextStyle(
                                    color: Color(0XFFFBB634),
                                    fontSize: 15.sp,
                                    fontFamily: "Milliard",
                                  ),
                                )
                            ),
                          ],
                        ),
                      ],
                    ),
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
          );
        },
      ),
    );
  }
}
