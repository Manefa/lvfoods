import 'package:flutter/material.dart';
import 'package:ivfoods_mobile_app/navigator_delivery_page.dart';
import 'package:ivfoods_mobile_app/ui/choose_profil/page/choose_profil.dart';
import 'package:ivfoods_mobile_app/ui/delivery/home_delivery/page/home_delivery.dart';
import 'package:ivfoods_mobile_app/ui/delivery/notification_delivery/page/notification_page.dart';
import 'package:ivfoods_mobile_app/ui/delivery/profil_delivery/pages/profile_delivery_page.dart';
import 'package:ivfoods_mobile_app/ui/forgot_password/page/forgot_password.dart';
import 'package:ivfoods_mobile_app/ui/login/page/login_page.dart';
import 'package:ivfoods_mobile_app/ui/navigator_restaurant_page.dart';
import 'package:ivfoods_mobile_app/ui/onbaording/page/onbaording_page.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/chose_restaurant/page/chose_restaurant.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/home_restaurant/page/home_restaurant.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/notifications_page/page/notifications_restaurant.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/profile_restaurant/page/profile_restaurant.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/page/restaurant_restaurant.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/menu/add_meal/add_meal.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/menu/menu_restau_detail/pages/menu_restau_details.dart';
import 'package:ivfoods_mobile_app/ui/splash/splash_page.dart';

var routes = {
   //root routes
   "/": (BuildContext context) => SplashPage(),

   //regarding the login routes
   "/onboarding" : (BuildContext context) => OnbaordingPage(),
   "/login" : (BuildContext context) => LoginPage(),
   "/chooseprofil" : (BuildContext context) => ChooseProfil(),
   "/forgotpassword" : (BuildContext context) => ForgotPassword(),

   //regarding the delivery routes
   "/deliverynavigatorpage" : (BuildContext context) => NavigatorDeliveryPage(),
   "/homedelivery" : (BuildContext context) => HomeDelivery(),
   "/notificationpage" : (BuildContext context) => NotificationPage(),
   "/profiledelivery" : (BuildContext context) => ProfileDeliveryPage(),
   "/navigatorDeliveryPage" : (BuildContext context) => NavigatorDeliveryPage(),

   //regarding the restaurant routes
   "/navigatorrestaurantpage" : (BuildContext context) => NavigatorRestaurantPage(),
   "/chooserestaurant" : (BuildContext context) => ChooseRestaurant(),
   "/homerestaurant" : (BuildContext context) => HomeRestaurant(),
   "/restaurantpage" : (BuildContext context) => RestaurantResto(),
   "/notificationrestaurantpage" : (BuildContext context) => NotificationRestaurant(),
   "/profileresaturant" : (BuildContext context) => ProfileRestaurant(),
   "/addmeal":(BuildContext context) => AddMeal(),
   "/restaudetail":(BuildContext context) => RestauMenuDetails()
};
