import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/constants.dart';
import 'package:ivfoods_mobile_app/core/platform/icon/lv_icons.dart';
import 'package:ivfoods_mobile_app/core/platform/status_bar_manager.dart';
import 'package:ivfoods_mobile_app/features/get_user/bloc/get_user.dart';
import 'package:ivfoods_mobile_app/features/get_user/domain/entities/phone.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';
import 'package:ivfoods_mobile_app/ui/delivery/notification_delivery/page/notification_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Appbar extends StatefulWidget {
  final int? ordersTotal;
  const Appbar({Key? key, this.ordersTotal,}) : super(key: key);
  @override
  _AppbarState createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  GetUserBloc _getUserBloc = sl<GetUserBloc>();

  @override
  Widget build(BuildContext context) {
    String name=" ";
    _getUserBloc.add(GetUser());

    return BlocProvider<GetUserBloc>(
      create: (_) => _getUserBloc,
      child: BlocListener(
        bloc: _getUserBloc,
        listener: (context, state){
          if(state is LoadedUser){
            name = state.userMaster.users!.username.toString();
             sl<SharedPreferences>().setString("username", state.userMaster.users!.username.toString());
             sl<SharedPreferences>().setString("fullname", state.userMaster.users!.fullName.toString());
             sl<SharedPreferences>().setString("image", state.userMaster.users!.picture.toString());
             sl<SharedPreferences>().setString("email", state.userMaster.users!.email.toString());
             List<Phone>? phones = List.empty();
             phones = state.userMaster.users!.phones;
             sl<SharedPreferences>().setStringList("phones", phones!.map((item) => json.encode(item.toJson())).toList());
          }
        },
        child: BlocBuilder(
          bloc: _getUserBloc,
          builder: (context, state){
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/app_bar_image.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 50.h,),
                  //Notification
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 344.w,
                      height: 36.h,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NotificationPage(),
                                ));
                          },
                          child: Container(
                            width: 31.r,
                            height: 36.r,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                    height: 32.r,
                                    width: 27.r,
                                    child: Icon(
                                      LvIcons.bell,
                                      size: 40.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    height: 17.r,
                                    width: 17.r,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "0",
                                        style: TextStyle(
                                            fontFamily: "Milliard",
                                            color: kPrimaryColor,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h,),
                  //Welcome Back
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 344.w,
                      height: 36.h,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppLocalizations.of(context)!.translate("welcomeBack"),
                          style: TextStyle(
                              fontSize: 30.sp,
                              fontFamily: "Milliard",
                              color: Color(0XFFF9C8CE),
                              fontWeight: FontWeight.w300
                          ),
                        ),
                      ),
                    ),
                  ),
                  //Angela
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 344.w,
                      height: 22.h,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          name,
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontFamily: "Milliard",
                              color: Colors.white,
                              fontWeight: FontWeight.w300
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 344.w,
                    height: 55.h,
                    child: Column(
                      children: [
                        //Order Total
                        Container(
                          height: 20.h,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              AppLocalizations.of(context)!.translate("orderTotal"),
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontFamily: "Milliard",
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 35.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 23.h,
                                child: Row(
                                  children: [
                                    Icon(
                                      LvIcons.delivery_boy,
                                      color: Color(0XFFFFCBCB),
                                      size: 20.sp,
                                    ),
                                    SizedBox(width: 6.w,),
                                    //Deliver Person
                                    Text(
                                      AppLocalizations.of(context)!.translate("deliveryPerson"),
                                      style: TextStyle(
                                        fontFamily: "Milliard",
                                        fontSize: 18.sp,
                                        color: Color(0XFFFFCBCB),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                widget.ordersTotal.toString(),
                                style: TextStyle(
                                  fontSize: 26.sp,
                                  fontFamily: "Milliard",
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
