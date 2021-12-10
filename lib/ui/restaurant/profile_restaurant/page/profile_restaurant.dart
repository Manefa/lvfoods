import 'package:flutter/material.dart';

import '../../../delivery/profil_delivery/pages/profile_delivery_page.dart';
class ProfileRestaurant extends StatefulWidget {
  const ProfileRestaurant({Key? key}) : super(key: key);

  @override
  _ProfileRestaurantState createState() => _ProfileRestaurantState();
}

class _ProfileRestaurantState extends State<ProfileRestaurant> {
  @override
  Widget build(BuildContext context) {
    return ProfileDeliveryPage();
  }
}
