import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/infos/infos_restaurant_display.dart';
class InfosRestaurant extends StatefulWidget {
  final String name;
  const InfosRestaurant({Key? key, required this.name}) : super(key: key);

  @override
  _InfosRestaurantState createState() => _InfosRestaurantState();
}

class _InfosRestaurantState extends State<InfosRestaurant> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(416, 897),
        orientation: Orientation.portrait);
    return InfosRestaurantDisplay(name: widget.name,);
  }
}
