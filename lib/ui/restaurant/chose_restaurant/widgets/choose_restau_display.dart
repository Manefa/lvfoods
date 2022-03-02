import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/core/platform/loading_widget.dart';
import 'package:ivfoods_mobile_app/core/platform/icon/lv_icons_resto.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_restaurants_for_current_user/bloc/get_all_restaurants_for_current_user.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_city/bloc/get_city.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_city/domain/entities/city.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_country/bloc/get_country.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_country/domain/entities/country.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_styles/bloc/get_styles.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_styles/domain/entities/style.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';
import 'package:ivfoods_mobile_app/ui/navigator_restaurant_page.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/menu/add_restau/add_restau.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ChooseRestaurantDisplay extends StatefulWidget {
  const ChooseRestaurantDisplay({Key? key}) : super(key: key);

  @override
  _ChooseRestaurantDisplayState createState() => _ChooseRestaurantDisplayState();
}

class _ChooseRestaurantDisplayState extends State<ChooseRestaurantDisplay> {
  GetAllRestaurantsForCurrentUserBloc _getAllRestaurantsForCurrentUserBloc = sl<GetAllRestaurantsForCurrentUserBloc>();
  GetStylesBloc _getStylesBloc = sl<GetStylesBloc>();
  GetCountryBloc _getCountryBloc = sl<GetCountryBloc>();
  GetCityBloc _getCityBoc = sl<GetCityBloc>();
  //var styles;
  List<Style> styles = List.empty();
  List<Country> countries = List.empty();
  List<City> cities = List.empty();

  @override
  Widget build(BuildContext context) {
    _getAllRestaurantsForCurrentUserBloc.add(StartGetAllRestaurantsForCurrentUser());
    _getStylesBloc.add(StartGetStyles());
    _getCountryBloc.add(StartGetCountry());
    _getCityBoc.add(StartGetCity());
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetAllRestaurantsForCurrentUserBloc>(
          create: (_) => _getAllRestaurantsForCurrentUserBloc,
        ),

        BlocProvider<GetStylesBloc>(
          create: (_) => _getStylesBloc,
        ),

        BlocProvider<GetCountryBloc>(
          create: (_) => _getCountryBloc,
        ),

        BlocProvider<GetCityBloc>(
          create: (_) => _getCityBoc,
        ),

      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<GetAllRestaurantsForCurrentUserBloc, GetAllRestaurantsForCurrentUserState>(
            listener: (context, state){
              if(state is GetAllRestaurantsForCurrentUserLoading){

              }

              if(state is GetAllRestaurantsForCurrentUserLoaded){

              }

              if(state is GetAllRestaurantsForCurrentUserError){

              }
            },
          ),

          BlocListener<GetStylesBloc, GetStylesState>(
            listener: (context, state){
              if(state is GetStylesLoading){

              }

              if(state is GetStylesLoaded){
                styles = state.getStylesMaster.styles!;
              }

              if(state is GetStylesError){

              }
            },
          ),

          BlocListener<GetCountryBloc, GetCountryState>(
            listener: (context, state){
              if(state is GetCountryLoading){

              }

              if(state is GetCountryLoaded){
                countries = state.countryMaster.countries!;
              }

              if(state is GetCountryError){

              }
            },
          ),

          BlocListener<GetCityBloc, GetCityState>(
            listener: (context, state){
              if(state is GetCityLoading){

              }

              if(state is GetCityLoaded){
                cities = state.cityMaster.cities!;
              }

              if(state is GetCityError){

              }
            },
          ),
        ],
        child: SingleChildScrollView(
          child: BlocBuilder(
            bloc: _getAllRestaurantsForCurrentUserBloc,
            builder: (context, GetAllRestaurantsForCurrentUserState state){

              if(state is GetAllRestaurantsForCurrentUserLoading){
                return LoadingWidget();
              }

            if(state is GetAllRestaurantsForCurrentUserLoaded){
              return state.getAllRestaurantsForCurrentUser.restaurants!.isNotEmpty ? Container(
                color: Colors.white,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.getAllRestaurantsForCurrentUser.restaurants!.length + 1,
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index){
                      return (index != state.getAllRestaurantsForCurrentUser.restaurants!.length) ? Padding(
                        padding: EdgeInsets.only(top: 10.r, left: 10.r, right: 10.r),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: (){
                                sl<SharedPreferences>().setString("RESTAURANT_NAME", state.getAllRestaurantsForCurrentUser.restaurants![index].name.toString());
                                sl<SharedPreferences>().setString("RESTAURANT_ADDRESS", state.getAllRestaurantsForCurrentUser.restaurants![index].address.toString());
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => NavigatorRestaurantPage(restaurantName: state.getAllRestaurantsForCurrentUser.restaurants![index].name!, address: state.getAllRestaurantsForCurrentUser.restaurants![index].address,)),
                                );
                              },
                              child: Container(
                                  height: 110.h,
                                  width: 344.w,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.r),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.36),
                                            spreadRadius: -3,
                                            blurRadius: 10,
                                            offset: Offset(0, 5)
                                        )
                                      ]
                                  ),
                                  child:Center(
                                    child: Container(
                                      width: 300.w,
                                      height: 50.h,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 77.h,
                                                  width: 76.r,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(8.r),
                                                    image:  DecorationImage(
                                                      image: NetworkImage(state.getAllRestaurantsForCurrentUser.restaurants![index].profilePicture!),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 20.w,),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      state.getAllRestaurantsForCurrentUser.restaurants![index].name!,
                                                      style: TextStyle(
                                                        fontFamily: "Milliard",
                                                        fontSize:19.sp,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                    ),
                                                    SizedBox(height: 4.h,),


                                                    state.getAllRestaurantsForCurrentUser.restaurants![index].status == "enable" ?
                                                    Container(
                                                      width: 110.w,
                                                      height: 21.h,
                                                      decoration: BoxDecoration(
                                                          color: Color.fromRGBO(104, 211, 137, 1),
                                                          borderRadius: BorderRadius.circular(6.r)
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          AppLocalizations.of(context)!.translate("restaurantOpen"),
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                              fontSize: 12.sp,
                                                              fontFamily: "Milliard",
                                                              color: Colors.white
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                        :Container(
                                                      width: 110.w,
                                                      height: 21.h,
                                                      decoration: BoxDecoration(
                                                          color: Color.fromRGBO(251, 182, 52, 1),
                                                          borderRadius: BorderRadius.circular(6.r)
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          AppLocalizations.of(context)!.translate("restaurantClose"),
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                              fontFamily: "Milliard",
                                                              fontSize: 12.sp,
                                                              color: Colors.white
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios_rounded ,
                                            color: Color(0XFFBCBCBC),
                                            size: 15.sp,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                              ),
                            ),
                            SizedBox(height: 32.h,)
                          ],
                        ),
                      ) : Padding(
                        padding: EdgeInsets.only(left: 10.r, right: 10.r, top: 5.r, bottom: 15.r),
                        child: Center(
                            child: InkWell(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => AddRestaurant(styles: styles, countries: countries, cities: cities,)),
                                ).then((_) => setState(() {}));
                              },
                              child: Container(
                                height: 110.h,
                                width: 344.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.36),
                                          spreadRadius: -3,
                                          blurRadius: 10,
                                          offset: Offset(0, 5)
                                      )
                                    ]
                                ),
                                child: Center(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        LvIconsResto.restaurant,
                                        color: Color.fromRGBO(188, 44, 61, 1),
                                        size: 30.sp,
                                      ),
                                      SizedBox(width: 10,),
                                      Text(
                                        AppLocalizations.of(context)!.translate("addARestaurant"),
                                        style: TextStyle(
                                          fontFamily: "Milliard",
                                          fontSize:20.sp,
                                          color: Color.fromRGBO(188, 44, 61, 1),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            )
                        ),
                      );
                    }
                ),
              ) : Container(
                child: Column(
                  children: [
                    SizedBox(height: 100.h,),
                    Text(
                      AppLocalizations.of(context)!.translate("noRestaurantAvailable"),
                      style: TextStyle(
                        fontFamily: "Milliard",
                        fontSize:18.sp,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    SizedBox(height: 31.h,),
                    Center(
                        child: InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AddRestaurant(styles: styles, countries: countries, cities: cities,)),
                            );
                          },
                          child: Container(
                            height: 110.h,
                            width: 344.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.36),
                                      spreadRadius: -3,
                                      blurRadius: 10,
                                      offset: Offset(0, 5)
                                  )
                                ]
                            ),
                            child: Center(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    LvIconsResto.restaurant,
                                    color: Color.fromRGBO(188, 44, 61, 1),
                                    size: 30.sp,
                                  ),
                                  SizedBox(width: 10,),
                                  Text(
                                    AppLocalizations.of(context)!.translate("addARestaurant"),
                                    style: TextStyle(
                                      fontFamily: "Milliard",
                                      fontSize:20.sp,
                                      color: Color.fromRGBO(188, 44, 61, 1),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                    ),
                  ],
                ),
              );
            }

              return Container(
                child: Center(child: Text(
                    AppLocalizations.of(context)!.translate("noCase"),
                )),
              );
            },
          ),
        ),
      ),
    );
  }
}
