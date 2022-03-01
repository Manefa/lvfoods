import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/chose_restaurant/widgets/choose_restau_display.dart';

import '../../../../constants.dart';
class ChooseRestaurant extends StatefulWidget {
  const ChooseRestaurant({Key? key}) : super(key: key);

  @override
  _ChooseRestaurantState createState() => _ChooseRestaurantState();
}

class _ChooseRestaurantState extends State<ChooseRestaurant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height:50.h ,),
              Text(
                AppLocalizations.of(context)!.translate("chooseYourRestaurant"),
                style: TextStyle(
                  fontFamily: "Milliard",
                  fontSize: 26.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height:50.h ,),
              Container(
                width: 344.w,
                height: 625.h,
                child: ChooseRestaurantDisplay(),
              ),
              SizedBox(height:26.h ,),
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 25.h,
                      left: -108.w,
                      child: Container(
                        height: 631.h,
                        width: 631.w,
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(900)
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
