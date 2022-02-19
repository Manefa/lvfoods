import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_restaurant/domain/entities/get_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_styles/domain/entities/style.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/menu/edit_restau/edit_restau_display.dart';

class EditRestaurant extends StatefulWidget {
  final List<Style> styles;
  final String name;
  final GetRestaurant getRestaurant;
  const EditRestaurant({Key? key, required this.styles, required this.name, required this.getRestaurant}) : super(key: key);

  @override
  _EditRestaurantState createState() => _EditRestaurantState();
}

class _EditRestaurantState extends State<EditRestaurant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          "Edit Restaurant",
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
      body: EditRestauDisplay(styles: widget.styles, name: widget.name, getRestaurant: widget.getRestaurant,),
      backgroundColor: Colors.white,
    );
  }
}
