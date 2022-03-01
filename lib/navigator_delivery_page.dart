import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ivfoods_mobile_app/constants.dart';
import 'package:ivfoods_mobile_app/core/platform/custom_nav_bar_widget.dart';
import 'package:ivfoods_mobile_app/core/platform/icon/lv_icons.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';
import 'package:ivfoods_mobile_app/ui/delivery/delivery/page/delivery_page.dart';
import 'package:ivfoods_mobile_app/ui/delivery/home_delivery/page/home_delivery.dart';
import 'package:ivfoods_mobile_app/ui/delivery/order/page/order_page.dart';
import 'package:ivfoods_mobile_app/ui/delivery/profil_delivery/pages/profile_delivery_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class NavigatorDeliveryPage extends StatefulWidget {
  @override
  _NavigatorDeliveryPageState createState() => _NavigatorDeliveryPageState();
}

class _NavigatorDeliveryPageState extends State<NavigatorDeliveryPage> {
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
      HomeDelivery(),
      OrderPage(),
      DeliveryPage(),
      ProfileDeliveryPage(),
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
        icon: Icon(LvIcons.lv_orders),
        title: (AppLocalizations.of(context)!.translate("order")),
        activeColorPrimary: kPrimaryColor,
        inactiveColorPrimary: Colors.black,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(LvIcons.lv_delivery),
        title: (AppLocalizations.of(context)!.translate("delivery")),
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

  @override
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
        // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true,
        customWidget: CustomNavBarWidget( // Your custom widget goes here
          items: _navBarsItems(),
          selectedIndex: _controller!.index,
          onItemSelected: (index) {
            setState(() {
              _controller!.index = index; // NOTE: THIS IS CRITICAL!! Don't miss it!
            });
          },
        ),
        itemCount: _navBarsItems().length,
        screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 900),
        ),
      ),
    );
  }
}

