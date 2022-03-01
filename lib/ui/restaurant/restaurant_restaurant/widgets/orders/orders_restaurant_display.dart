import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ivfoods_mobile_app/constants.dart';
import 'package:ivfoods_mobile_app/core/platform/loading_widget.dart';
import 'package:ivfoods_mobile_app/core/platform/icon/lv_icons.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_for_owner_restaurant/bloc/get_all_for_owner_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_for_owner_restaurant/domain/entities/get_all_for_owner_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_for_owner_restaurant/domain/entities/order.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/orders/restau_orders_detail/restau_orders_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';


class OrderRestaurantDisplay extends StatefulWidget {
  final List<Order> orders;

  const OrderRestaurantDisplay({Key? key, required this.orders,}) : super(key: key);

  @override
  _OrderRestaurantDisplayState createState() => _OrderRestaurantDisplayState();
}

class _OrderRestaurantDisplayState extends State<OrderRestaurantDisplay> {
  // GetAllForOwnerRestaurantBloc _getAllForOwnerRestaurantBloc = sl<GetAllForOwnerRestaurantBloc>();

  @override
  Widget build(BuildContext context) {
    //List<OrderAllModel> items = [items2, items3,items1,items5,items5];
     var addressRestaurant = sl<SharedPreferences>().getString('RESTAURANT_ADDRESS');
    //
    // var nameRestaurant = sl<SharedPreferences>().getString('RESTAURANT_NAME');
    //
    // _getAllForOwnerRestaurantBloc.add(StartGetAllForOwnerRestaurant(name: nameRestaurant!));

    // Future<void> _refresh() async {
    //   _getAllForOwnerRestaurantBloc.add(StartGetAllForOwnerRestaurant(name: nameRestaurant));
    // }


    return widget.orders.isNotEmpty ? SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child:Column(
                  children: [
                    ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        clipBehavior: Clip.none,
                        itemCount: widget.orders.length,
                        itemBuilder: (BuildContext context, int index){
                          return Container(
                            //color: Colors.withe,
                            child: Column(
                              children: [
                                SizedBox(height: 16.h,),
                                InkWell(
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => RestauOrderDetails(order: widget.orders[index], index: index,)),
                                    ).then((value) => setState(() {
                                    }));
                                  },
                                  child: Container(
                                    width: 340.w,
                                    //color: Colors.red,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        //ImageContainer
                                        Container(
                                          height: 66.h,
                                          width: 63.w,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(widget.orders[index].item!.picture!),
                                                fit:BoxFit.cover
                                            ),
                                            borderRadius: BorderRadius.circular(10.r),
                                          ),
                                        ),
                                        SizedBox(width: 8.w,),
                                        //InformationCOntainer
                                        Expanded(
                                            child:Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.start,

                                              children: [
                                                //Name
                                                Container(
                                                  child: Text(
                                                    widget.orders[index].item!.name!,
                                                    style: TextStyle(
                                                      fontFamily: "Milliard",
                                                      fontSize: 16.sp,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),),
                                                SizedBox(height: 3.h,),
                                                //Location
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        LvIcons.pin,
                                                        size: 15.sp,
                                                        color: Color.fromRGBO(148, 148, 148, 1),
                                                      ),
                                                      SizedBox(width: 8.8.w,),
                                                      SizedBox(
                                                        width: 130.w,
                                                        child: Text(
                                                          addressRestaurant!,
                                                          style: TextStyle(
                                                            color: Color.fromRGBO(148, 148, 148, 1),
                                                            fontFamily: "Milliard",
                                                            fontSize: 15.sp,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 3.h,),
                                                //Timer
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        LvIcons.ic_timer_24px,
                                                        size: 15.sp,
                                                        color: Color.fromRGBO(148, 148, 148, 1),
                                                      ),
                                                      SizedBox(width: 8.8.w,),
                                                      Text(
                                                        getHour(widget.orders[index].createdAt.toString()) +" "+AppLocalizations.of(context)!.translate("hoursAgo"),
                                                        style: TextStyle(
                                                          color: Color.fromRGBO(148, 148, 148, 1),
                                                          fontFamily: "Milliard",
                                                          fontSize: 15.sp,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                //PlatNumber Statut,and Price
                                                SizedBox(height: 3.h,),
                                                Container(
                                                  child: IntrinsicHeight(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        //PlatNumber Statut
                                                        Container(
                                                          child: Row(
                                                            children: [
                                                              Icon(
                                                                LvIcons.dish,
                                                                size: 15.sp,
                                                                color:  Color(0XFF4884EE),
                                                              ),
                                                              SizedBox(width: 3.w,),
                                                              Padding(
                                                                padding: const EdgeInsets.only(top: 2.0),
                                                                child: Text(
                                                                  "X "+(widget.orders[index].quantity as num).toInt().toString(),
                                                                  style: TextStyle(
                                                                    color:  Color(0XFF4884EE),
                                                                    fontFamily: "Milliard",
                                                                    fontSize: 15.sp,
                                                                  ),
                                                                ),
                                                              ),
                                                              VerticalDivider(),
                                                              widget.orders[index].status! == "ready" ?
                                                              Container(
                                                                height: 20.r,
                                                                width: 20.r,
                                                                decoration: BoxDecoration(
                                                                    color: Color(0XFFEFFBF2),
                                                                    borderRadius: BorderRadius.circular(8)
                                                                ),
                                                                child: Center(
                                                                  child: Icon(
                                                                    Icons.check,
                                                                    size: 10.sp,
                                                                    color: Color(0XFF68D389),
                                                                  ),
                                                                ),
                                                              ):( widget.orders[index].status! == "valid" ?
                                                              Container(
                                                                height: 20.r,
                                                                width: 20.r,
                                                                decoration: BoxDecoration(
                                                                    color: Color(0XFFF4EFFF),
                                                                    borderRadius: BorderRadius.circular(8)
                                                                ),
                                                                child: Center(
                                                                  child: Icon(
                                                                    Icons.clean_hands_sharp,
                                                                    size: 10.sp,
                                                                    color: Color(0XFFA27AFA),
                                                                  ),
                                                                ),
                                                              ):Container(
                                                                height: 20.r,
                                                                width: 20.r,
                                                                decoration: BoxDecoration(
                                                                    color: Color(0XFFF4EFFF),
                                                                    borderRadius: BorderRadius.circular(8)
                                                                ),
                                                                child: Center(
                                                                  child: Icon(
                                                                    Icons.access_time_rounded,
                                                                    size: 10.sp,
                                                                    color: Color(0XFFFBB634),
                                                                  ),
                                                                ),
                                                              )),
                                                              SizedBox(width: 5.w,),
                                                              widget.orders[index].status! == "valid" ?
                                                              Text(
                                                                AppLocalizations.of(context)!.translate("valid"),
                                                                style: TextStyle(
                                                                  color: Color(0XFFA27AFA),
                                                                  fontSize: 15.sp,
                                                                  fontFamily: "Milliard",
                                                                ),
                                                              ) : (
                                                                  widget.orders[index].status! == "ready" ?
                                                                  Text(
                                                                    AppLocalizations.of(context)! .translate("ready"),
                                                                    style: TextStyle(
                                                                      color: Color(0XFF68D389),
                                                                      fontSize: 15.sp,
                                                                      fontFamily: "Milliard",
                                                                    ),
                                                                  ) : Text(
                                                                    " ",
                                                                    style: TextStyle(
                                                                      color: Color(0XFFFBB634),
                                                                      fontSize: 15.sp,
                                                                      fontFamily: "Milliard",
                                                                    ),
                                                                  )
                                                              ),
                                                            ],
                                                          ),
                                                        ),

                                                        //Price
                                                        Text(
                                                          widget.orders[index].item!.price.toString()+" fcfa",
                                                          style: TextStyle(
                                                              color:  Color.fromRGBO(188, 44, 61, 1),
                                                              fontFamily: "Milliard",
                                                              fontSize: 20.sp,
                                                              fontWeight: FontWeight.w200
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                        ),
                                        SizedBox(width: 8.w,),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16.h,),
                                Divider(),
                              ],
                            ),
                            //Page Modification
                          );
                        }
                    ),
                    SizedBox(height: 85.h,)
                  ],
                ),
            ) : Container(
              height: 130.w,
              width: 130,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/empty2.png"),
                      )
                  ),
                ),
              ),
            );
  }

  String getHour(String hour) {
    var parsedDate = DateTime.parse(hour);
    var dateNow = DateTime.now();
    var calculate = dateNow.difference(parsedDate);
    var hours = parseDuration(calculate.toString());
    print(hours.inHours);
    return hours.inHours.toString();
  }

  Duration parseDuration(String s) {
    int hours = 0;
    int minutes = 0;
    int micros;
    List<String> parts = s.split(':');
    if (parts.length > 2) {
      hours = int.parse(parts[parts.length - 3]);
    }
    if (parts.length > 1) {
      minutes = int.parse(parts[parts.length - 2]);
    }
    micros = (double.parse(parts[parts.length - 1]) * 1000000).round();
    return Duration(hours: hours, minutes: minutes, microseconds: micros);
  }
}
