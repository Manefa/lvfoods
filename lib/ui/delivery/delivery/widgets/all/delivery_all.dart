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
import 'package:ivfoods_mobile_app/ui/delivery/delivery/widgets/all/delivery_all_display.dart';
import 'package:ivfoods_mobile_app/ui/shimmer_widgets.dart';


class DeliveryAll extends StatefulWidget {
  @override
  _DeliveryAllState createState() => _DeliveryAllState();
}

class _DeliveryAllState extends State<DeliveryAll> {
  DeliveriesBloc _deliveriesBloc = sl<DeliveriesBloc>();
  bool test = false;
  List<Delivery>? visibleDeliveries = List.empty();
  List<Delivery>? visibleDeliveriesTwo = List.empty();

  @override
  void initState() {
    _deliveriesBloc.add(GetDeliveries());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
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

                List<Delivery> delivered = [];
                List<Delivery> inProgress = [];
                List<Delivery> ready = [];
                List<Delivery> finalList = [];

                state.deliveriesMasters.deliveries!.forEach((element) {
                  if(element.status == "ready"){
                    ready.add(element);
                  }

                  if(element.status == "delivered"){
                    delivered.add(element);
                  }

                  if(element.status == "on_the_way"){
                    inProgress.add(element);
                  }
                });

                finalList.addAll(inProgress);
                finalList.addAll(ready);
                finalList.addAll(delivered);

                visibleDeliveries = finalList;

                return SafeArea(
                  child: SingleChildScrollView(
                    child: Container(
                      color: Colors.white,
                      width: size.width,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 20.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
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
                                    contentPadding: new EdgeInsets.symmetric(vertical: 13.h),
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
                              SizedBox(width: 10.w,),
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
                          DeliveryAllDisplay(deliveries: (test == true) ? visibleDeliveriesTwo! : visibleDeliveries!,),
                        ],
                      ),
                    ),
                  ),
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
