import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:ivfoods_mobile_app/constants.dart';
import 'package:ivfoods_mobile_app/core/platform/loading_widget.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_for_owner_restaurant/bloc/get_all_for_owner_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/mention_order_ready/bloc/mention_order_ready.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/orders/restau_orders_detail/alert_dialogue_order_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';
enum Level {
  toDelivery, InProgress, carryOut
}



class RestauOrderDetailsDisplay extends StatefulWidget {
  final int index;
  const RestauOrderDetailsDisplay({Key? key, required this.index}) : super(key: key);

  @override
  _RestauOrderDetailsDisplayState createState() => _RestauOrderDetailsDisplayState();
}

class _RestauOrderDetailsDisplayState extends State<RestauOrderDetailsDisplay> {
  MentionOrderReadyBloc _mentionOrderReadyBloc = sl<MentionOrderReadyBloc>();
  GetAllForOwnerRestaurantBloc _getAllForOwnerRestaurantBloc = sl<GetAllForOwnerRestaurantBloc>();

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting(AppLocalizations.of(context)!.locale.languageCode);
    var nameRestaurant = sl<SharedPreferences>().getString('RESTAURANT_NAME');
    _getAllForOwnerRestaurantBloc.add(StartGetAllForOwnerRestaurant(name: nameRestaurant!));

    return MultiBlocProvider(
      providers: [
        BlocProvider<MentionOrderReadyBloc>(
          create: (_) => _mentionOrderReadyBloc,
        ),

        BlocProvider<GetAllForOwnerRestaurantBloc>(
          create: (_) => _getAllForOwnerRestaurantBloc,
        ),
      ],
      child: BlocListener(
        bloc: _mentionOrderReadyBloc,
        listener: (context, state){
          if(state is LoadingMentionOrderReady){
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  duration: (state is LoadingMentionOrderReady) ? Duration(days: 1) : Duration(seconds: 1),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.translate("inProgressBloc"),
                        style: TextStyle(
                          fontFamily: "Milliard",
                          color: Colors.white,
                        ),
                      ),
                      CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ],
                  ),
                  backgroundColor: kPrimaryColor,
                ),
              );
          }

          if(state is LoadedMentionOrderReady){
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            setState(() {

            });
            showDialog(
                context: context,
                builder:(BuildContext context){
                  return AlertDialogueOrderReady();
                }
            );
          }

          if(state is ErrorMentionOrderReady){
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text(state.message + AppLocalizations.of(context)!.translate("failure"), style: TextStyle(fontFamily: "Milliard", color: Colors.white),), Icon(Icons.error, color: Colors.white,)],
                  ),
                  backgroundColor: kPrimaryColor,
                ),
              );
          }
        },
        child: BlocBuilder(
          bloc: _getAllForOwnerRestaurantBloc,
          builder: (context, state){

            if(state is GetAllForOwnerRestaurantLoading){
              return LoadingWidget();
            }

            if(state is GetAllForOwnerRestaurantLoaded){
              return SingleChildScrollView(
                child:Center(
                  child: Column(
                    children: [
                      //Reference & Status
                      Container(
                        height: 27.h,
                        width: 344.w,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              state.getAllForOwnerRestaurant.orders![widget.index].code!,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Milliard",
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w200
                              ),

                            ),
                            Container(
                              child: Row(
                                children: [
                                  state.getAllForOwnerRestaurant.orders![widget.index].status == "ready"?
                                  Row(
                                    children: [
                                      Container(
                                        height: 20.r,
                                        width: 20.r,
                                        decoration: BoxDecoration(
                                            color: Color(0XFFDEF9E7),
                                            borderRadius: BorderRadius.circular(8)
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.check,
                                            size: 16.sp,
                                            color: Color(0XFF68D389),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 7.w,),
                                      Text(
                                        AppLocalizations.of(context)!.translate("ready"),
                                        style: TextStyle(
                                          color: Color(0XFF68D389),
                                          fontFamily: "Milliard",
                                          fontSize: 16.sp,
                                        ),
                                      )
                                    ],
                                  )
                                      :
                                  Row(
                                    children: [
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
                                            size: 16.sp,
                                            color: Color(0XFFA27AFA),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 7.w,),
                                      Text(
                                        AppLocalizations.of(context)!.translate("valid"),
                                        style: TextStyle(
                                          color: Color(0XFFA27AFA),
                                          fontFamily: "Milliard",
                                          fontSize: 16.sp,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h,),
                      //Date
                      Container(
                        width: 344.w,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            getDate(state.getAllForOwnerRestaurant.orders![widget.index].createdAt!)+" a "+getHour(state.getAllForOwnerRestaurant.orders![widget.index].createdAt!),
                            style: TextStyle(
                              color: Color.fromRGBO(148, 148, 148, 1),
                              fontFamily: "Milliard",
                              fontSize: 15.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 11.h,),
                      //Divider
                      Container(width: 344.w, child: Divider()),
                      SizedBox(height: 23.h,),
                      //Image Price Name Qtt
                      Container(
                        width: 344.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //Image
                            Container(
                              height: 63.r,
                              width: 63.r,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                image: DecorationImage(
                                    image: NetworkImage(state.getAllForOwnerRestaurant.orders![widget.index].item!.picture!),
                                    fit:BoxFit.cover
                                ),
                              ),
                            ),
                            //SizedBox(width: 12.w,),
                            //Name price and Qtt
                            Container(
                              width: 273.w,
                              child: Column(
                                children: [
                                  //Name
                                  Container(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          state.getAllForOwnerRestaurant.orders![widget.index].item!.name!,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontFamily: "Milliard",
                                            fontSize: 18.sp,
                                          ),
                                        ),
                                      )
                                  ),
                                  SizedBox(height: 4.h,),
                                  //Price and Qtt
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        //Qtt
                                        Text(
                                          "X "+(state.getAllForOwnerRestaurant.orders![widget.index].quantity as num).toInt().toString(),
                                          style: TextStyle(
                                              fontFamily: "Milliard",
                                              fontSize: 14.sp,
                                              color: Color.fromRGBO(148, 148, 148, 1)
                                          ),
                                        ),
                                        //Price
                                        Text(
                                          state.getAllForOwnerRestaurant.orders![widget.index].item!.price.toString()+" Fcfa",
                                          style: TextStyle(
                                            fontFamily: "Milliard",
                                            fontSize: 18.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),

                      ),
                      SizedBox(height: 35.h,),
                      //Divider
                      Container(width: 344.w, child: Divider()),
                      SizedBox(height: 21.h,),
                      //Price Details
                      //Item Total
                      Container(
                        width: 344.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                             AppLocalizations.of(context)!.translate("itemTotal"),
                              style: TextStyle(
                                  fontFamily: "Milliard",
                                  fontSize: 16.sp,
                                  color: Color.fromRGBO(148, 148, 148, 1)
                              ),
                            ),

                            Text(
                              state.getAllForOwnerRestaurant.orders![widget.index].item!.price.toString()+" Fcfa",
                              style: TextStyle(
                                fontFamily: "Milliard",
                                fontSize: 18.sp,
                              ),
                            ),

                          ],
                        ),

                      ),
                      SizedBox(height: 13.h,),
                      //Remise
                      Container(
                        width: 344.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.translate("discount"),
                              style: TextStyle(
                                  fontFamily: "Milliard",
                                  fontSize: 16.sp,
                                  color: Color.fromRGBO(148, 148, 148, 1)
                              ),
                            ),
                            Text(
                              "-"+state.getAllForOwnerRestaurant.orders![widget.index].item!.discount!.toString()+' Fcfa',
                              style: TextStyle(
                                fontFamily: "Milliard",
                                fontSize: 18.sp,
                              ),
                            ),

                          ],
                        ),

                      ),
                      SizedBox(height: 13.h,),

                      //Delivery free
                      Container(
                        width: 344.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.translate("freeDelivery"),
                              style: TextStyle(
                                  fontFamily: "Milliard",
                                  fontSize: 16.sp,
                                  color: Color.fromRGBO(104, 211, 137, 1)
                              ),
                            ),
                            Text(
                              "free",
                              style: TextStyle(
                                  fontFamily: "Milliard",
                                  fontSize: 18.sp,
                                  color: Color.fromRGBO(104, 211, 137, 1)
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 21.h,),
                      Container(width: 344.w, child: Divider()),
                      SizedBox(height: 16.h,),
                      //Total Pay
                      Container(
                        width: 344.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.translate("orderTotal"),
                              style: TextStyle(
                                fontFamily: "Milliard",
                                fontSize: 27.sp,
                              ),
                            ),
                            Text(
                              state.getAllForOwnerRestaurant.orders![widget.index].total!.toString() +" Fcfa",
                              style: TextStyle(
                                fontFamily: "Milliard",
                                fontSize: 27.sp,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 260.h,),

                      state.getAllForOwnerRestaurant.orders![widget.index].status == "valid" ? InkWell(
                        onTap: (){
                          _mentionOrderReadyBloc.add(StartMentionOrderReady(code: state.getAllForOwnerRestaurant.orders![widget.index].code!));
                        },
                        child: Container(
                          width: 344.w,
                          height: 45.h,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0XFF68D389),),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context)!.translate("mentionThisOrderReady"),
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w300,
                                fontFamily: "Milliard",
                                color: Color(0XFF68D389),
                              ),
                            ),
                          ),
                        ),
                      ): Container()
                    ],
                  ),
                ),
              );
            }

            if(state is GetAllForOwnerRestaurantError){
              return Container(
                child: Center(
                  child: Text("Err"),
                ),
              );
            }

            return Container(
              child: Center(
                child: Text("Aucun Cas"),
              ),
            );
          },
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
