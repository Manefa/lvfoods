import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/core/platform/icon/lv_icons.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/bloc/get_all_for_restaurant.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/domain/entities/order.dart';
import 'package:ivfoods_mobile_app/features/start_deposition/bloc/start_deposition.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';
import 'package:ivfoods_mobile_app/ui/shimmer_widgets.dart';

class OrderDetailInProgress extends StatefulWidget {
  final String name;

  const OrderDetailInProgress({Key? key, required this.name}) : super(key: key);

  @override
  _OrderDetailInProgressState createState() => _OrderDetailInProgressState();
}

class _OrderDetailInProgressState extends State<OrderDetailInProgress> {

  @override
  Widget build(BuildContext context) {

    return Container(
      child: ListViewOrder(name: widget.name),
    );
  }
}


class ListViewOrder extends StatefulWidget {
  final String name;

  const ListViewOrder({Key? key, required this.name}) : super(key: key);
  @override
  _ListViewOrderState createState() => _ListViewOrderState();
}

class _ListViewOrderState extends State<ListViewOrder> {
  StartDepositionBloc _startDepositionBloc = sl<StartDepositionBloc>();
  GetAllForRestaurantBloc _getAllForRestaurantBloc = sl<GetAllForRestaurantBloc>();

  @override
  Widget build(BuildContext context) {
    _getAllForRestaurantBloc.add(GetGetAllForRestaurantEvent(restaurantName: widget.name));
    return MultiBlocProvider(
      providers: [
        BlocProvider<StartDepositionBloc>(
          create: (_) => _startDepositionBloc,
        ),

        BlocProvider<GetAllForRestaurantBloc>(
          create: (_) => _getAllForRestaurantBloc,
        ),
      ],

      child:  MultiBlocListener(
        listeners: [
          BlocListener<StartDepositionBloc, StartDepositionState>(
            listener: (context, state) {
              if(state is LoadedStartDeposition){
                _getAllForRestaurantBloc.add(GetGetAllForRestaurantEvent(restaurantName: widget.name));
              }
            },
          ),
        ],
        child: BlocBuilder<GetAllForRestaurantBloc, GetAllForRestaurantState>(
            bloc: _getAllForRestaurantBloc,
            builder: (context, GetAllForRestaurantState state) {
              if(state is EmptyGetAllForRestaurant){
                return Container(
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!.translate("empty"),
                    ),
                  ),
                );
              }

              if(state is LoadingGetAllForRestaurant){
                return ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index){
                      return buildOrderDetailShimmer();
                    }
                );
              }

              if(state is LoadedGetAllForRestaurant){
                List<Order> _ordersInProgress = List.empty();
                List<Order> _ordersInProgressReal = _ordersInProgress.toList();

                var toRemove = [];
                _ordersInProgressReal = state.getAllForRestaurant.orders!;

                _ordersInProgressReal.forEach((x) {
                  if(x.status  != "in_progress_recovery"){
                    toRemove.add(x);
                  }
                });

                _ordersInProgressReal.removeWhere((element) => toRemove.contains(element));

                return Container(
                  child:Column(
                    children: [
                      //Listview
                      Container(
                        height: 335.h,
                        child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            clipBehavior: Clip.none,
                            itemCount: _ordersInProgressReal.length,
                            itemBuilder: (BuildContext context, int index){
                              return Container(
                                //color: Colors.withe,
                                child: Column(
                                  children: [
                                    SizedBox(height: 16.h,),
                                    Container(
                                      width: 340.w,
                                      //color: Colors.blue,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          //ImageContainer
                                          Container(
                                            width: 63.w,
                                            height: 66.h,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(_ordersInProgressReal[index].item!.picture!),
                                                  fit:BoxFit.cover
                                              ),
                                              borderRadius: BorderRadius.circular(10.r),
                                            ),
                                          ),
                                          SizedBox(width: 8.w,),
                                          //InformationCOntainer
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  _ordersInProgressReal[index].item!.name!,
                                                  style: TextStyle(
                                                    fontFamily: "Milliard",
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                SizedBox(height: 3.h,),
                                                Container(
                                                  child: IntrinsicHeight(
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
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
                                                            "X "+_ordersInProgressReal[index].quantity.toString(),
                                                            style: TextStyle(
                                                              color:  Color(0XFF4884EE),
                                                              fontFamily: "Milliard",
                                                              fontSize: 15.sp,
                                                            ),
                                                          ),
                                                        ),
                                                        VerticalDivider(),
                                                        Container(
                                                          height: 20.r,
                                                          width: 20.r,
                                                          decoration: BoxDecoration(
                                                              color: Color(0XFFFFF7E9),
                                                              borderRadius: BorderRadius.circular(8)
                                                          ),
                                                          child: Center(
                                                            child: Icon(
                                                              Icons.access_time_rounded,
                                                              size: 10.sp,
                                                              color: Color(0XFFFBB634),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width: 5.w,),
                                                        Text(
                                                          AppLocalizations.of(context)!.translate("inProgress"),
                                                          style: TextStyle(
                                                            color: Color(0XFFFBB634),
                                                            fontSize: 15.sp,
                                                            fontFamily: "Milliard",
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 6.h,),
                                                Text(
                                                  _ordersInProgressReal[index].item!.price.toString()+" Fcfa",
                                                  style: TextStyle(
                                                    color:  Color.fromRGBO(148, 148, 148, 1),
                                                    fontFamily: "Milliard",
                                                    fontSize: 15.sp,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 8.w,),
                                          //Button Recuperer
                                          Container(
                                            height: 29.h,
                                            width: 80.w,
                                            child: TextButton(
                                              onPressed: (){
                                                _startDepositionBloc.add(UpdateStatusOrder(code: _ordersInProgressReal[index].code!));
                                                _getAllForRestaurantBloc.add(GetGetAllForRestaurantEvent(restaurantName: widget.name));
                                                setState(() {

                                                });
                                              },
                                              style: ButtonStyle(
                                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(5.r),
                                                          side: BorderSide(color: Colors.red)
                                                      )
                                                  )
                                              ),
                                              child:Text(
                                                  AppLocalizations.of(context)!.translate("recovered"),
                                                style: TextStyle(
                                                  color:  Color.fromRGBO(148, 148, 148, 1),
                                                  fontFamily: "Milliard",
                                                  fontSize: 12.sp,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
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
                      ),

                      SizedBox(height: 28.h,),
                      Expanded(
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                SizedBox(height: 21.h,),
                                Container(
                                  width: 340.w,
                                  height: 45.h,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(188, 44, 61, 1),
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                  child: TextButton(
                                    onPressed: (){
                                      _ordersInProgressReal.forEach((element) {
                                        _startDepositionBloc.add(UpdateStatusOrder(code: element.code!));
                                      });
                                      _getAllForRestaurantBloc.add(GetGetAllForRestaurantEvent(restaurantName: widget.name));
                                      setState(() {

                                      });
                                    },
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(5.r),
                                                side: BorderSide(color: Color.fromRGBO(188, 44, 61, 1))
                                            )
                                        )
                                    ),
                                    child:Text(
                                      AppLocalizations.of(context)!.translate("recoverAll"),
                                      style: TextStyle(
                                        color:  Colors.white,
                                        fontFamily: "Milliard",
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
                      AppLocalizations.of(context)!.translate("err"),
                    ),
                  ),
                );
              }

              return Container(
                child: Center(
                  child: Text(
                    AppLocalizations.of(context)!.translate("noCasesOfBuild"),
                  ),
                ),
              );
            }
          ),
      ),
    );
  }
  Widget buildOrderDetailShimmer(){
    return ListTile(
      leading: ShimmerWidget.circular(
        height: 65.h,
        width: 63.w,
        shapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r)
        ),
      ),
      title: ShimmerWidget.rectangular(
        height: 65.h,
        width: 200.w,

      ),
    );
  }
}

