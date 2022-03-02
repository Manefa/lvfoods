import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/constants.dart';
import 'package:ivfoods_mobile_app/core/platform/alert_dialog/alert_dialogue_mention_on_the_way.dart';
import 'package:ivfoods_mobile_app/core/platform/alert_dialog/alert_dialogue_take_delivery.dart';
import 'package:ivfoods_mobile_app/features/delivered/bloc/delivered.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/delivery.dart';
import 'package:ivfoods_mobile_app/features/on_the_way/bloc/on_the_way.dart';
import 'package:ivfoods_mobile_app/features/paid_delivery/bloc/paid_delivery.dart';
import 'package:ivfoods_mobile_app/features/paid_order_group/bloc/order_group_paid.dart';
import 'package:ivfoods_mobile_app/features/take_deliveries/bloc/take_delivery.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';
import 'package:ivfoods_mobile_app/ui/delivery/delivery_detail/widgets/delivery_detail/delivery_detail_display.dart';
import 'package:ivfoods_mobile_app/core/platform/alert_dialog/alert_dialogue_delivery.dart';

class DeliveryDetail extends StatefulWidget {
  final Delivery delivery;

  const DeliveryDetail({Key? key, required this.delivery}) : super(key: key);
  @override
  _DeliveryDetailState createState() => _DeliveryDetailState();
}

class _DeliveryDetailState extends State<DeliveryDetail> {
  TakeDeliveryBloc _takeDeliveryBloc = sl<TakeDeliveryBloc>();
  OnTheWayBloc _onTheWayBloc = sl<OnTheWayBloc>();
  DeliveredBloc _deliveredBloc = sl<DeliveredBloc>();
  PaidDeliveryBloc _paidDeliveryBloc = sl<PaidDeliveryBloc>();
  OrderGroupPaidBloc _orderGroupPaidBloc = sl<OrderGroupPaidBloc>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<TakeDeliveryBloc>(
            create: (BuildContext context) => _takeDeliveryBloc,
          ),
          BlocProvider<OnTheWayBloc>(
            create: (BuildContext context) => _onTheWayBloc,
          ),
          BlocProvider<DeliveredBloc>(
            create: (BuildContext context) => _deliveredBloc,
          ),
          BlocProvider<PaidDeliveryBloc>(
            create: (BuildContext context) => _paidDeliveryBloc,
          ),
          BlocProvider<OrderGroupPaidBloc>(
            create: (BuildContext context) => _orderGroupPaidBloc,
          ),
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<TakeDeliveryBloc, TakeDeliveryState>(
              listener: (context, state) {
                if(state is TakeDeliveryLoading){
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
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

                if(state is TakeDeliveryLoaded){
                  showDialog(
                      context: context,
                      builder:(BuildContext context){
                        return AlertDialogueTakeDelivery();
                      }
                  );
                }

                if(state is TakeDeliveryError){
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              state.message + AppLocalizations.of(context)!.translate("youWereUnableToCollectTheDelivery"),
                              style: TextStyle(fontFamily: "Milliard", color: Colors.white),),
                            Icon(Icons.error, color: Colors.white,)],
                        ),
                        backgroundColor: kPrimaryColor,
                      ),
                    );
                }
              },
            ),
            BlocListener<OnTheWayBloc, OnTheWayState>(
              listener: (context, state) {
                if(state is OnTheWayLoading){
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
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
                if(state is OnTheWayLoaded){
                  showDialog(
                      context: context,
                      builder:(BuildContext context){
                        return AlertDialogueDeliveryMentionOnTheWay();
                      }
                  );
                }

                if(state is OnTheWayError){
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text(AppLocalizations.of(context)!.translate("theDeliveryCannotBeSwitchedToTheCurrentState"), style: TextStyle(fontFamily: "Milliard", color: Colors.white),), Icon(Icons.error, color: Colors.white,)],
                        ),
                        backgroundColor: kPrimaryColor,
                      ),
                    );
                }
              },
            ),
            BlocListener<DeliveredBloc, DeliveredState>(
              listener: (context, state) {
                if(state is DeliveredLoading){
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
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
                if(state is DeliveredLoaded){
                  showDialog(
                      context: context,
                      builder:(BuildContext context){
                        return AlertDialogueDeliveryDetailPaid();
                      }
                  );
                }

                if(state is DeliveredError){
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text(AppLocalizations.of(context)!.translate("theDeliveryFailed"), style: TextStyle(fontFamily: "Milliard", color: Colors.white),), Icon(Icons.error, color: Colors.white,)],
                        ),
                        backgroundColor: kPrimaryColor,
                      ),
                    );
                }
              },
            ),
            BlocListener<PaidDeliveryBloc, PaidDeliveryState>(
              listener: (context, state) {
                if(state is PaidDeliveryLoading){
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.translate("wait"),
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

                if(state is PaidDeliveryLoaded){
                  if(widget.delivery.orderGroup!.statusPayment == "unpaid"){
                    _orderGroupPaidBloc.add(PaidOrderGroup(code: widget.delivery.orderGroup!.code!));
                  }else{
                    _deliveredBloc.add(MakeDelivered(code: widget.delivery.code!,));
                  }
                }

                if(state is PaidDeliveryError){
                  if(state.message == "Connection Failure"){
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text( AppLocalizations.of(context)!.translate("internetConnectionProblem"), style: TextStyle(fontFamily: "Milliard", color: Colors.white),), Icon(Icons.error, color: Colors.white,)],
                          ),
                          backgroundColor: kPrimaryColor,
                        ),
                      );
                  }else{
                    if(widget.delivery.orderGroup!.statusPayment == "unpaid"){
                      _orderGroupPaidBloc.add(PaidOrderGroup(code: widget.delivery.orderGroup!.code!));
                    }
                  }
                }
              },
            ),
            BlocListener<OrderGroupPaidBloc, OrderGroupPaidState>(
              listener: (context, state) {
                if(state is OrderGroupPaidLoading){
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.translate("wait"),
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

                if(state is OrderGroupPaidLoaded){
                  _deliveredBloc.add(MakeDelivered(code: widget.delivery.code!,));
                }

                if(state is OrderGroupPaidError){
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.translate("thePaymentOfTheOrderGroupHasFailed"),
                              style: TextStyle(
                                fontFamily: "Milliard",
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        backgroundColor: kPrimaryColor,
                      ),
                    );
                }
              },
            ),
          ],
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                width: size.width,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 28.h,),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 35.w,),
                        Text(
                          "ID Commande",
                          style: TextStyle(
                            fontFamily: "Milliard",
                            fontSize: 15.sp,
                            color: Color(0XFF949494),
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        Padding(
                          padding: const EdgeInsets.only(right: 35.0),
                          child: Text(
                            widget.delivery.orderGroup!.code.toString(),
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontFamily: "Milliard",
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    DeliveryDetailDisplay(orders: widget.delivery.orderGroup!.orders!,),
                    SizedBox(height: 20.h,),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 35.w,),
                        Text(
                          AppLocalizations.of(context)!.translate("itemTotal"),
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: "Milliard",
                            color: Color(0XFF949494),
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        Padding(
                          padding: const EdgeInsets.only(right: 35),
                          child: Text(
                              widget.delivery.orderGroup!.totalPrice.toString()+" Fcfa",
                            style: TextStyle(
                              fontFamily: "Milliard",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h,),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 35.w,),
                        Text(
                          AppLocalizations.of(context)!.translate("freeDelivery"),
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: "Milliard",
                            color: Color(0XFF68D389),
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        Padding(
                          padding: const EdgeInsets.only(right: 35),
                          child: Text(
                            widget.delivery.deliveryCharges.toString()+ " Fcfa",
                            style: TextStyle(
                                fontFamily: "Milliard",
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              color: Color(0XFF68D389),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h,),
                    Padding(
                      padding: const EdgeInsets.only(left: 31, right: 35),
                      child: Container(
                        height: 1,
                        width: size.width,
                        color: Color(0XFFDFDEDD),
                      ),
                    ),
                    SizedBox(height: 40.h,),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 35.w,),
                        Text(
                          AppLocalizations.of(context)!.translate("totalPaid"),
                          style: TextStyle(
                            fontSize: 25.sp,
                            fontFamily: "Milliard",
                            color: Colors.black,
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        Padding(
                          padding: const EdgeInsets.only(right: 35),
                          child: Text(
                            (widget.delivery.orderGroup!.totalPrice!.toDouble() + widget.delivery.deliveryCharges!.toDouble()).toString() +" Fcfa",
                            style: TextStyle(
                              fontFamily: "Milliard",
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w300,
                              color: Color(0XFFBC2C3D),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 98.h,),
                    (widget.delivery.deliver == null) ?
                    InkWell(
                      onTap: (){
                        _takeDeliveryBloc.add(TakeDelivery(code: widget.delivery.code!));
                      },
                      child: Container(
                        width: 340.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0XFF68D389),),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context)!.translate("TakeThisDelivery"),
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w300,
                              fontFamily: "Milliard",
                              color: Color(0XFF68D389),
                            ),
                          ),
                        ),
                      ),
                    ) : (widget.delivery.deliver != null && widget.delivery.status == "ready") ?
                    InkWell(
                      onTap: (){
                        _onTheWayBloc.add(OnTheWayLaunch(code: widget.delivery.code!));
                      },
                      child: Container(
                        width: 340.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0XFF68D389),),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context)!.translate("mentionThisCurrentOrder"),
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w300,
                              fontFamily: "Milliard",
                              color: Color(0XFF68D389),
                            ),
                          ),
                        ),
                      ),
                    ) : (widget.delivery.statusPayment == "unpaid" || widget.delivery.orderGroup!.statusPayment == "unpaid" || widget.delivery.status != "delivered")?
                    InkWell(
                      onTap: () {
                        if(widget.delivery.statusPayment == "unpaid" || widget.delivery.orderGroup!.statusPayment == "unpaid"){
                          _paidDeliveryBloc.add(StartPaidDelivery(code: widget.delivery.code!));
                          print(widget.delivery.statusPayment.toString());
                          print(widget.delivery.orderGroup!.statusPayment.toString());

                        }

                        if(widget.delivery.statusPayment == "paid" && widget.delivery.orderGroup!.statusPayment == "paid" && widget.delivery.status != "delivered"){
                          print(widget.delivery.status.toString()+"sfsd");
                          print(widget.delivery.statusPayment.toString());
                          print(widget.delivery.orderGroup!.statusPayment.toString());
                          _deliveredBloc.add(MakeDelivered(code: widget.delivery.code!));
                        }
                      },
                      child: Container(
                        width: 340.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0XFF68D389),),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context)!.translate("deliverAndPay"),
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w300,
                              fontFamily: "Milliard",
                              color: Color(0XFF68D389),
                            ),
                          ),
                        ),
                      ),
                    ): Container(),
                    SizedBox(height: 30.h,),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
