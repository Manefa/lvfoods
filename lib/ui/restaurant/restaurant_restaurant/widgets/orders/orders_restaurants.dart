import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/core/platform/loading_widget.dart';
import 'package:ivfoods_mobile_app/core/platform/icon/lv_icons.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_for_owner_restaurant/bloc/get_all_for_owner_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_for_owner_restaurant/domain/entities/order.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/orders/orders_restaurant_display.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrdersRestaurant extends StatefulWidget {
  const OrdersRestaurant({Key? key}) : super(key: key);

  @override
  _OrdersRestaurantState createState() => _OrdersRestaurantState();
}

class _OrdersRestaurantState extends State<OrdersRestaurant> {
  GetAllForOwnerRestaurantBloc _getAllForOwnerRestaurantBloc = sl<GetAllForOwnerRestaurantBloc>();
  bool test = false;
  List<Order>? visibleOrders = List.empty();
  List<Order>? visibleOrdersTwo = List.empty();

  @override
  void initState() {
    var nameRestaurant = sl<SharedPreferences>().getString('RESTAURANT_NAME');
    _getAllForOwnerRestaurantBloc.add(StartGetAllForOwnerRestaurant(name: nameRestaurant!));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var nameRestaurant = sl<SharedPreferences>().getString('RESTAURANT_NAME');
    var addressRestaurant = sl<SharedPreferences>().getString('RESTAURANT_ADDRESS');

    return BlocProvider<GetAllForOwnerRestaurantBloc>(
      create: (_) => _getAllForOwnerRestaurantBloc,

      child: BlocBuilder(
        bloc: _getAllForOwnerRestaurantBloc,
        builder: (context, state){

          if(state is GetAllForOwnerRestaurantLoading){
            return LoadingWidget();
          }

          if(state is GetAllForOwnerRestaurantLoaded){
            visibleOrders = state.getAllForOwnerRestaurant.orders!;

            return Column(
              children: [
                SizedBox(height: 18.5.h,),
                //Filter & Search
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
                                visibleOrdersTwo = state.getAllForOwnerRestaurant.orders!.where((element) =>
                                    element.item!.name!.toLowerCase().contains(value.toLowerCase())).toList();
                                print(visibleOrdersTwo!.length.toString());
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
                        //Filter
                        TextButton.icon(
                            onPressed: (){
                              _getAllForOwnerRestaurantBloc.add(StartGetAllForOwnerRestaurant(name: nameRestaurant!));
                            },
                            icon: Icon(
                              Icons.refresh,
                              size: 17.sp,
                              color: Color(0XFF68D389),
                            ),
                            label: Padding(
                              padding: const EdgeInsets.only(top: 2.0),
                              child: Text(
                                AppLocalizations.of(context)!.translate("filter"),
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontFamily: "Milliard",
                                  color: Color(0XFF68D389),
                                ),
                              ),
                            ),
                          style: TextButton.styleFrom(
                            backgroundColor: Color(0XFFDEF9E7),
                            shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                ),
                SizedBox(height: 19.h,),
                Expanded(
                  child: Center(
                    child: Container(
                        width: 344.w,
                        child: OrderRestaurantDisplay(orders: (test == false) ? state.getAllForOwnerRestaurant.orders! : visibleOrdersTwo!,)),
                  ),
                ),
              ],
            );
          }

          if(state is GetAllForOwnerRestaurantError){
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
    );
  }
}
