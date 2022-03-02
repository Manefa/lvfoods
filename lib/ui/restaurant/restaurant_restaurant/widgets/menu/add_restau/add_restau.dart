import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_city/domain/entities/city.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_country/domain/entities/country.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_styles/domain/entities/style.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/menu/add_restau/add_restau_display.dart';
class AddRestaurant extends StatefulWidget {
  final List<Style> styles;
  final List<Country> countries;
  final List<City> cities;

  const AddRestaurant({Key? key, required this.styles, required this.countries, required this.cities}) : super(key: key);

  @override
  _AddRestaurantState createState() => _AddRestaurantState();
}

class _AddRestaurantState extends State<AddRestaurant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          AppLocalizations.of(context)!.translate("addRestaurant"),
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
      body: AddRestauDisplay(styles: widget.styles, countries: widget.countries, cities: widget.cities,),
      backgroundColor: Colors.white,
    );
  }
}
