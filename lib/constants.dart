import 'package:flutter/material.dart';
import 'package:ivfoods_mobile_app/size_config.dart';


const kPrimaryColor = Color(0xFFBC2C3D);
const kPrimaryLightColor = Color(0xFFFCF4F5);

const kTextColor = Color(0xFF2C2627);

const kAnimationDuration = Duration(milliseconds: 6000);

dynamic fontSize({double? size}) => getProportionateScreenWidth(size!);
horizontal({double? size}) => getProportionateScreenWidth(size!);
width({double? size}) => getProportionateScreenWidth(size!);
left({double? size}) => getProportionateScreenWidth(size!);
right({double? size}) => getProportionateScreenWidth(size!);
vertical({double? size}) => getProportionateScreenHeight(size!);
height({double? size}) => getProportionateScreenHeight(size!);
top({double? size}) => getProportionateScreenHeight(size!);
bottom({double? size}) => getProportionateScreenHeight(size!);
navigateTo({BuildContext? context, required String routeName, required Object args}) => Navigator.of(context!).pushNamed(routeName, arguments: args);
navigateReplaceTo({BuildContext? context, String? routeName, Object? args}) => Navigator.of(context!).pushReplacementNamed(routeName!, arguments: args);
