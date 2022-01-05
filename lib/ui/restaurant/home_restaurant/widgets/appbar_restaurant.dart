import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/core/platform/lv_icons.dart';
import 'package:ivfoods_mobile_app/features/get_user/bloc/get_user.dart';
import 'package:ivfoods_mobile_app/features/get_user/domain/entities/phone.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_for_owner_restaurant/bloc/get_all_for_owner_restaurant.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBarRestaurant extends StatefulWidget {
  const AppBarRestaurant({Key? key,}) : super(key: key);
  @override
  _AppBarRestaurantState createState() => _AppBarRestaurantState();
}

class _AppBarRestaurantState extends State<AppBarRestaurant> {
  GetUserBloc _getUserBloc = sl<GetUserBloc>();
  GetAllForOwnerRestaurantBloc _getAllForOwnerRestaurantBloc = sl<GetAllForOwnerRestaurantBloc>();

  String? name = "";
  String? image = "";
  String? userName = "";
  String? order = "";

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(416, 897),
        orientation: Orientation.portrait);
    _getUserBloc.add(GetUser());
    var nameRestaurant = sl<SharedPreferences>().getString('RESTAURANT_NAME');
    _getAllForOwnerRestaurantBloc.add(StartGetAllForOwnerRestaurant(name: nameRestaurant!));

    return MultiBlocProvider(
      providers: [
        BlocProvider<GetUserBloc>(
          create: (_) => _getUserBloc,
        ),

        BlocProvider<GetAllForOwnerRestaurantBloc>(
          create: (_) => _getAllForOwnerRestaurantBloc,
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<GetUserBloc, GetUserState>(
            listener: (context, state) {
              if(state is LoadedUser){
                name = state.userMaster.users!.username.toString();
                image = state.userMaster.users!.picture.toString();
                userName =  state.userMaster.users!.username.toString();
                sl<SharedPreferences>().setString("username", state.userMaster.users!.username.toString());
                sl<SharedPreferences>().setString("fullname", state.userMaster.users!.fullName.toString());
                sl<SharedPreferences>().setString("image", state.userMaster.users!.picture.toString());
                sl<SharedPreferences>().setString("email", state.userMaster.users!.email.toString());
                List<Phone>? phones = List.empty();
                phones = state.userMaster.users!.phones;
                sl<SharedPreferences>().setStringList("phones", phones!.map((item) => json.encode(item.toJson())).toList());
              }
            },
          ),

          BlocListener<GetAllForOwnerRestaurantBloc, GetAllForOwnerRestaurantState>(
            listener: (context, state) {
              if(state is GetAllForOwnerRestaurantLoaded){
                print("ffffffffffffffffffffffffffffffffffffffffffff");
                order = state.getAllForOwnerRestaurant.orders!.length.toString();
                print(order.toString());
              }
            },
          ),
        ],

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
                  SizedBox(height: 28.h,),
                  Container(
                    width: 344.w,
                    height: 42.h,
                    child: (image == "") ? Align(
                        alignment: Alignment.centerRight,
                        child:Container(
                          height: 42.r,
                          width: 42.r,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              color: Colors.white,
                              width:2.r,
                            ),
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                          child: Center(
                            child: Text(
                              name == "" ? " " : name![0],
                              style: TextStyle(
                                fontFamily: "Milliard",
                                fontSize: 35.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        )
                    ):Align(
                        alignment: Alignment.centerRight,
                        child:Container(
                          height: 42.r,
                          width: 42.r,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(image!),
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(
                              color: Colors.white,
                              width:2.r,
                            ),
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                        )
                    ),
                  ),
                  //Notification
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 344.w,
                      height: 36.h,
                      child: Align(
                        alignment: Alignment.centerRight,

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
                          "Welcome back,",
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
                          name!,
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
                              "Order Total",
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
                                      "Restaurateur Person",
                                      style: TextStyle(
                                        fontFamily: "Milliard",
                                        fontSize: 18.sp,
                                        color: Color(0XFFFFCBCB),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Text(
                                order.toString(),
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
                  )

                ],
              ),
            );
          }
        ),
      ),
    );
  }
}


