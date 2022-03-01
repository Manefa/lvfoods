import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/constants.dart';
import 'package:ivfoods_mobile_app/core/platform/status_bar_manager.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      StatusBarManager.setColor(
        iconBrightness: Brightness.light,
        color: kPrimaryColor,
      );
    });

    final success = (sl<SharedPreferences>().getString('success'));
    (success == "true") ? Timer(Duration(seconds: 3), () => Navigator.pushNamed(context, "/chooseprofil")) : Timer(kAnimationDuration, () => Navigator.pushNamed(context, "/onboarding"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          color: kPrimaryColor,
          child: Center(
            child: Container(
              height:210.h,
              width: 210.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      "images/logo.png"
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
