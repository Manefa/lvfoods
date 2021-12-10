import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderStateDisplayModel{
  final IconData icon;
  final int quantity;

  OrderStateDisplayModel({required this.icon, required this.quantity});
}

class OrderStateDisplay extends StatefulWidget {
  @override
  _OrderStateDisplayState createState() => _OrderStateDisplayState();
}

class _OrderStateDisplayState extends State<OrderStateDisplay> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(416, 897),
        orientation: Orientation.portrait);
    return Container(
      height: 75.h,
      color: Colors.white,
      width: size.width,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(right: 35, left: 35),
        shrinkWrap: true,
        clipBehavior: Clip.none,
        children: <Widget>[
          Container(
            height: 72.h,
            width: 130.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0, 5),
                  spreadRadius: -17,
                  blurRadius: 20,
                ),
              ]
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: 15.h,),
                Flexible(
                  flex: 2,
                  fit: FlexFit.loose,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(width: 8.h,),
                      Container(
                      height: 20.r,
                      width: 20.r,
                      decoration: BoxDecoration(
                        color: Color(0XFFF4EFFF),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.clean_hands_sharp,
                          size: 14.sp,
                          color: Color(0XFFA27AFA),
                        ),
                      ),
                    ),
                      SizedBox(width: 8.h,),
                      Text(
                        "Ready",
                        style: TextStyle(
                          color: Color(0XFFA27AFA),
                          fontSize: 15.sp,
                          fontFamily: "Milliard"
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 14.h,),
                Row(
                    children: <Widget>[
                      SizedBox(width: 38.w,),
                      Text(
                        "14 Orders",
                        style: TextStyle(
                          fontFamily: "Milliard",
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          SizedBox(width: 20.w,),
          Container(
            height: 72.h,
            width: 130.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, 5),
                    spreadRadius: -17,
                    blurRadius: 20,
                  ),
                ]
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: 15.h,),
                Flexible(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(width: 8.w,),
                       Container(
                    height: 20.r,
                    width: 20.r,
                    decoration: BoxDecoration(
                      color: Color(0XFFFFF7E9),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.access_time_rounded,
                        size: 14.sp,
                        color: Color(0XFFFBB634),
                      ),
                    ),
                  ),
                      SizedBox(width: 8.w,),
                      Text(
                        "In Progress",
                        style: TextStyle(
                            color: Color(0XFFFBB634),
                            fontSize: 15.sp,
                            fontFamily: "Milliard"
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 14.h,),
                Row(
                  children: <Widget>[
                    SizedBox(width: 38.w,),
                    Text(
                      "14 Orders",
                      style: TextStyle(
                        fontFamily: "Milliard",
                        fontSize: 15.sp,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(width: 20.w,),
          Container(
            height: 72.h,
            width: 130.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, 5),
                    spreadRadius: -17,
                    blurRadius: 20,
                  ),
                ]
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: 15.h,),
                Flexible(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(width: 8.w,),
                      Container(
                        height: 20.r,
                        width: 20.r,
                        decoration: BoxDecoration(
                            color: Color(0XFFF8E8EA),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.cancel,
                            size: 14.sp,
                            color: Color(0XFFBC2C3D),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w,),
                      Text(
                        "Canceled",
                        style: TextStyle(
                            color: Color(0XFFBC2C3D),
                            fontSize: 15.sp,
                            fontFamily: "Milliard"
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 14.h,),
                Row(
                  children: <Widget>[
                    SizedBox(width: 38.w,),
                    Text(
                      "14 Orders",
                      style: TextStyle(
                        fontFamily: "Milliard",
                        fontSize: 15.sp,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(width: 20.w,),
          Container(
            height: 72.h,
            width: 130.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, 5),
                    spreadRadius: -17,
                    blurRadius: 20,
                  ),
                ]
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: 15.h,),
                Flexible(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(width: 8.w,),
                      Container(
                    height: 20.r,
                    width: 20.r,
                    decoration: BoxDecoration(
                      color: Color(0XFFEFF8EF),
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
                      SizedBox(width: 8.w,),
                      Text(
                        "Delivred",
                        style: TextStyle(
                            color: Color(0XFF68D389),
                            fontSize: 15.sp,
                            fontFamily: "Milliard"
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 14.h,),
                Row(
                  children: <Widget>[
                    SizedBox(width: 38.w,),
                    Text(
                      "14 Orders",
                      style: TextStyle(
                        fontFamily: "Milliard",
                        fontSize: 15.sp,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
