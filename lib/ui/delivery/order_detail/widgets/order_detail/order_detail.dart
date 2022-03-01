import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/domain/entities/order.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';
import 'package:ivfoods_mobile_app/ui/delivery/order_detail/widgets/order_detail/widgets/order_detail_in_progress.dart';
import 'package:ivfoods_mobile_app/ui/delivery/order_detail/widgets/order_detail/widgets/order_detail_ready.dart';
import 'package:ivfoods_mobile_app/ui/delivery/order_detail/widgets/order_detail/widgets/order_detail_recovered.dart';

class OrderDetail extends StatefulWidget {
  final String name;

  const OrderDetail({Key? key, required this.name}) : super(key: key);
  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  //static List<Widget> _widgetOptions;
  List<String> data = [];
  int initPosition = 0;
  bool commandTake = false;
  List<Order>? _orders;

  @override
  void initState() {
    super.initState();
  }

  Widget _tabOrderStatut(){
  return  Container(
      width: 340.w,
      height: 31.h,
        child: TabBar(
            labelColor: Color.fromRGBO(188, 44, 61, 1),
            unselectedLabelColor: Color.fromRGBO(148, 148, 148, 1),
            indicator:BoxDecoration(
              color: Colors.white,
                borderRadius: BorderRadius.circular(5.r)
            ),
            labelStyle: TextStyle(fontFamily: "Milliard", fontSize: 14.sp, fontWeight: FontWeight.w200,),
            tabs: [
              //Tab(text: "Prêt"),
              Tab(
                child: Container(
                  width: 83.w,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(246, 246, 246, 1),
                      borderRadius: BorderRadius.circular(5.r)
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child:  Text(
                    AppLocalizations.of(context)!.translate("ready"),
                    ),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  width: 83.w,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(246, 246, 246, 1),
                      borderRadius: BorderRadius.circular(5.r)
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child:  Text(
                        AppLocalizations.of(context)!.translate("inProgress"),
                    ),
                  ),
                ),
              ),
              //Tab(text: "En cours"),
              Tab(
                child: Container(
                  width: 83.w,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(246, 246, 246, 1),
                      borderRadius: BorderRadius.circular(5.r)
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child:  Text(
                        AppLocalizations.of(context)!.translate("recovered")
                    ),
                  ),
                ),
              ),
              // Tab(text: "Récupérés"),
            ]
        ),
      );}
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child:SingleChildScrollView(
            child: Container(
              width: size.width,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 21.h,),
                  //Navigation
                  Center(
                    child:_tabOrderStatut(),
                  ),
                  //PageAdequat
                  Container(
                    height: 480.h,
                    width: 340.w,
                    //color: Colors.green,
                    child:TabBarView(
                      children: [
                        OrderDetailReady(name: widget.name,),
                        OrderDetailInProgress(name: widget.name,),
                        OrderDetailRecovered(name: widget.name,)
                      ],
                    ),
                  ),
                  //SizedBox(height: 103.h,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
