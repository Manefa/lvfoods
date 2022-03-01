import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/core/platform/loading_widget.dart';
import 'package:ivfoods_mobile_app/core/platform/icon/lv_icons.dart';
import 'package:ivfoods_mobile_app/features/orders/bloc/orders.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/recovery.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';
import 'package:ivfoods_mobile_app/ui/delivery/order/widgets/to_delivery/order_to_delivery_display.dart';
import 'package:ivfoods_mobile_app/ui/shimmer_widgets.dart';

class OrderToDeliver extends StatefulWidget {
  @override
  _OrderToDeliverState createState() => _OrderToDeliverState();
}

class _OrderToDeliverState extends State<OrderToDeliver> {
  OrdersBloc _ordersBloc = sl<OrdersBloc>();
  List<Recovery>? visibleOrdersMasters = List.empty();
  List<Recovery>? visibleOrdersMastersTwo = List.empty();
  bool test = false;

  @override
  void initState() {
    _ordersBloc.add(GetOrders());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    Future<void> _refresh() async {
      _ordersBloc.add(GetOrders());
    }

    return BlocProvider(
      create: (BuildContext context) => _ordersBloc,
      child: BlocListener<OrdersBloc, OrdersState>(
        bloc: _ordersBloc,
        listener: (context, state){
          if(state is LoadingOrders){

          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Center(
              child: BlocBuilder(
                bloc: _ordersBloc,
              builder: (context, OrdersState state){
                  if(state is EmptyOrders){
                    return Container(
                      child: Center(
                        child: Text(
                            AppLocalizations.of(context)!.translate("allIsEmpty"),
                        ),
                      ),
                    );
                  }
                  if(state is LoadingOrders){
                    return Center(child:LoadingWidget());
                  }

                  if(state is LoadedOrders){
                    visibleOrdersMasters = state.ordersMasters.recoveries;

                    return Container(
                      child: Column(
                        children: [
                          //Search
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
                                          visibleOrdersMastersTwo = state.ordersMasters.recoveries!.where((element) =>
                                              element.restaurant!.name!.toLowerCase().contains(value.toLowerCase())).toList();
                                          print(visibleOrdersMastersTwo!.length.toString());
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
                                        hintText: AppLocalizations.of(context)!.translate("searchOrders"),
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
                                        _refresh();
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
                              child: SingleChildScrollView(
                                  physics: AlwaysScrollableScrollPhysics(),
                                  child: OrderToDeliveryDisplay(recoveries: (test == false) ? visibleOrdersMasters : visibleOrdersMastersTwo),
                                ),
                          ),
                        ],
                      ),
                    );
                  }
                  if(state is ErrorOrders){
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
              }
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget buildOrderShimmer(){
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
                  width: 20.w,
                ),

                SizedBox(height:7.h,),
                ShimmerWidget.rectangular(
                  height: 15.h,
                  width: 83.w,
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
}
