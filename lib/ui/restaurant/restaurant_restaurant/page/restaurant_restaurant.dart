import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/core/platform/lv_icons.dart';
import 'package:ivfoods_mobile_app/core/platform/lv_icons_resto.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/infos/infos_restaurant.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/menu/menu_restaurant.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/orders/orders_restaurants.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/orders/sub_widgets/order_restaurant_custombar.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/times/times_restaurant.dart';


class RestaurantResto extends StatefulWidget {
  const RestaurantResto({Key? key}) : super(key: key);

  @override
  _RestaurantRestoState createState() => _RestaurantRestoState();
}

class _RestaurantRestoState extends State<RestaurantResto> {
  List<String> data = ['Menu', 'Orders', 'Infos', 'Time'];
  int initPosition = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> widget = [MenuRestaurant(), OrdersRestaurant(), InfosRestaurant(), TimesRestaurant()];
    double width = MediaQuery.of(context).size.width;
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(416, 897),
        orientation: Orientation.portrait);
    return Scaffold(
      //backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0.h,
              child: Container(
                height: 247.h,
                width: width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/appbarrestaurant.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            //Info
            Positioned(
                top: 218.h,
                child: Container(
                  height: 678.h,
                  width: width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.r),
                        topLeft:  Radius.circular(30.r),
                      )
                  ),

                  child:Column(
                    children: [
                      SizedBox(height: 23.h,),
                      Center(
                        child: Container(
                          height: 77.h,
                          width: 344.w,
                          child: Row(
                            children: [
                              //ImageRestau
                              Container(
                                height:76.h ,
                                width:77.w ,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: NetworkImage('images/appbarrestaurant.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                              SizedBox(width: 17.w,),
                              Expanded(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        //RestauName
                                        Container(
                                          height: 24.h,
                                          width: 245.w,
                                          child: Text(
                                            "Mc Donald's Yaoundé",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                fontFamily: "Milliard",
                                                fontWeight: FontWeight.w500
                                            ),

                                          ),
                                        ),
                                        //Localisation
                                        SizedBox(height: 3.h,),
                                        Container(
                                          height: 19.h,
                                          width: 245.w,
                                          child: Row(
                                            children: [
                                              Icon(
                                                LvIcons.pin,
                                                size: 16.sp,
                                                color:Color.fromRGBO(148, 148, 148,1),
                                              ),
                                              SizedBox(width: 7.w,),
                                              //localisationName
                                              Text(
                                                "Byem-assi. Yaoundé",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color:Color.fromRGBO(148, 148, 148,1),
                                                  fontSize: 16.sp,
                                                  fontFamily: "Milliard",
                                                ),

                                              ),

                                            ],
                                          ),
                                        ),
                                        //OtherInfos
                                        SizedBox(height: 4.h,),
                                        Container(
                                          height: 23.h,
                                          width: 249.w,
                                          child: IntrinsicHeight(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                //First Info
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      //Note
                                                      Icon(
                                                        LvIconsResto.star,
                                                        color:Color.fromRGBO(251, 182, 52, 1),
                                                        size: 18.sp,
                                                      ),
                                                      SizedBox(width: 4.w,),
                                                      Text(
                                                        '4.5',
                                                        style: TextStyle(
                                                          fontSize: 18.sp,
                                                          fontFamily: "Milliard",
                                                          fontWeight: FontWeight.w200,
                                                        ),
                                                      ),
                                                      //VerticaleDevider
                                                      VerticalDivider(),
                                                      //ProductNumber
                                                      Icon(
                                                        LvIconsResto.product,
                                                        size: 18.sp,
                                                        color: Color.fromRGBO(70, 128, 232,1),
                                                      ),
                                                      SizedBox(width: 5.8.w,),
                                                      Text(
                                                        '41 Products',
                                                        style: TextStyle(
                                                            fontSize: 18.sp,
                                                            fontFamily: "Milliard",
                                                            color:Color.fromRGBO(148, 148, 148, 1)
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                //Statut
                                                Container(
                                                  width: 56.w,
                                                  height: 23.h,
                                                  decoration: BoxDecoration(
                                                      color: Color.fromRGBO(222, 249, 231, 1),
                                                      borderRadius: BorderRadius.circular(5.r)
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'Enable',
                                                      style: TextStyle(
                                                          fontSize: 16.sp,
                                                          fontFamily: "Milliard",
                                                          fontWeight: FontWeight.w300,
                                                          color:Color.fromRGBO(104, 211, 137, 1)
                                                      ),
                                                    ),
                                                  ),
                                                )

                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: CustomTabView(
                          initPosition: initPosition,
                          itemCount: data.length,
                          tabBuilder: (context, index) => Tab(text: data[index]),
                          pageBuilder: (context, index) => widget[index],
                          onPositionChange: (index){
                            print('current position: $index');
                            initPosition = index;
                          },
                          onScroll: (position) => print('$position'),
                        ),
                      ),

                    ],
                  ) ,
                ))
          ],
        ),
      ),
    );
  }
}
