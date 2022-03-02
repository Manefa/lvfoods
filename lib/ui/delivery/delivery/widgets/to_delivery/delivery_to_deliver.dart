import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/core/platform/loading_widget.dart';
import 'package:ivfoods_mobile_app/core/platform/icon/lv_icons.dart';
import 'package:ivfoods_mobile_app/features/deliveries/bloc/deliveries.dart';
import 'package:ivfoods_mobile_app/features/deliveries/domain/entities/delivery.dart';
import 'package:ivfoods_mobile_app/features/deliveries/domain/entities/order.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';
import 'package:ivfoods_mobile_app/ui/delivery/delivery/widgets/to_delivery/delivery_to_delivery_display.dart';
import 'package:ivfoods_mobile_app/ui/shimmer_widgets.dart';

class DeliveryToDeliver extends StatefulWidget {
  @override
  _DeliveryToDeliverState createState() => _DeliveryToDeliverState();
}

class _DeliveryToDeliverState extends State<DeliveryToDeliver> {
  DeliveriesBloc _deliveriesBloc = sl<DeliveriesBloc>();
  bool test = false;
  List<Delivery>? visibleDeliveries = List.empty();
  List<Delivery>? visibleDeliveriesTwo = List.empty();
  var gen = new Random();

  @override
  void initState() {
    _deliveriesBloc.add(GetDeliveries());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
            child: BlocProvider<DeliveriesBloc>(
              create: (_) => _deliveriesBloc,
              child: BlocBuilder(
                bloc: _deliveriesBloc,
                builder: (context, state){

                  if(state is EmptyDeliveries){
                    return Container(
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)!.translate("noDelivery")
                        ),
                      ),
                    );
                  }

                  if(state is LoadingDeliveries){
                    return LoadingWidget();
                  }

                  if(state is LoadedDeliveries){
                    var toRemove = [];

                    state.deliveriesMasters.deliveries!.forEach((element) {
                      element.orderGroup!.orders!.forEach((element) {
                        if(element.status == "cancel"){
                          toRemove.add(element);
                        }
                      });
                    });

                    state.deliveriesMasters.deliveries!.forEach((element) {
                      element.orderGroup!.orders!.removeWhere((element) => toRemove.contains(element));
                    });

                    visibleDeliveries = state.deliveriesMasters.deliveries;

                    return Column(
                      children: [
                        SizedBox(height: 20.h,),
                        //SearchContainer
                        Center(
                          child: Container(
                            width: 344.w,
                            height: 36.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //Search
                                Container(
                                  height: 36.h,
                                  width: 236.w,
                                  decoration: BoxDecoration(
                                    color: Color(0XFFF8F7F7),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: TextFormField(
                                    textAlignVertical: TextAlignVertical.center,
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    autocorrect: false,
                                    onChanged: (value){
                                      setState(() {
                                        visibleDeliveriesTwo = visibleDeliveries!.where((element) => getName(element.orderGroup!.orders).toLowerCase().contains(value.toLowerCase())).toList();
                                        visibleDeliveries!.forEach((element) {
                                          print(getName(element.orderGroup!.orders));
                                        });
                                        print(visibleDeliveriesTwo!.length.toString());
                                        test = true;
                                      });
                                    },
                                    style: TextStyle(
                                      color: Color(0XFF949494),
                                      fontSize: 15.sp,
                                      fontFamily: "Milliard",
                                    ),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(bottom: 15),
                                      hintText: AppLocalizations.of(context)!.translate("searchDeliveries"),
                                      border: InputBorder.none,
                                      prefixIcon: Icon(
                                        LvIcons.search_interface_symbol,
                                        size: 16.sp,
                                        color: Color(0XFF949494),
                                      ),
                                      hintStyle: TextStyle(
                                          color: Color(0XFF949494),
                                          fontSize: 15.sp,
                                          fontFamily: "Milliard"
                                      ),
                                    ),
                                  ),
                                ),

                                //Filter Button
                                Container(
                                  height: 36.r,
                                  width: 94.r,
                                  child: TextButton.icon(
                                    onPressed: () {
                                      _deliveriesBloc.add(GetDeliveries());
                                    },
                                    label: FittedBox(
                                      child: Text(
                                        AppLocalizations.of(context)!.translate("filter"),
                                        style: TextStyle(
                                        fontSize: 15.sp,
                                        fontFamily: "Milliard",
                                        color: Color(0XFF68D389),
                                      ),),
                                    ),
                                    icon: FittedBox(
                                      child: Icon(
                                        Icons.refresh,
                                        size: 17.sp,
                                        color: Color(0XFF68D389),
                                      ),
                                    ),
                                    style: TextButton.styleFrom(
                                      backgroundColor: Color(0XFFDEF9E7),
                                      shape:RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h,),
                        //List Of Order
                        Expanded(
                            child:SingleChildScrollView(
                              child: DeliveryToDeliveryDisplay(deliveries: (test == true) ? visibleDeliveriesTwo! : visibleDeliveries!,),
                            ),
                        ),
                      ],
                    );
                  }

                  if(state is ErrorDeliveries){
                    return Container(
                      height: 130.w,
                      width: 130,
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("images/error1.png"),
                              )
                          ),
                        ),
                      ),
                    );
                  }

                  return Container(
                    height: 130.w,
                    width: 130,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/error2.png"),
                            )
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
    );
  }
  Widget buildDeliveryShimmer(){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerWidget.rectangular(
                  height: 21.h,
                  width: 200.w,
                ),
                SizedBox(height:7.h,),
                ShimmerWidget.rectangular(
                  height: 15.h,
                  width: 100.w,
                ),
                SizedBox(height:7.h,),
                ShimmerWidget.rectangular(
                  height: 15.h,
                  width: 71.w,
                ),
                SizedBox(height:7.h,),
                ShimmerWidget.rectangular(
                  height: 15.h,
                  width: 160.w,
                ),
                SizedBox(height:14.h,),
                Divider(),
                SizedBox(height:15.h,),
              ],
            ),
          ),

        ],
      ),
    );
  }

  String getName(List<Order>? orders) {
      String value = "";
      orders!.forEach((element) {
        value = value+element.item!.name!.toLowerCase().toString();
      });
      return value;
  }
}
