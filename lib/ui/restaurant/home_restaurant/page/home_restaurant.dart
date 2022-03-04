import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/constants.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/home_restaurant/widgets/appbar_restaurant.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/home_restaurant/widgets/restaurant_display.dart';

class HomeRestaurant extends StatefulWidget {
  final String? restaurantName;
  final String? address;
  const HomeRestaurant({Key? key, this.restaurantName, this.address}) : super(key: key);

  @override
  _HomeRestaurantState createState() => _HomeRestaurantState();
}

class _HomeRestaurantState extends State<HomeRestaurant> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
          body: SafeArea(
            child: Container(
              height: size.height,
              color: Colors.white,
              child: RefreshIndicator(
                onRefresh: ()async{
                  setState(() {

                  });
                },
                color: kPrimaryColor,
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
                                AppLocalizations.of(context)!.translate("ourMeals"),
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontFamily: "Milliard",
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              //View All
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
                          child:RestaurantHomeDisplay(restaurantName: widget.restaurantName!, address: widget.address!,),
                        ),
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
