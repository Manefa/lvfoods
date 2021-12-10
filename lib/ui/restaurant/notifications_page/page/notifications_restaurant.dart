import 'package:flutter/material.dart';
class NotificationRestaurant extends StatefulWidget {
  const NotificationRestaurant({Key? key}) : super(key: key);

  @override
  _NotificationRestaurantState createState() => _NotificationRestaurantState();
}

class _NotificationRestaurantState extends State<NotificationRestaurant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
