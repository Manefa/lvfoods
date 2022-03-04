import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/constants.dart';
import 'package:ivfoods_mobile_app/core/platform/icon/lv_icons.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/domain/entities/restaurant.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';

class RestaurantDetail extends StatefulWidget {
  final Restaurant? restaurant;

  const RestaurantDetail({Key? key, this.restaurant}) : super(key: key);
  @override
  _RestaurantDetailState createState() => _RestaurantDetailState();
}

class _RestaurantDetailState extends State<RestaurantDetail> {
  @override
  Widget build(BuildContext context) {
      var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: size.width,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 25.h,),
                Row(
                  children: <Widget>[
                    SizedBox(width: 35.w,),
                    Container(
                      height: 76.h,
                      width: 77.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(widget.restaurant!.profilePicture!),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    SizedBox(width: 15.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.restaurant!.name!,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontFamily: "Milliard",
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        SizedBox(height: 10.sp,),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.location_on_outlined,
                              size: 15.sp,
                              color: Color(0XFF949494),
                            ),
                            SizedBox(width: 10.w,),
                            SizedBox(
                              width: 130.w,
                              child: Text(
                                widget.restaurant!.address!,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Color(0XFF949494),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10.sp,),
                        widget.restaurant!.status == "enable" ?
                        Row(
                          children: <Widget>[
                            Icon(
                              LvIcons.shop,
                              size: 15.sp,
                              color: Color(0XFF68D389),
                            ),
                            SizedBox(width: 10.w,),
                            Text(
                                AppLocalizations.of(context)!.translate("open"),
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Color(0XFF68D389),
                              ),
                            )
                          ],
                        ):
                        Row(
                          children: <Widget>[
                            Icon(
                              LvIcons.shop,
                              size: 15.sp,
                              color: Color(0XFFD2727D),
                            ),
                            SizedBox(width: 10.w,),
                            Text(
                              AppLocalizations.of(context)!.translate("close"),
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Color(0XFFBC2C3D),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 35.h,),
                Row(
                  children: <Widget>[
                    SizedBox(width: 35.w,),
                    Text(
                        AppLocalizations.of(context)!.translate("openingTime"),
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: "Milliard",
                        color: Color(0XFF949494),
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    if(widget.restaurant!.hours!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Text(
                        widget.restaurant!.hours![0].hour!.open.toString()+" - "+widget.restaurant!.hours![0].hour!.close.toString(),
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontFamily: "Milliard",
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    SizedBox(width: 35.w,),
                  ],
                ),
                SizedBox(height: 25.h,),
                Row(
                  children: <Widget>[
                    SizedBox(width: 35.w,),
                    Text(
                      AppLocalizations.of(context)!.translate("email"),
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: "Milliard",
                        color: Color(0XFF949494),
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Text(
                        widget.restaurant!.email!,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontFamily: "Milliard",
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    SizedBox(width: 35.w,),
                  ],
                ),
                SizedBox(height: 25.h,),
                Row(
                  children: <Widget>[
                    SizedBox(width: 35.w,),
                    Text(
                        AppLocalizations.of(context)!.translate("phones"),
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: "Milliard",
                        color: Color(0XFF949494),
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Text(
                          (widget.restaurant!.phones!.length == 1 ) ? widget.restaurant!.phones![0].code.toString()+" "+widget.restaurant!.phones![0].content.toString() : widget.restaurant!.phones![0].code.toString()+" "+widget.restaurant!.phones![0].content.toString()+" / "+ widget.restaurant!.phones![1].code.toString()+" "+widget.restaurant!.phones![1].content.toString(),
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontFamily: "Milliard",
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    SizedBox(width: 35.w,),
                  ],
                ),
                SizedBox(height: 25.h,),
                Row(
                  children: <Widget>[
                    SizedBox(width: 35.w,),
                    Text(
                      AppLocalizations.of(context)!.translate("address"),
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: "Milliard",
                        color: Color(0XFF949494),
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    SizedBox(
                      width: 130.w,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0.0),
                        child: Text(
                          widget.restaurant!.address!,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: "Milliard",
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 4.w,),
                    Icon(
                      Icons.my_location_rounded,
                      size: 15.sp,
                      color: kPrimaryColor,
                    ),
                    SizedBox(width: 35.w,),
                  ],
                ),
                SizedBox(height: 25.h,),
                Row(
                  children: [
                    SizedBox(width: 35.w,),
                    Text(
                      AppLocalizations.of(context)!.translate("description"),
                      style: TextStyle(
                        fontFamily: "Milliard",
                        fontSize: 15.sp,
                        color: Color(0XFF949494),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h,),
                Center(
                  child: Container(
                    width: 341.w,
                    child:Text(
                      widget.restaurant!.description!,
                       style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0XFF2C2627),
                        fontFamily: "Milliard",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 60.h,),
                //TRACK THE RESTAURANT
                //TODO: hide this while waiting for the update
                // Row(
                //   children: [
                //     SizedBox(width: 35.w,),
                //     Container(
                //       height: 45.h,
                //       width: 342.w,
                //       decoration: BoxDecoration(
                //         color: kPrimaryColor,
                //         borderRadius: BorderRadius.circular(5),
                //       ),
                //       child: Center(
                //         child: Text(
                //           AppLocalizations.of(context)!.translate("trackTheRestaurant"),
                //           style: TextStyle(
                //             fontFamily: "Milliard",
                //             fontSize: 16.sp,
                //             fontWeight: FontWeight.w300,
                //             color: Colors.white
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(height: 10.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
