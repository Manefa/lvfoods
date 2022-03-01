import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/notifications_page/widgets/notification_restau_display.dart';
class NotificationRestaurant extends StatefulWidget {
  const NotificationRestaurant({Key? key}) : super(key: key);

  @override
  _NotificationRestaurantState createState() => _NotificationRestaurantState();
}

class _NotificationRestaurantState extends State<NotificationRestaurant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          AppLocalizations.of(context)!.translate("notifications"),
          style: TextStyle(
              color: Colors.black,
              fontFamily: "Milliard",
              fontSize: 20.sp,
              fontWeight: FontWeight.w400
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: NotificationRestauDisplay(),
      backgroundColor: Colors.white,
    );
  }
}
