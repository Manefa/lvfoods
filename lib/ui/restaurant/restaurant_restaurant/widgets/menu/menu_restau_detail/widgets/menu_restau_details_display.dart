import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/core/platform/lv_icons.dart';
import 'package:ivfoods_mobile_app/core/platform/lv_icons_resto.dart';
import 'package:ivfoods_mobile_app/ui/delivery/delivery/widgets/sub_widgets/custom_tab_view_order.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/menu/menu_restau_detail/widgets/infos_menu_display.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/menu/menu_restau_detail/widgets/rating_menu_display.dart';

class RestauMenuDetailsDisplay extends StatefulWidget {
  const RestauMenuDetailsDisplay({Key? key}) : super(key: key);

  @override
  _RestauMenuDetailsDisplayState createState() => _RestauMenuDetailsDisplayState();
}

class _RestauMenuDetailsDisplayState extends State<RestauMenuDetailsDisplay> {
  List<String> data = ['Informations', 'Rating'];
  int initPosition = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> widget = [InfosMenuDisplay(), RatingMenuDisplay()];
    double width = MediaQuery.of(context).size.width;
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(416, 897),
        orientation: Orientation.portrait);
    return Scaffold(
      backgroundColor: Colors.white,
      body:SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 0.h,
                child: Container(
                  height: 247.h,
                  width: width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/shawarma.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              //Details
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
                  child: Column(
                    children: [
                      SizedBox(height: 23.h,),
                      Center(
                        child: Container(
                          width: 344.w,
                          child: Column(
                            children: [
                              //Name & Price
                              Row(
                                crossAxisAlignment:CrossAxisAlignment.start,
                                children: [
                                  //Name
                                  Expanded(
                                    child: Container(
                                      width:219.w,
                                      child:Text(
                                        "Poulet braisé aux Crevettes & maïs frais",
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            fontFamily: "Milliard",
                                            fontWeight: FontWeight.w500
                                        ),
                                      ) ,
                                    ),

                                  ),

                                  //Price
                                  Container(
                                    width: 123.w,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          //crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "2500 fcfa",
                                              style: TextStyle(
                                                  fontSize: 20.sp,
                                                  color: Color.fromRGBO(188, 44, 61, 1),
                                                  fontFamily: "Milliard",
                                                  fontWeight: FontWeight.w700
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 7.h,),
                              //Localisation
                              Row(
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
                              SizedBox(height: 12.h,),
                              //Note & Disponibilité
                              Container(
                                height: 23.h,
                                width: 344.w,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
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
                                          SizedBox(width: 20.w,),
                                          //Moder food
                                          Icon(
                                            LvIconsResto.morder,
                                            color:Color.fromRGBO(72, 132, 238, 1),
                                            size: 18.sp,
                                          ),
                                          SizedBox(width: 5.w,),
                                          Text(
                                            'Moder food',
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                              color: Colors.grey,
                                              fontFamily: "Milliard",
                                              fontWeight: FontWeight.w200,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),


                                    //Statut
                                    Container(
                                      width: 98.w,
                                      height: 23.h,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5.r),
                                          color: Color.fromRGBO(222, 249, 231, 1)
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Available now',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontFamily: "Milliard",
                                              color: Color.fromRGBO(104, 211, 137, 1),
                                              fontWeight: FontWeight.w500
                                          ),

                                        ),
                                      ),


                                    ),
                                  ],
                                ),
                              ),


                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 31.5.h),
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
                  ),
                ),
              )
            ],
          )
      ) ,
    );
  }
}
