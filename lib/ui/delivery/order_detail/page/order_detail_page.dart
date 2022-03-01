import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:ivfoods_mobile_app/constants.dart';
import 'package:ivfoods_mobile_app/core/platform/loading_widget.dart';
import 'package:ivfoods_mobile_app/core/platform/icon/lv_icons_resto.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/bloc/get_all_for_restaurant.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';
import 'package:ivfoods_mobile_app/ui/delivery/order_detail/widgets/order_detail/order_detail.dart';
import 'package:ivfoods_mobile_app/ui/delivery/order_detail/widgets/restaurant/restaurant_detail.dart';
import 'package:ivfoods_mobile_app/ui/delivery/order_detail/widgets/sub_widgets/custom_tab_view_order_detail.dart';

class OrderDetailPage extends StatefulWidget {
  final String? restaurantName;
  const OrderDetailPage({Key? key, this.restaurantName,}) : super(key: key);
  @override
  _OrderDetailPageState createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  GetAllForRestaurantBloc _getAllForRestaurantBloc = sl<GetAllForRestaurantBloc>();
  List<String> data = [];
  int initPosition = 0;
  String nameRestaurant = "";

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('fr');
    nameRestaurant = widget.restaurantName!;
    _getAllForRestaurantBloc.add(GetGetAllForRestaurantEvent(restaurantName: widget.restaurantName!));
  }

  @override
  Widget build(BuildContext context) {
    data = [AppLocalizations.of(context)!.translate("orderDetail"), AppLocalizations.of(context)!.translate("restaurant")];
    return BlocProvider<GetAllForRestaurantBloc>(
      create: (BuildContext context) => _getAllForRestaurantBloc,
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder(
            bloc: _getAllForRestaurantBloc,
            builder: (context, GetAllForRestaurantState state){
              if(state is EmptyGetAllForRestaurant){
                return Container(
                  child: Center(
                    child: Text(
                        "Empty !"
                    ),
                  ),
                );
              }

              if(state is LoadingGetAllForRestaurant){
                return LoadingWidget();
              }

              if(state is LoadedGetAllForRestaurant){
                List<Widget> widget = [OrderDetail(name: nameRestaurant), RestaurantDetail(restaurant: state.getAllForRestaurant.restaurant,)];
                return Container(
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 220.h,
                            width: 414.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(37),
                                bottomRight: Radius.circular(37),
                              ),
                              color: Color(0XFFFCF4F5),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 35.h,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(width: 35.w,),
                                    InkWell(
                                      onTap: (){
                                        Navigator.pop(context);
                                      },
                                      child: Icon(
                                        Icons.arrow_back_ios_rounded,
                                        size: 18.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(width: 80.w,),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 1.0),
                                      child: Text(
                                        AppLocalizations.of(context)!.translate("orderDetail"),
                                        style: TextStyle(
                                          fontFamily: "Milliard",
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 30.h,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 35.0),
                                  child: Text(
                                    state.getAllForRestaurant.restaurant!.name!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20.sp,
                                      fontFamily: "Milliard",
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.h,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(width: 35.w,),
                                    Icon(
                                      Icons.location_on_outlined,
                                      size: 16.sp,
                                      color: Colors.black,
                                    ),
                                    SizedBox(width: 10.w,),
                                    SizedBox(
                                      width: 130.w,
                                      child: Text(
                                        state.getAllForRestaurant.restaurant!.address!,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: "Milliard",
                                            fontSize: 15.sp,
                                            color: Color(0XFF2C2627)
                                        ),
                                      ),
                                    ),
                                    Expanded(child: SizedBox()),
                                    state.getAllForRestaurant.restaurant!.status == "enable" ?
                                    Padding(
                                      padding: const EdgeInsets.only(right:35.0),
                                      child: Container(
                                        width: 56.w,
                                        height: 23.h,
                                        decoration:BoxDecoration(
                                          color: Color.fromRGBO(222, 249, 231, 1),
                                          borderRadius: BorderRadius.circular(5.r),
                                        ),
                                        child: Center(
                                          child: Text(
                                              AppLocalizations.of(context)!.translate("open"),
                                            style: TextStyle(
                                                fontFamily: "Milliard",
                                                fontSize: 15.sp,
                                                color: Color.fromRGBO(104, 211, 137, 1)
                                            ),
                                          ),
                                        ),
                                      ),
                                    ) :
                                    Padding(
                                      padding: const EdgeInsets.only(right:35.0),
                                      child: Container(
                                        width: 56.w,
                                        height: 23.h,
                                        decoration:BoxDecoration(
                                          color: Color(0XFFF9ECED),
                                          borderRadius: BorderRadius.circular(5.r),
                                        ),
                                        child: Center(
                                          child: Text(
                                              AppLocalizations.of(context)!.translate("close"),
                                            style: TextStyle(
                                                fontFamily: "Milliard",
                                                fontSize: 15.sp,
                                                color: Color(0XFFBC2C3D),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15.h,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(width: 35.w,),
                                    Icon(
                                      Icons.access_time_rounded,
                                      size: 16.sp,
                                      color: Colors.black,
                                    ),
                                    SizedBox(width: 10.w,),
                                    Text(
                                      getDate(state.getAllForRestaurant.restaurant!.createdAt.toString())+" a "+getHour(state.getAllForRestaurant.restaurant!.createdAt.toString()),
                                      style: TextStyle(
                                          fontFamily: "Milliard",
                                          fontSize: 15.sp,
                                          color: Color(0XFF2C2627)
                                      ),
                                    ),
                                    Expanded(child: SizedBox()),
                                    Padding(
                                      padding: const EdgeInsets.only(right : 35.0),
                                      child: Row(
                                        children: [
                                          SizedBox(width: 35.w,),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 0.0),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  LvIconsResto.star,
                                                  size: 16.sp,
                                                  color: Color.fromRGBO(251, 182, 52, 1),
                                                ),
                                                SizedBox(width: 4.w,),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 1.0),
                                                  child: Text(
                                                    state.getAllForRestaurant.restaurant!.note!.toStringAsFixed(2),
                                                    style: TextStyle(
                                                        fontFamily: "Milliard",
                                                        fontSize: 15.sp,
                                                        color: Colors.black,
                                                        fontWeight:FontWeight.w300
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.white,
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
                          ),
                        ],
                      ),
                );
              }

              if(state is ErrorGetAllForRestaurant){
                return Container(
                  child: Center(
                    child: Text(
                        state.message,
                    ),
                  ),
                );
              }
              return Container(
                child: Center(
                  child: Text(
                    "Aucun Cas"
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  String getDate(String hour) {
    var parsedDate = DateTime.parse(hour);
    var dateNow = DateTime.now();
    var calculate = dateNow.difference(parsedDate);
    String formattedDate = DateFormat.MMMMd('fr').format(parsedDate);
    return formattedDate;
  }

  String getHour(String hour) {
    var parsedDate = DateTime.parse(hour);
    var dateNow = DateTime.now();
    var calculate = dateNow.difference(parsedDate);
    String formattedDate = DateFormat('HH:mm').format(parsedDate);
    return formattedDate;
  }
}



