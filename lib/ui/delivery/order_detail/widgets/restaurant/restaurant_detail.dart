import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/constants.dart';
import 'package:ivfoods_mobile_app/core/platform/lv_icons.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/domain/entities/restaurant.dart';

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
                  Center(
                    child: Container(
                      width: 340.w,
                      child: Row(
                        children: <Widget>[
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
                              Container(
                                width: 246.w,
                                child: Text(
                                  widget.restaurant!.name!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontFamily: "Milliard",
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                              ),
                              SizedBox(height: 8.h,),
                              Container(
                                width: 246.w,
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.location_on_outlined,
                                      size: 14.sp,
                                      color: Color(0XFF949494),
                                    ),
                                    SizedBox(width: 10.w,),
                                    Container(
                                      width: 222.w,
                                      child: Text(
                                        widget.restaurant!.address!,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Color(0XFF949494),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 8.h,),
                              widget.restaurant!.status == "enable" ?
                              Row(
                                children: <Widget>[
                                  Icon(
                                    LvIcons.shop,
                                    size: 14.sp,
                                    color: Color(0XFF68D389),
                                  ),
                                  SizedBox(width: 10.w,),
                                  Text(
                                    "Open",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Color(0XFF68D389),
                                    ),
                                  )
                                ],
                              ):
                              Row(
                                children: <Widget>[
                                  Icon(
                                    LvIcons.shop,
                                    size: 14.sp,
                                    color: Color(0XFFD2727D),
                                  ),
                                  SizedBox(width: 10.w,),
                                  Text(
                                    "Close",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Color(0XFFBC2C3D),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 35.h,),
                  //Time
                  Center(
                    child: Container(
                      width: 340.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Time",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: "Milliard",
                              color: Color(0XFF949494),
                            ),
                          ),
                          Expanded(
                              child: Container(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    widget.restaurant!.hours![0].hour!.open.toString()+" - "+widget.restaurant!.hours![0].hour!.close.toString(),
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontFamily: "Milliard",
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),

                          )
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h,),
                  //Mail
                  Center(
                    child: Container(
                      width: 340.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Mail",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: "Milliard",
                              color: Color(0XFF949494),
                            ),
                          ),
                          Expanded(
                              child: Container(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                widget.restaurant!.email!,
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontFamily: "Milliard",
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h,),
                  //Phone
                  Center(
                    child: Container(
                      width: 340.w,
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Phones",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: "Milliard",
                              color: Color(0XFF949494),
                            ),
                          ),
                          Expanded(child: Container(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child:Text(
                                (widget.restaurant!.phones!.length == 1 ) ? widget.restaurant!.phones![0].code.toString()+" "+widget.restaurant!.phones![0].content.toString() : widget.restaurant!.phones![0].code.toString()+" "+widget.restaurant!.phones![0].content.toString()+" / "+ widget.restaurant!.phones![1].code.toString()+" "+widget.restaurant!.phones![1].content.toString(),
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontFamily: "Milliard",
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 25.h,),
                  //Adress
                  Center(
                    child: Container(
                      width: 340.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Address",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: "Milliard",
                              color: Color(0XFF949494),
                            ),
                          ),
                          SizedBox(width: 15.h,),
                          Expanded(
                              child: Container(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child:Text(
                                widget.restaurant!.address!,
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontFamily: "Milliard",
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.w300,
                                ),
                              ) ,
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h,),
                  Center(
                    child: Container(
                      width: 340.w,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Description",
                              style: TextStyle(
                                  color: Color.fromRGBO(148, 148, 148, 1),
                                  fontFamily: "Milliard",
                                  fontSize: 15.sp,
                              ),
                            ),
                          ),
                          SizedBox(height: 6.h,),
                          Text(
                            widget.restaurant!.description!,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Color(0XFF2C2627),
                              fontFamily: "Milliard",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 60.h,),
                  //TRACK THE RESTAURANT
                /*Row(
                        children: [
                          SizedBox(width: 35.w,),
                          Container(
                            height: 45.h,
                            width: 342.w,
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                "TRACK THE RESTAURANT",
                                style: TextStyle(
                                  fontFamily: "Milliard",
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),*/
                ],
              ),
          ),
        ),
      ),
    );
  }
}
