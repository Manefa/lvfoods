import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoOrders extends StatefulWidget {
  @override
  _NoOrdersState createState() => _NoOrdersState();
}

class _NoOrdersState extends State<NoOrders> {
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
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
                "No Orders !",
                style: TextStyle(
                  fontFamily: "Milliard",
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 30.h,),
              Text(
                "Orders will be displayed here if there is an alert. or other ",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontFamily: "Milliard",
                ),
              ),
              SizedBox(height: 2.h,),
              Text(
                "important information",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontFamily: "Milliard",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
