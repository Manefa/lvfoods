import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/core/platform/icon/lv_icons.dart';
import 'package:ivfoods_mobile_app/features/deposited/bloc/deposited.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/bloc/get_all_for_restaurant.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/domain/entities/order.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';
import 'package:ivfoods_mobile_app/ui/shimmer_widgets.dart';

class OrderDetailRecovered extends StatefulWidget {
  final String name;

  const OrderDetailRecovered({Key? key, required this.name}) : super(key: key);

  @override
  _OrderDetailRecoveredState createState() => _OrderDetailRecoveredState();
}

class _OrderDetailRecoveredState extends State<OrderDetailRecovered> {
  @override
  Widget build(BuildContext context) {

    return Container(
      child: ListViewRecovered(name: widget.name,),
    );
  }
}

class ListViewRecovered extends StatefulWidget {
  final String name;

  const ListViewRecovered({Key? key, required this.name}) : super(key: key);
  @override
  _ListViewRecoveredState createState() => _ListViewRecoveredState();
}

class _ListViewRecoveredState extends State<ListViewRecovered> {
  DepositedBloc _depositedBloc = sl<DepositedBloc>();
  GetAllForRestaurantBloc _getAllForRestaurantBloc = sl<GetAllForRestaurantBloc>();

  @override
  Widget build(BuildContext context) {
    _getAllForRestaurantBloc.add(GetGetAllForRestaurantEvent(restaurantName: widget.name));
    return MultiBlocProvider(
      providers: [
        BlocProvider<DepositedBloc>(
          create: (_) => _depositedBloc,
        ),
        BlocProvider(
          create: (_) => _getAllForRestaurantBloc,
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<DepositedBloc, DepositedState>(
            listener: (context, state) {
              if(state is LoadedDeposited){
                _getAllForRestaurantBloc.add(GetGetAllForRestaurantEvent(restaurantName: widget.name));
              }
            },
          ),
        ],
        child: BlocBuilder(
            bloc: _getAllForRestaurantBloc,
            builder: (context, GetAllForRestaurantState state){
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
                List<Order>? ordersIsDeposited = List.empty();
                List<Order>? ordersIsDepositedReal = ordersIsDeposited.toList();

                var toRemove = [];
                ordersIsDepositedReal = state.getAllForRestaurant.orders!;

                ordersIsDepositedReal.forEach((x) {
                  if(x.status  != "in_progress_deposition"){
                    toRemove.add(x);
                  }
                });

                ordersIsDepositedReal.removeWhere((element) => toRemove.contains(element));

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
                            itemCount: ordersIsDepositedReal.length,
                            itemBuilder: (BuildContext context, int index){
                              return Container(
                                //color: Colors.withe,
                                child: Column(
                                  children: [
                                    SizedBox(height: 16.h,),
                                    Container(
                                      width: 340.w,
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
                                                  image: NetworkImage(ordersIsDepositedReal![index].item!.picture!),
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
                                                  ordersIsDepositedReal[index].item!.name!,
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
                                                            "X "+ordersIsDepositedReal[index].quantity.toString(),
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
                                                              color: Color(0XFFF4EFFF),
                                                              borderRadius: BorderRadius.circular(8)
                                                          ),
                                                          child: Center(
                                                            child: Icon(
                                                              Icons.clean_hands,
                                                              size: 10.sp,
                                                              color: Color(0XFFA27AFA),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width: 5.w,),
                                                        Text(
                                                          AppLocalizations.of(context)!.translate("recovered"),
                                                          style: TextStyle(
                                                            color: Color(0XFFA27AFA),
                                                            fontSize: 15.sp,
                                                            fontFamily: "Milliard",
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 6.h,),
                                                Text(
                                                  ordersIsDepositedReal[index].item!.price.toString()+" Fcfa",
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
                                          //Deposer
                                          InkWell(
                                            onTap:(){
                                              _depositedBloc.add(UpdateStatusOrder(code: ordersIsDepositedReal![index].code!));
                                              _getAllForRestaurantBloc.add(GetGetAllForRestaurantEvent(restaurantName: widget.name));
                                              setState(() {

                                              });
                                            },
                                            child: Container(
                                              height: 29.h,
                                              width: 80.w,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.red,
                                                  width: 1.w,
                                                ),
                                                borderRadius: BorderRadius.circular(5.r),
                                              ),
                                              child: Center(
                                                child:Text(
                                                  AppLocalizations.of(context)!.translate("deposit"),
                                                  style: TextStyle(
                                                    color:  Color.fromRGBO(148, 148, 148, 1),
                                                    fontFamily: "Milliard",
                                                    fontSize: 12.sp,
                                                  ),
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
                      Container(
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
                                    ordersIsDepositedReal!.forEach((element) {
                                      _depositedBloc.add(UpdateStatusOrder(code: element.code!));
                                    });
                                    _getAllForRestaurantBloc.add(GetGetAllForRestaurantEvent(restaurantName: widget.name));
                                    setState(() {

                                    });
                                  }
                                  ,
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5.r),
                                              side: BorderSide(color: Color.fromRGBO(188, 44, 61, 1))
                                          )
                                      )
                                  ),
                                  child:Text(
                                    AppLocalizations.of(context)!.translate("removeAllControls"),
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
            },
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

