import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/constants.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChooseProfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(416, 897),
        orientation: Orientation.portrait);
    var size = MediaQuery.of(context).size;

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
                  SizedBox(height: 80.h,),
                  Text(
                    "Choisissez La Demo Du\nProfil Souhaité",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Milliard",
                      fontSize: 27.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 65.h,),
                  //Profile Restaurateur
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, "/navigatorrestaurantpage");
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
                                            "Profil Restaurateur",
                                            style: TextStyle(
                                              fontFamily: "Milliard",
                                              fontSize:19.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(height: 4.h,),
                                          Text(
                                            "Catering person",
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
                                  color: Color(0XFFBCBCBC),
                                  size: 15.sp,
                                ),
                              ],
                            ),
                          ),
                        )
                    ),
                  ),
                  SizedBox(height: 39.h,),
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
                                            "Profil Livreur",
                                            style: TextStyle(
                                              fontFamily: "Milliard",
                                              fontSize:19.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(height: 4.h,),
                                          Text(
                                            "Delivery person",
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
                                  color: Color(0XFFBCBCBC),
                                  size: 15.sp,
                                ),
                              ],
                            ),
                          ),
                        )
                    ),
                  ),
                  SizedBox(height: 99.h,),
                  Expanded(
                      child:Container(
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(170.r),
                              topLeft:  Radius.circular(170.r)

                          ),
                        ),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 91.h,),
                            Container(
                              width: size.width,
                              child: Center(
                                child: InkWell(
                                  onTap: (){
                                    sl<SharedPreferences>().clear();
                                    Navigator.pushNamed(context, "/login");
                                  },
                                  child:Container(
                                    width: 174.w,
                                    height: 63.h,
                                    child: Center(
                                      child:  Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Image.asset("images/skyp_arrow_left.png"),
                                          SizedBox(width: 14.w,),
                                          Text(
                                            "Back to login",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize:18.sp,
                                              fontFamily: "Milliard",
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),

                      )

                  )

                ],
              ),
            ),
        ),
      ),
    );
  }
}
