import 'package:flutter/material.dart';
import 'package:ivfoods_mobile_app/constants.dart';
import 'package:ivfoods_mobile_app/core/platform/custom_nav_bar_widget.dart';
import 'package:ivfoods_mobile_app/core/platform/icon/lv_icons.dart';
import 'package:ivfoods_mobile_app/core/platform/icon/lv_icons_resto.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/home_restaurant/page/home_restaurant.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/notifications_page/page/notifications_restaurant.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/profile_restaurant/page/profile_restaurant.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/page/restaurant_restaurant.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class NavigatorRestaurantPage extends StatefulWidget {
  final String? restaurantName;
  final String? address;

  const NavigatorRestaurantPage({Key? key, this.restaurantName, this.address}) : super(key: key);
  @override
  _NavigatorRestaurantPageState createState() => _NavigatorRestaurantPageState();
}

class _NavigatorRestaurantPageState extends State<NavigatorRestaurantPage> {
  PersistentTabController? _controller;
  bool? _hideNavBar;
  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() {
    return [
      HomeRestaurant(restaurantName: widget.restaurantName!, address: widget.address,),
      RestaurantResto(),
      NotificationRestaurant(),
      ProfileRestaurant(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(LvIcons.lv_home),
        title: (AppLocalizations.of(context)!.translate("home")),
        activeColorPrimary: kPrimaryColor,
        inactiveColorPrimary: Colors.black,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(LvIconsResto.restaurant),
        title: (AppLocalizations.of(context)!.translate("restaurant")),
        activeColorPrimary: kPrimaryColor,
        inactiveColorPrimary: Colors.black,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(LvIcons.bell),
        title: (AppLocalizations.of(context)!.translate("notifications")),
        activeColorPrimary: kPrimaryColor,
        inactiveColorPrimary: Colors.black,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(LvIcons.lv_user),
        title: (AppLocalizations.of(context)!.translate("profile")),
        activeColorPrimary: kPrimaryColor,
        inactiveColorPrimary: Colors.black,
      ),
    ];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView.custom(
        context,
        controller: _controller,
        screens: _buildScreens(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true,
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true,
        customWidget: CustomNavBarWidget( // Your custom widget goes here
          items: _navBarsItems(),
          selectedIndex: _controller!.index,
          onItemSelected: (index) {
            setState(() {
              _controller!.index = index;
            });
          },
        ),
        itemCount: _navBarsItems().length,
        screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
        ),
      ),
    );
  }
}
