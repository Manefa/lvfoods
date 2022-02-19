import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/constants.dart';
import 'package:ivfoods_mobile_app/features/deliveries/bloc/deliveries.dart';
import 'package:ivfoods_mobile_app/features/get_user/bloc/get_user.dart';
import 'package:ivfoods_mobile_app/features/orders/bloc/orders.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:ivfoods_mobile_app/ui/delivery/home_delivery/widgets/app_bar.dart';
import 'package:ivfoods_mobile_app/ui/delivery/home_delivery/widgets/delivery_display.dart';
import 'package:ivfoods_mobile_app/ui/delivery/home_delivery/widgets/order_display.dart';
import 'package:ivfoods_mobile_app/ui/delivery/home_delivery/widgets/order_state_display.dart';
import 'package:ivfoods_mobile_app/ui/shimmer_widgets.dart';

class HomeDelivery extends StatefulWidget {
  @override
  _HomeDeliveryState createState() => _HomeDeliveryState();
}

class _HomeDeliveryState extends State<HomeDelivery> {
  OrdersBloc _ordersBloc = sl<OrdersBloc>();
  DeliveriesBloc _deliveriesBloc = sl<DeliveriesBloc>();
  GetUserBloc _getUserBloc = sl<GetUserBloc>();
  int orderTotal = 0;
  int orderTotalReady = 0;
  int orderTotalInProgress = 0;
  int orderTotalCancel = 0;
  int orderTotalDelivered = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(416, 897),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.portrait);

    _ordersBloc.add(GetOrders());
    _deliveriesBloc.add(GetDeliveries());

    Future<void> _refresh() async {
      _ordersBloc.add(GetOrders());
      _deliveriesBloc.add(GetDeliveries());
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider<OrdersBloc>(
          create: (BuildContext context) => _ordersBloc,
        ),
        BlocProvider<DeliveriesBloc>(
          create: (BuildContext context) => _deliveriesBloc,
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<OrdersBloc, OrdersState>(
            listener: (context, OrdersState state) {
              if(state is LoadedOrders){
                orderTotal = 0;
                orderTotalReady = 0;
                orderTotalInProgress = 0;
                orderTotalCancel = 0;
                orderTotalDelivered = 0;
                state.ordersMasters.recoveries!.forEach((element) {
                  orderTotal = orderTotal + element.quantity!;
                });
              }
            },
          ),
        ],

        child: Scaffold(
          body: SafeArea(
            child: Container(
              height: size.height,
              color: Colors.white,
              child: RefreshIndicator(
                onRefresh: _refresh,
                color: kPrimaryColor,
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      backgroundColor: kPrimaryColor,
                      expandedHeight: 240.h,
                      automaticallyImplyLeading: false,
                      stretch: true,
                      flexibleSpace: FlexibleSpaceBar(
                        background: BlocBuilder(
                          bloc: _ordersBloc,
                            builder: (context, state){
                              return Appbar(ordersTotal: orderTotal);
                            },
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(child: SizedBox(height: 20.h,)),
                    SliverToBoxAdapter(child: SizedBox(height: 30.h,)),
                    //ORDERS
                    SliverToBoxAdapter(
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: 35.w,),
                          Container(
                            height: 1.h,
                            width: 9.w,
                            color: kPrimaryColor,
                          ),
                          SizedBox(width: 5.w,),
                          Text(
                            "ORDERS",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 15.sp,
                              fontFamily: "Milliard",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 5.w,),
                          Container(
                            height: 1.h,
                            width: 9.w,
                            color: kPrimaryColor,
                          ),
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(child: SizedBox(height: 20.h,),),
                    SliverToBoxAdapter(
                      child: BlocBuilder(
                        bloc: _ordersBloc,
                        builder: (context, OrdersState state){
                          if(state is EmptyOrders){
                            return Container(
                              child: Center(
                                child: Text("Aucune Commandes"),
                              ),
                            );
                          }

                          if(state is LoadingOrders){
                            return buildHomeShimmer();
                          }

                          if(state is LoadedOrders){
                            return Container(
                              child: OrderDisplay(recoveries: state.ordersMasters.recoveries!),
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
                        },
                      ),
                    ),
                    SliverToBoxAdapter(child: SizedBox(height: 20.h,)),
                    SliverToBoxAdapter(
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: 35.w,),
                          Container(
                            height: 1.h,
                            width: 9.w,
                            color: kPrimaryColor,
                          ),
                          SizedBox(width: 5.w,),
                          Text(
                            "DELIVERY",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 15.sp,
                              fontFamily: "Milliard",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 5.w,),
                          Container(
                            height: 1.h,
                            width: 9.w,
                            color: kPrimaryColor,
                          ),
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(child: SizedBox(height: 20.h,)),
                    SliverToBoxAdapter(
                      child: BlocBuilder(
                        bloc: _deliveriesBloc,
                        builder: (context, DeliveriesState state){
                          if(state is EmptyDeliveries){
                            return Container(
                              child: Center(
                                child: Text("Aucune Livraisons"),
                              ),
                            );
                          }

                          if(state is LoadingDeliveries){
                             return buildHomeShimmer();
                          }

                          if(state is LoadedDeliveries){
                            return Container(
                              child: DeliveryDisplay(deliveries: state.deliveriesMasters,),
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget buildHomeShimmer(){
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(416, 897),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.portrait);
    return ListTile(
      title: Align(
        alignment: Alignment.center,
        child: ShimmerWidget.rectangular(
          height: 150.h,
          width: 340.w,
        ),
      ),
    );
  }
}
