import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/bloc_localization/locale.dart';
import 'package:ivfoods_mobile_app/constants.dart';
import 'package:ivfoods_mobile_app/core/platform/icon/lv_icons.dart';
import 'package:ivfoods_mobile_app/features/get_user/bloc/get_user.dart';
import 'package:ivfoods_mobile_app/features/get_user/domain/entities/phone.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';
import 'package:ivfoods_mobile_app/ui/choose_profil/page/choose_profil.dart';
import 'package:ivfoods_mobile_app/ui/delivery/profil_delivery/widgets/edit_information_delivery.dart';
import 'package:ivfoods_mobile_app/ui/delivery/profil_delivery/widgets/manage_password_delivery.dart';
import 'package:ivfoods_mobile_app/ui/login/page/login_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileDeliveryPage extends StatefulWidget {
  const ProfileDeliveryPage({Key? key}) : super(key: key);

  @override
  _ProfileDeliveryPageState createState() => _ProfileDeliveryPageState();
}

class _ProfileDeliveryPageState extends State<ProfileDeliveryPage> {
  GetUserBloc _getUserBloc = sl<GetUserBloc>();
  String? image = "";
  String? fullName = "";
  String? emailAddress = "";
  String? userName = "";
  List<Phone>? phones = List.empty();
  var imagePicker;

  @override
  void initState() {
    _getUserBloc.add(GetUser());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    image = sl<SharedPreferences>().getString('image');
    fullName = sl<SharedPreferences>().getString('fullname');
    emailAddress = sl<SharedPreferences>().getString('email');
    userName = sl<SharedPreferences>().getString('username');
    List<String>? jsonPhones = sl<SharedPreferences>().getStringList("phones");
    phones = jsonPhones != null
        ? jsonPhones.map((item) => Phone.fromJson(json.decode(item))).toList()
        : List.empty();

    var size = MediaQuery.of(context).size;
    bool isSwitched = true;

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          color: Colors.white,
          child: Container(
            child: Stack(
              children: [
                ClipPath(
                  clipper: BottomWaveClipper(),
                  child: Container(
                    height: 384.h,
                    width: size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/app_bar_image.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 35.h,
                        ),
                        Text(
                          AppLocalizations.of(context)!.translate("profile"),
                          style: TextStyle(
                            fontFamily: "Milliard",
                            fontSize: 20.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        //Image
                        Center(
                          child: Stack(
                            children: [
                              (image == "")
                                  ? CircleAvatar(
                                      backgroundColor:
                                          Color.fromRGBO(246, 246, 246, 1),
                                      radius: 30.0,
                                      child: Center(
                                        child: Text(
                                          fullName![0],
                                          style: TextStyle(
                                            fontFamily: "Milliard",
                                            fontSize: 35.sp,
                                            color: Color.fromRGBO(188, 44, 61, 1),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    )
                                  : CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      radius: 30.0,
                                      backgroundImage: NetworkImage(image!),
                                    ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        Text(
                          fullName!,
                          style: TextStyle(
                            fontFamily: "Milliard",
                            fontSize: 20.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          "${phones![0].code! + " " + phones![0].content!}  -  $emailAddress",
                          style: TextStyle(
                            fontFamily: "Milliard",
                            fontSize: 16.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 280.h,
                  left: 35.w,
                  right: 35.w,
                  child: Container(
                    height: 578.h,
                    width: 344.w,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 2.0,
                            spreadRadius: 0.0,
                            offset: Offset(0.0, 2.0),
                          )
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 19.h,
                        ),
                        Container(
                          width: 290.w,
                          //height: 470.h,
                          child: Column(
                            children: [
                              //My Account
                              Container(
                                height: 27.h,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    AppLocalizations.of(context)!.translate("myAccount"),
                                    style: TextStyle(
                                      fontFamily: "Milliard",
                                      fontSize: 20.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 27.h,
                              ),
                              //My Informations
                              InkWell(
                                onTap: () => showModal(),
                                child: Container(
                                  height: 27.h,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          child: Row(
                                        children: [
                                          Icon(
                                            LvIcons.lv_user,
                                            size: 16.sp,
                                            color: kPrimaryColor,
                                          ),
                                          SizedBox(
                                            width: 14.w,
                                          ),
                                          Text(
                                            AppLocalizations.of(context)!.translate("myInformation"),
                                            style: TextStyle(
                                              fontFamily: "Milliard",
                                              fontSize: 16.sp,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      )),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 16.sp,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 23.h),
                              //Change Password
                              InkWell(
                                onTap: () => showModalBottomSheet(
                                    backgroundColor: Colors.white,
                                    //isDismissible: true,
                                    //isScrollControlled: true,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(20))),
                                    context: context,
                                    builder: (context) =>
                                        ManagePasswordDelivery()),
                                child: Container(
                                  height: 27.h,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          child: Row(
                                        children: [
                                          Icon(
                                            LvIcons.padlock,
                                            size: 16.sp,
                                            color: kPrimaryColor,
                                          ),
                                          SizedBox(
                                            width: 14.w,
                                          ),
                                          Text(
                                            AppLocalizations.of(context)!.translate("changePass"),
                                            style: TextStyle(
                                              fontFamily: "Milliard",
                                              fontSize: 16.sp,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      )),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 16.sp,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 33.h),
                              //Notifications
                              Container(
                                height: 27.h,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    AppLocalizations.of(context)!.translate("notifications"),
                                    style: TextStyle(
                                      fontFamily: "Milliard",
                                      fontSize: 20.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 27.h),
                              //Push Notification
                              Container(
                                height: 27.h,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        child: Row(
                                      children: [
                                        Icon(
                                          LvIcons.bell,
                                          size: 16.sp,
                                          color: kPrimaryColor,
                                        ),
                                        SizedBox(
                                          width: 14.w,
                                        ),
                                        Text(
                                          AppLocalizations.of(context)!.translate("notifications"),
                                          style: TextStyle(
                                            fontFamily: "Milliard",
                                            fontSize: 16.sp,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    )),
                                    //Switch
                                    SizedBox(
                                      height: 15.h,
                                      width: 31.w,
                                      child: Switch(
                                        value: isSwitched,
                                        onChanged: (value) {
                                          setState(() {
                                            isSwitched = false;
                                          });
                                        },
                                        activeTrackColor:
                                            Color.fromRGBO(188, 44, 61, 1),
                                        inactiveTrackColor:
                                            Color.fromRGBO(223, 222, 221, 1),
                                        activeColor: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 22.h),
                              //Promotional Notifications
                              Container(
                                height: 27.h,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        child: Row(
                                      children: [
                                        Icon(
                                          LvIcons.bell,
                                          size: 16.sp,
                                          color: kPrimaryColor,
                                        ),
                                        SizedBox(
                                          width: 14.w,
                                        ),
                                        Text(
                                          AppLocalizations.of(context)!.translate("promoNotification"),
                                          style: TextStyle(
                                            fontFamily: "Milliard",
                                            fontSize: 16.sp,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    )),
                                    //Switch
                                    SizedBox(
                                      height: 15.h,
                                      width: 31.w,
                                      child: Switch(
                                        value: true,
                                        onChanged: (value) {
                                          setState(() {
                                            isSwitched = value;
                                            print(isSwitched);
                                          });
                                        },
                                        activeTrackColor:
                                            Color.fromRGBO(188, 44, 61, 1),
                                        inactiveTrackColor:
                                            Color.fromRGBO(223, 222, 221, 1),
                                        activeColor: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 32.h),
                              //More
                              Container(
                                height: 27.h,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    AppLocalizations.of(context)!.translate("more"),
                                    style: TextStyle(
                                      fontFamily: "Milliard",
                                      fontSize: 20.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 27.h),
                              //Change Account
                              InkWell(
                                onTap: () {
                                  if (AppLocalizations.of(context)!.isEnLocale) {
                                    BlocProvider.of<LocaleBloc>(context).add(ToEnglish());
                                  } else {
                                    BlocProvider.of<LocaleBloc>(context).add(ToFrench());
                                  }
                                },
                                child: Container(
                                  height: 27.h,
                                  child: Row(
                                    children: [
                                      Container(
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.translate,
                                                size: 16.sp,
                                                color: kPrimaryColor,
                                              ),
                                              SizedBox(
                                                width: 14.w,
                                              ),
                                              Text(
                                                AppLocalizations.of(context)!.translate("changeLang"),
                                                style: TextStyle(
                                                  fontFamily: "Milliard",
                                                  fontSize: 16.sp,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 27.h),
                              //Change Account
                              InkWell(
                                onTap: () {
                                  pushNewScreen(
                                    context,
                                    screen: ChooseProfil(),
                                    withNavBar:
                                        false, // OPTIONAL VALUE. True by default.
                                    pageTransitionAnimation:
                                        PageTransitionAnimation.cupertino,
                                  );
                                },
                                child: Container(
                                  height: 27.h,
                                  child: Row(
                                    children: [
                                      Container(
                                          child: Row(
                                        children: [
                                          Icon(
                                            LvIcons.switch_icon,
                                            size: 16.sp,
                                            color: kPrimaryColor,
                                          ),
                                          SizedBox(
                                            width: 14.w,
                                          ),
                                          Text(
                                            AppLocalizations.of(context)!.translate("changeAcc"),
                                            style: TextStyle(
                                              fontFamily: "Milliard",
                                              fontSize: 16.sp,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      )),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 23.h),
                              //Logout
                              InkWell(
                                onTap: () {
                                  sl<SharedPreferences>().clear();
                                  pushNewScreen(
                                    context,
                                    screen: LoginPage(),
                                    withNavBar: false,
                                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                  );
                                },
                                child: Container(
                                  height: 27.h,
                                  child: Row(
                                    children: [
                                      Container(
                                          child: Row(
                                        children: [
                                          Icon(
                                            LvIcons.logout,
                                            size: 16.sp,
                                            color: kPrimaryColor,
                                          ),
                                          SizedBox(
                                            width: 14.w,
                                          ),
                                          Text(
                                            AppLocalizations.of(context)!.translate("logout"),
                                            style: TextStyle(
                                              fontFamily: "Milliard",
                                              fontSize: 16.sp,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      )),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showModal() {
    Future<void> future = showModalBottomSheet<void>(
      backgroundColor: Colors.white,
      isDismissible: true,
      isScrollControlled: false,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      context: context,
      builder: (context) => StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return GestureDetector(
          onTap: () {
            setState(() {
              image = sl<SharedPreferences>().getString('image');
              fullName = sl<SharedPreferences>().getString('fullname');
              emailAddress = sl<SharedPreferences>().getString('email');
              userName = sl<SharedPreferences>().getString('username');
              List<String>? jsonPhones =
                  sl<SharedPreferences>().getStringList("phones");
              phones = jsonPhones!
                  .map((item) => Phone.fromJson(json.decode(item)))
                  .toList();
            });
          },
          child: EditInformationDelivery(
            image: image!,
            userName: userName!,
            fullName: fullName!,
            emailAdress: emailAddress!,
          ),
        );
      }),
    );
    future.then((void value) => closeModal(value));
  }

  void closeModal(void value) {
    setState(() {
      image = sl<SharedPreferences>().getString('image');
      fullName = sl<SharedPreferences>().getString('fullname');
      emailAddress = sl<SharedPreferences>().getString('email');
      userName = sl<SharedPreferences>().getString('username');
      List<String>? jsonPhones =
          sl<SharedPreferences>().getStringList("phones");
      phones =
          jsonPhones!.map((item) => Phone.fromJson(json.decode(item))).toList();
    });
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 4, size.height - 80, size.width / 2, size.height - 40);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height,
        size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
