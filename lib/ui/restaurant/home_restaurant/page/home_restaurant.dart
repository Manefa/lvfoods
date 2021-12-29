import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/constants.dart';
import 'package:ivfoods_mobile_app/ui/delivery/home_delivery/widgets/delivery_display.dart';
import 'package:ivfoods_mobile_app/ui/delivery/home_delivery/widgets/order_display.dart';
import 'package:ivfoods_mobile_app/ui/delivery/home_delivery/widgets/order_state_display.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/home_restaurant/widgets/appbar_restaurant.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/home_restaurant/widgets/restaurant_display.dart';
class HomeRestaurant extends StatefulWidget {
  const HomeRestaurant({Key? key}) : super(key: key);

  @override
  _HomeRestaurantState createState() => _HomeRestaurantState();
}

class _HomeRestaurantState extends State<HomeRestaurant> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(416, 897),
        orientation: Orientation.portrait);
    var size = MediaQuery.of(context).size;
    List<Widget> widgetListRestaurantHomeStateDisplay = <Widget>[];

    List<Widget> listOfRestaurant() {
      for (int i = 0; i < 3; i++) {
        widgetListRestaurantHomeStateDisplay.add(RestaurantHomeDisplay());
      }
      return widgetListRestaurantHomeStateDisplay;
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          color: Colors.white,
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: kPrimaryColor,
                expandedHeight: 240.h,
                automaticallyImplyLeading: false,
                stretch: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: AppBarRestaurant(),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 30.h,),
              ),
              SliverToBoxAdapter(
                child: Center(
                  child: Container(
                    width: 344.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        //My Orders
                        Text(
                          "Our Meals",
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontFamily: "Milliard",
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        //View All
                        Text(
                          "View All",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: "Milliard",
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 26.h,),
              ),
              SliverToBoxAdapter(
                child: Center(
                  child: Container(
                    width: 344.w,
                    child:RestaurantHomeDisplay(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
