
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/constants.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class CustomNavBarWidget extends StatelessWidget {
  final int selectedIndex;
  final List<PersistentBottomNavBarItem> items; // NOTE: You CAN declare your own model here instead of `PersistentBottomNavBarItem`.
  final ValueChanged<int> onItemSelected;

  CustomNavBarWidget(
      {Key? key,
        required this.selectedIndex,
        required this.items,
        required this.onItemSelected,});

  Widget _buildItem( PersistentBottomNavBarItem item, bool isSelected) {

    return Container(
      alignment: Alignment.center,
      height: 80.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: IconTheme(
              data: IconThemeData(
                  size: 35.sp,
                  color: isSelected
                      ? (item.activeColorSecondary == null
                      ? item.activeColorPrimary
                      : item.activeColorSecondary)
                      : item.inactiveColorPrimary == null
                      ? item.activeColorPrimary
                      : item.inactiveColorPrimary),
              child: item.icon,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Material(
              type: MaterialType.transparency,
              child: FittedBox(
                  child: Text(
                    item.title!,
                    style: TextStyle(
                        color: isSelected
                            ? (item.activeColorSecondary == null
                            ? item.activeColorPrimary
                            : item.activeColorSecondary)
                            : item.inactiveColorPrimary,
                      fontSize: 9.sp,
                      fontFamily: "Milliard",
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          ),
          boxShadow: [
            BoxShadow(
              color: kPrimaryColor.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 30,
            ),
          ]
      ),
      child: Center(
        child: Container(
          width: double.infinity,
          height: 80.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items.map((item) {
              int index = items.indexOf(item);
              return Flexible(
                child: GestureDetector(
                  onTap: () {
                    this.onItemSelected(index);
                  },
                  child: _buildItem(
                      item, selectedIndex == index),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
