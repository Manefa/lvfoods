import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ivfoods_mobile_app/features/orders/bloc/orders.dart';

class OrdersControl extends StatefulWidget {
  @override
  _OrdersControlState createState() => _OrdersControlState();
}

class _OrdersControlState extends State<OrdersControl> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<OrdersBloc>(context).add(GetOrders());
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
