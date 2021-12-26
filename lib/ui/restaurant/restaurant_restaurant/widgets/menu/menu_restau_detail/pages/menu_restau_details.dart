import 'package:flutter/material.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/menu/menu_restau_detail/widgets/menu_restau_details_display.dart';
class RestauMenuDetails extends StatefulWidget {
  const RestauMenuDetails({Key? key}) : super(key: key);

  @override
  _RestauMenuDetailsState createState() => _RestauMenuDetailsState();
}

class _RestauMenuDetailsState extends State<RestauMenuDetails> {
  @override
  Widget build(BuildContext context) {
    return RestauMenuDetailsDisplay();
  }
}
