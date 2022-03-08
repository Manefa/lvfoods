import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/notifications_page/widgets/notification_restau_details.dart';


class NotificationRestauDisplay extends StatefulWidget {
  const NotificationRestauDisplay({Key? key}) : super(key: key);

  @override
  _NotificationRestauDisplayState createState() => _NotificationRestauDisplayState();
}

class _NotificationRestauDisplayState extends State<NotificationRestauDisplay> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 344.h,
            width: 344.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/no_notification.png"),
                  fit: BoxFit.contain,
                ),
              )
          ),
          SizedBox(height: 36.h,),
           SizedBox(
             width: 344.w,
             child: Text(
          "Les notifications sont indisponibles pour le moment ",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18.sp,
                fontFamily: "Milliard",
                fontWeight: FontWeight.w500,

              ),
          ),
           ),


        ],
      ),
    );
  }
}
