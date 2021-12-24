import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/core/platform/lv_icons_resto.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/menu/add_meal/add_meal.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/menu/menu_restaurant_display.dart';

class MenuRestaurant extends StatefulWidget {
  const MenuRestaurant({Key? key}) : super(key: key);

  @override
  _MenuRestaurantState createState() => _MenuRestaurantState();
}

class _MenuRestaurantState extends State<MenuRestaurant> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(416, 897),
        orientation: Orientation.portrait);
    return Container(
      child: Column(
        children: [
          SizedBox(height: 18.5.h,),
          //AddButton
          Center(
            child: InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddMeal()),
                );
              },
              child: Container(
                width: 344.w,
                height: 35.h,
                child: DottedBorder(
                  color: Color.fromRGBO(209, 113, 124, 1),
                  strokeWidth: 0.2,
                  dashPattern: [10,6],
                  child: Center(
                      child:Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            LvIconsResto.add,
                            color: Color.fromRGBO(188, 44, 61, 1),
                            size: 16.sp,
                          ),
                          SizedBox(width: 14.w,),
                          Text(
                            "Add a meal",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Color.fromRGBO(188, 44, 61, 1),
                                fontSize: 20.sp,
                                fontFamily: "Milliard",
                                fontWeight: FontWeight.w200
                            ),
                          )
                        ],
                      )
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 19.h,),
          //Liste
          Expanded(
            child: Center(
              child: Container(
                  width: 344.w,
                  child: MenuRestaurantDisplay()),
            ),
          ),
        ],
      ),
    );
  }
}