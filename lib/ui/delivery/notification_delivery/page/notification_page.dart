import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              SizedBox(height: 34.h,),
              Container(
                width: 344.w,
                height: 36.h,
                child: Row(
                  children: [
                    SizedBox(width: 122.w,),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 100.w,
                        child:Text(
                          AppLocalizations.of(context)!.translate("notifications"),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: "Milliard",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    //Notification
                  ],
                ),
              ),
              SizedBox(height: 125.h,),
              Container(
                height: 206.h,
                width: 266.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/no_notifications.png"),
                    fit: BoxFit.contain,
                  )
                ),
              ),
              SizedBox(height: 56.h,),
              Text(
                "No notification !",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: "Milliard",
                  fontSize: 20.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 31.h,),
              Text(
                "Notifications will be displayed here if there is an alert. or \n                            other important information",
                style: TextStyle(
                  fontFamily: "Milliard",
                  fontSize: 14.sp,
                  color: Color(0XFF2C2627)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
