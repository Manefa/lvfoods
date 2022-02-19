import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/times/time_restaurant_display.dart';
class TimesRestaurant extends StatefulWidget {
  const TimesRestaurant({Key? key}) : super(key: key);

  @override
  _TimesRestaurantState createState() => _TimesRestaurantState();
}

class _TimesRestaurantState extends State<TimesRestaurant> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(416, 897),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.portrait);
    return TimesRestaurantDisplay();
  }
}
