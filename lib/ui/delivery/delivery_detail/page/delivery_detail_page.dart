import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:ivfoods_mobile_app/constants.dart';
import 'package:ivfoods_mobile_app/core/platform/loading_widget.dart';
import 'package:ivfoods_mobile_app/core/platform/icon/lv_icons.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/bloc/get_one_for_deliver.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/order.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';
import 'package:ivfoods_mobile_app/ui/delivery/delivery_detail/widgets/customer/customer_detail.dart';
import 'package:ivfoods_mobile_app/ui/delivery/delivery_detail/widgets/delivery_detail/delivery_detail.dart';
import 'package:ivfoods_mobile_app/ui/delivery/order_detail/widgets/sub_widgets/custom_tab_view_order_detail.dart';

class DeliveryDetailPage extends StatefulWidget {
  final String code;

  const DeliveryDetailPage({Key? key, required this.code}) : super(key: key);
  @override
  _DeliveryDetailPageState createState() => _DeliveryDetailPageState();
}

class _DeliveryDetailPageState extends State<DeliveryDetailPage> {
  var gen = new Random();
  int i= 0;
  GetOneForDeliverBloc _getOneForDeliverBloc = sl<GetOneForDeliverBloc>();

  List<String> data = [];
  int initPosition = 0;

  @override
  void initState() {
    _getOneForDeliverBloc.add(EventGetOneForDeliver(code: widget.code));
    initializeDateFormatting('fr');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _getOneForDeliverBloc.add(EventGetOneForDeliver(code: widget.code));
    data = [AppLocalizations.of(context)!.translate("deliveryDetail"), AppLocalizations.of(context)!.translate("customer")];
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (_) => _getOneForDeliverBloc,
          child: BlocBuilder(
            bloc: _getOneForDeliverBloc,
            builder: (context, state){
              if(state is GetOneForDeliverEmpty){
                return Container(
                  child: Center(
                    child: Text("Vide"),
                  ),
                );
              }

              if(state is GetOneForDeliverLoading){
                return LoadingWidget();
              }

              if(state is GetOneForDeliverLoaded){
                String phoneTwo = state.getOneForDeliver.delivery!.phone!.code.toString() + state.getOneForDeliver.delivery!.phone!.content.toString();
                List<Widget> widget = [DeliveryDetail(delivery: state.getOneForDeliver.delivery!,), CustomerDetail(user: state.getOneForDeliver.delivery!.orderGroup!.user!, phoneTwo: phoneTwo,)];

                List<Order>? list = getOrder(state.getOneForDeliver.delivery!.orderGroup!.orders);

                String getValues(List<Order> values){
                  String name = "";
                    values.forEach((element){
                        name = name +element.item!.name.toString()+", ";
                    });
                  return name;
                }
                Map<int, String> names = new Map.fromIterable(
                  list!,
                  key: (key) => gen.nextInt(list.length),
                  value: (value) => getValues(list),
                );


                return Container(
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 414.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(37),
                                bottomRight: Radius.circular(37),
                              ),
                              color: Color(0XFFFCF4F5),
                            ),
                            child: Center(
                              child: Container(
                                width: 344.w,
                                child: Column(
                                  children: [
                                    SizedBox(height: 35.h,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
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
                                        Text(
                                          AppLocalizations.of(context)!.translate("orderDetail"),
                                          style: TextStyle(
                                            fontFamily: "Milliard",
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w200,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20.h,),
                                    //Title de l'aliment
                                    Container(
                                      width: 344.w,
                                      child: Text(
                                        change(names.values),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20.sp,
                                          fontFamily: "Milliard",
                                          color: kPrimaryColor,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 11.h,),
                                    Container(
                                      width: 344.w,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.location_on_outlined,
                                                size: 16.sp,
                                                color: Colors.black,
                                              ),
                                              SizedBox(width: 10.w,),
                                              //Localisation
                                              Text(
                                                state.getOneForDeliver.delivery!.district.toString()+", "+state.getOneForDeliver.delivery!.city.toString()+", "+state.getOneForDeliver.delivery!.country.toString(),
                                                style: TextStyle(
                                                    fontFamily: "Milliard",
                                                    fontSize: 15.sp,
                                                    color: Color(0XFF2C2627)
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Center(
                                                child: Icon(
                                                  LvIcons.dollar__1_,
                                                  size: 16.sp,
                                                  color: state.getOneForDeliver.delivery!.statusPayment == "paid" && state.getOneForDeliver.delivery!.orderGroup!.statusPayment == "paid" ? Color(0XFF4884EE) : Color(0XFFBC2C3D),
                                                ),
                                              ),
                                              SizedBox(width: 10.w,),
                                              Text(
                                                state.getOneForDeliver.delivery!.statusPayment == "paid" && state.getOneForDeliver.delivery!.orderGroup!.statusPayment == "paid" ? AppLocalizations.of(context)!.translate("paid") : AppLocalizations.of(context)!.translate("unPaid"),
                                                style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontFamily: "Milliard",
                                                  color: state.getOneForDeliver.delivery!.statusPayment == "paid" && state.getOneForDeliver.delivery!.orderGroup!.statusPayment == "paid" ? Color(0XFF4884EE) : Color(0XFFBC2C3D),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),

                                    SizedBox(height: 11.h,),

                                    Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.access_time_rounded,
                                                  size: 16.sp,
                                                  color: Colors.black,
                                                ),
                                                SizedBox(width: 10.w,),
                                                //Localisation
                                                Text(
                                                  getDate(state.getOneForDeliver.delivery!.createdAt.toString()) +" a "+ getHour(state.getOneForDeliver.delivery!.createdAt.toString()),
                                                  style: TextStyle(
                                                      fontFamily: "Milliard",
                                                      fontSize: 15.sp,
                                                      color: Color(0XFF2C2627)
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          state.getOneForDeliver.delivery!.status == "ready" ?
                                          Center(
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 25.r,
                                                    width: 25.r,
                                                    decoration: BoxDecoration(
                                                        color: Color(0XFFF1E5F6),
                                                        borderRadius: BorderRadius.circular(10)
                                                    ),
                                                    child: Icon(
                                                      Icons.clean_hands,
                                                      size: 16.sp,
                                                      color: Color(0XFFA27AFA),
                                                    ),
                                                  ),
                                                  SizedBox(width: 10.w,),
                                                  Text(
                                                    AppLocalizations.of(context)!.translate("ready"),
                                                    style: TextStyle(
                                                      fontSize: 15.sp,
                                                      fontFamily: "Milliard",
                                                      color: Color(0XFFA27AFA),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ) : state.getOneForDeliver.delivery!.status == "delivered" ?
                                          Center(
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 25.r,
                                                    width: 25.r,
                                                    decoration: BoxDecoration(
                                                        color: Color(0XFFEFFBF2),
                                                        borderRadius: BorderRadius.circular(10)
                                                    ),
                                                    child: Icon(
                                                      Icons.check,
                                                      size: 16.sp,
                                                      color: Color(0XFF68D389),
                                                    ),
                                                  ),
                                                  SizedBox(width: 10.w,),
                                                  Text(
                                                    AppLocalizations.of(context)!.translate("delivered"),
                                                    style: TextStyle(
                                                      fontSize: 15.sp,
                                                      fontFamily: "Milliard",
                                                      color: Color(0XFF68D389),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ) : state.getOneForDeliver.delivery!.status == "on_the_way" ?
                                          Center(
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 25.r,
                                                    width: 25.r,
                                                    decoration: BoxDecoration(
                                                        color: Color(0XFFFFF7E9),
                                                        borderRadius: BorderRadius.circular(10)
                                                    ),
                                                    child: Icon(
                                                      Icons.access_time_rounded,
                                                      size: 16.sp,
                                                      color: Color(0XFFFBB634),
                                                    ),
                                                  ),
                                                  SizedBox(width: 10.w,),
                                                  Text(
                                                  AppLocalizations.of(context)!.translate("onTheWay"),
                                                    style: TextStyle(
                                                      fontSize: 15.sp,
                                                      fontFamily: "Milliard",
                                                      color: Color(0XFFFBB634),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ): Center(
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 25.r,
                                                    width: 25.r,
                                                    decoration: BoxDecoration(
                                                        color: Color(0XFFF1E5F6),
                                                        borderRadius: BorderRadius.circular(10)
                                                    ),
                                                    child: Icon(
                                                      Icons.clean_hands,
                                                      size: 16.sp,
                                                      color: Color(0XFFA27AFA),
                                                    ),
                                                  ),
                                                  SizedBox(width: 10.w,),
                                                  Text(
                                                    state.getOneForDeliver.delivery!.status.toString(),
                                                    style: TextStyle(
                                                      fontSize: 15.sp,
                                                      fontFamily: "Milliard",
                                                      color: Color(0XFFA27AFA),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 28.h,),
                                  ],
                                ),
                              ),
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

              if(state is GetOneForDeliverError){
                var message = state.message;
                return Container(
                  child: Center(
                    child: Text("Error "+message+"!"),
                  ),
                );
              }

              return Container(
                child: Center(
                  child: Text(
                    AppLocalizations.of(context)!.translate("noCase")
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  List<Order>? getOrder(List<Order>? orders) {
    List<Order> myList = List.from(orders!);
    return myList;
  }

  String change(Iterable<String> values) {
    String value = "";
    int i = 0;
    values.forEach((element) {
      value = element;
    });
    return value;
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



