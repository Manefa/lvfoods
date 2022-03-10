import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/constants.dart';
import 'package:ivfoods_mobile_app/core/platform/icon/lv_icons.dart';
import 'package:ivfoods_mobile_app/core/platform/status_bar_manager.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChooseProfil extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      StatusBarManager.setColor(
        iconBrightness: Brightness.dark,
        color: Colors.white,
      );
    });

    Future<bool> _onBackPressed() async {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      return false;
    }
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Container(
              width: size.width,
              height: size.height,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 74.h,),
                  //TODO translate Hello to Salut
                  Container(
                    width: 344.w,
                    height: 32.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 252.w,
                          child: Text(
                            "Hello",
                            style: TextStyle(
                            fontFamily: "Milliard",
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500,
                          ),

                    ),
                        ),
                        Container(
                          height: 32.h,
                          child: IconButton(
                            icon: Icon(
                              LvIcons.logout,
                              size: 16.sp,
                              color: kPrimaryColor,
                            ),
                            onPressed: () {
                              sl<SharedPreferences>().clear();
                              Navigator.pushNamed(context, "/login");
                            },
                          ),
                        )

                      ],
                    ),
                  ),
                  SizedBox(height: 45.h,),
                  //Illustration
                  Container(
                    height: 341.h,
                    width: 341.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/chooseprofil_illustration.png"),
                          fit: BoxFit.contain,
                        ),
                      )
                  ),
                  SizedBox(height: 51.h,),
                  //ChooseProfile Text
                  Container(
                    width: 344.w,
                    child: Text(
                      AppLocalizations.of(context)!.translate("chooseDemo"),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: "Milliard",
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 41.h,),
                  //Profile Restaurateur
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, "/chooserestaurant");
                    },
                    child: Container(
                        height: 82.h,
                        width: 344.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.36),
                                  spreadRadius: -3,
                                  blurRadius: 10,
                                  offset: Offset(0, 5)
                              )
                            ]
                        ),
                        child:Center(
                          child: Container(
                            width: 300.w,
                            height: 50.h,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Container(
                                        height:49.h,
                                        width:49.w,
                                        child: Image.asset("images/dish.png"),
                                      ),
                                      SizedBox(width: 20.w,),

                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            AppLocalizations.of(context)!.translate("restaurantProfile"),
                                            style: TextStyle(
                                              fontFamily: "Milliard",
                                              fontSize:19.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(height: 4.h,),
                                          Text(
                                            AppLocalizations.of(context)!.translate("catPerson"),
                                            style: TextStyle(
                                              fontFamily: "Milliard",
                                              fontSize:13.sp,
                                              color: Color(0XFF949494),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded ,
                                  color: Color.fromRGBO(188, 44, 61, 1),
                                  size: 18.sp,
                                ),
                              ],
                            ),
                          ),
                        )
                    ),
                  ),
                  SizedBox(height: 25.h,),
                  //Profile Livreur
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, "/navigatorDeliveryPage");
                    },
                    child: Container(
                        height: 82.h,
                        width: 344.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.36),
                                  spreadRadius: -3,
                                  blurRadius: 10,
                                  offset: Offset(0, 5)
                              )
                            ]
                        ),
                        child:Center(
                          child: Container(
                            width: 300.w,
                            height: 50.h,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Container(
                                        height:49.h,
                                        width:49.w,
                                        child: Image.asset("images/delivery_man.png"),
                                      ),
                                      SizedBox(width: 20.w,),

                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            AppLocalizations.of(context)!.translate("deliveryPersonProfile"),
                                            style: TextStyle(
                                              fontFamily: "Milliard",
                                              fontSize:18.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(height: 4.h,),
                                          Text(
                                            AppLocalizations.of(context)!.translate("deliveryPerson"),
                                            style: TextStyle(
                                              fontFamily: "Milliard",
                                              fontSize:13.sp,
                                              color: Color(0XFF949494),
                                            ),
                                          ),
                                        ],
                                      ),

                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded ,
                                  color: Color.fromRGBO(188, 44, 61, 1),
                                  size: 18.sp,
                                ),
                              ],
                            ),
                          ),
                        )
                    ),
                  ),





                ],
              ),
            ),
        ),
      ),
    );
  }
}
