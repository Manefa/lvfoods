import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/core/platform/lv_icons.dart';
class AppBarRestaurant extends StatefulWidget {
  const AppBarRestaurant({Key? key}) : super(key: key);

  @override
  _AppBarRestaurantState createState() => _AppBarRestaurantState();
}

class _AppBarRestaurantState extends State<AppBarRestaurant> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(416, 897),
        orientation: Orientation.portrait);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/app_bar_image.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 28.h,),
          Container(
            width: 344.w,
            height: 42.h,
            child: Align(
                alignment: Alignment.centerRight,
                child:Container(
                  height: 42.r,
                  width: 42.r,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(
                      color: Colors.white,
                      width:2.r,
                    ),
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                )
            ),
          ),
          //Notification
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 344.w,
              height: 36.h,
              child: Align(
                alignment: Alignment.centerRight,

              ),
            ),
          ),
          SizedBox(height: 16.h,),
          //Welcome Back
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 344.w,
              height: 36.h,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Welcome back,",
                  style: TextStyle(
                      fontSize: 30.sp,
                      fontFamily: "Milliard",
                      color: Color(0XFFF9C8CE),
                      fontWeight: FontWeight.w300
                  ),

                ),
              ),
            ),
          ),
          //Angela
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 344.w,
              height: 22.h,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Landry Onguene",
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontFamily: "Milliard",
                      color: Colors.white,
                      fontWeight: FontWeight.w300
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 344.w,
            height: 55.h,
            child: Column(
              children: [
                //Order Total
                Container(
                  height: 20.h,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Order Total",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: "Milliard",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 35.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 23.h,
                        child: Row(
                          children: [
                            Icon(
                              LvIcons.delivery_boy,
                              color: Color(0XFFFFCBCB),
                              size: 20.sp,
                            ),
                            SizedBox(width: 6.w,),
                            //Deliver Person
                            Text(
                              "Restaurateur Person",
                              style: TextStyle(
                                fontFamily: "Milliard",
                                fontSize: 18.sp,
                                color: Color(0XFFFFCBCB),
                              ),
                            )


                          ],
                        ),
                      ),
                      Text(
                        "226",
                        style: TextStyle(
                          fontSize: 26.sp,
                          fontFamily: "Milliard",
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),

              ],
            ),
          )

        ],
      ),
    );
  }
}


