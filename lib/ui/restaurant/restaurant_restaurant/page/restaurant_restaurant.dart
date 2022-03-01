import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/constants.dart';
import 'package:ivfoods_mobile_app/core/platform/loading_widget.dart';
import 'package:ivfoods_mobile_app/core/platform/icon/lv_icons.dart';
import 'package:ivfoods_mobile_app/core/platform/icon/lv_icons_resto.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_restaurant/bloc/get_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_restaurant/domain/entities/product.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/infos/infos_restaurant.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/menu/menu_restaurant.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/orders/orders_restaurants.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/orders/sub_widgets/order_restaurant_custombar.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/times/times_restaurant.dart';
import 'package:shared_preferences/shared_preferences.dart';


class RestaurantResto extends StatefulWidget {
  const RestaurantResto({Key? key}) : super(key: key);

  @override
  _RestaurantRestoState createState() => _RestaurantRestoState();
}

class _RestaurantRestoState extends State<RestaurantResto> {
  GetRestaurantBloc _getRestaurantBloc = sl<GetRestaurantBloc>();
  List<String> data = [];
  int initPosition = 0;
  String? nameRestaurant = sl<SharedPreferences>().getString('RESTAURANT_NAME');
  String? addressRestaurant = sl<SharedPreferences>().getString('RESTAURANT_ADDRESS');

  @override
  void initState() {
    _getRestaurantBloc.add(StartGetRestaurant(name: nameRestaurant!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = [AppLocalizations.of(context)!.translate("menu"), AppLocalizations.of(context)!.translate("order"), AppLocalizations.of(context)!.translate("Information"), AppLocalizations.of(context)!.translate("times"),];
    List<Widget> widget = [MenuRestaurant(), OrdersRestaurant(), InfosRestaurant(name: nameRestaurant!,), TimesRestaurant()];
    double width = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size;
    Future<void> _refresh() async {
      _getRestaurantBloc.add(StartGetRestaurant(name: nameRestaurant!));
    }

    return BlocProvider<GetRestaurantBloc>(
      create: (_) => _getRestaurantBloc,
      child: Scaffold(
        //backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: BlocBuilder(
              bloc: _getRestaurantBloc,
              builder: (context, state){
                if(state is GetRestaurantLoading){
                  return LoadingWidget();
                }

                if(state is GetRestaurantLoaded){
                  return RefreshIndicator(
                    onRefresh: _refresh,
                    color: kPrimaryColor,
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: Container(
                        height: size.height,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 0.h,
                              child: Container(
                                height: 247.h,
                                width: width,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(state.getRestaurant.restaurant!.coverPicture!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            //Info
                            Positioned(
                                top: 218.h,
                                child: Container(
                                  height: 678.h,
                                  width: width,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(30.r),
                                        topLeft:  Radius.circular(30.r),
                                      )
                                  ),

                                  child:Column(
                                    children: [
                                      SizedBox(height: 23.h,),
                                      Center(
                                        child: Container(
                                          height: 77.h,
                                          width: 344.w,
                                          child: Row(
                                            children: [
                                              //ImageRestau
                                              Container(
                                                height:76.h ,
                                                width:77.w ,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: NetworkImage(state.getRestaurant.restaurant!.profilePicture!.toString()),
                                                    fit: BoxFit.cover,
                                                  ),
                                                  borderRadius: BorderRadius.circular(10.r),
                                                ),
                                              ),
                                              SizedBox(width: 17.w,),
                                              Expanded(
                                                  child: Container(
                                                    width: 248.w,
                                                    child: Column(
                                                      children: [
                                                        //RestauName
                                                        Container(
                                                          height: 24.h,
                                                          width: 245.w,
                                                          child: Text(
                                                            state.getRestaurant.restaurant!.name!,
                                                            maxLines: 1,
                                                            overflow: TextOverflow.ellipsis,
                                                            style: TextStyle(
                                                                fontSize: 20.sp,
                                                                fontFamily: "Milliard",
                                                                fontWeight: FontWeight.w500
                                                            ),
                                                          ),
                                                        ),
                                                        //Localisation
                                                        SizedBox(height: 3.h,),
                                                        Container(
                                                          height: 19.h,
                                                          width: 245.w,
                                                          child: Row(
                                                            children: [
                                                              Icon(
                                                                LvIcons.pin,
                                                                size: 16.sp,
                                                                color:Color.fromRGBO(148, 148, 148,1),
                                                              ),
                                                              SizedBox(width: 7.w,),
                                                              //localisationName
                                                              SizedBox(
                                                                width: 220.w,
                                                                child: Text(
                                                                  state.getRestaurant.restaurant!.address!,
                                                                  maxLines: 1,
                                                                  overflow: TextOverflow.ellipsis,
                                                                  style: TextStyle(
                                                                    color:Color.fromRGBO(148, 148, 148,1),
                                                                    fontSize: 14.sp,
                                                                    fontFamily: "Milliard",
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        //OtherInfos
                                                        SizedBox(height: 4.h,),
                                                        Container(
                                                          height: 23.h,
                                                          width: 249.w,
                                                          child: IntrinsicHeight(
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              children: [
                                                                //First Info
                                                                Container(
                                                                  child: Row(
                                                                    children: [
                                                                      //Note
                                                                      Icon(
                                                                        LvIconsResto.star,
                                                                        color:Color.fromRGBO(251, 182, 52, 1),
                                                                        size: 14.sp,
                                                                      ),
                                                                      SizedBox(width: 4.w,),
                                                                      Text(
                                                                        state.getRestaurant.restaurant!.note!.toStringAsFixed(1),
                                                                        style: TextStyle(
                                                                          fontSize: 14.sp,
                                                                          fontFamily: "Milliard",
                                                                          fontWeight: FontWeight.w200,
                                                                        ),
                                                                      ),
                                                                      //VerticaleDevider
                                                                      VerticalDivider(),
                                                                      //ProductNumber
                                                                      Icon(
                                                                        LvIconsResto.product,
                                                                        size: 14.sp,
                                                                        color: Color.fromRGBO(70, 128, 232,1),
                                                                      ),
                                                                      SizedBox(width: 5.8.w,),
                                                                      Text(
                                                                        " "+getProductQtt(state.getRestaurant.restaurant!.products)+" "+AppLocalizations.of(context)!.translate("product"),
                                                                        style: TextStyle(
                                                                            fontSize: 14.sp,
                                                                            fontFamily: "Milliard",
                                                                            color:Color.fromRGBO(148, 148, 148, 1)
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                //Statut
                                                                state.getRestaurant.restaurant!.status == "enable" ?Container(
                                                                  width: 56.w,
                                                                  height: 23.h,
                                                                  decoration: BoxDecoration(
                                                                      color: Color.fromRGBO(222, 249, 231, 1),
                                                                      borderRadius: BorderRadius.circular(5.r)
                                                                  ),
                                                                  child: Center(
                                                                    child: Text(
                                                                      AppLocalizations.of(context)!.translate("open"),
                                                                      style: TextStyle(
                                                                          fontSize: 12.sp,
                                                                          fontFamily: "Milliard",
                                                                          fontWeight: FontWeight.w300,
                                                                          color:Color.fromRGBO(104, 211, 137, 1)
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ):Container(
                                                                  width: 56.w,
                                                                  height: 23.h,
                                                                  decoration: BoxDecoration(
                                                                      color: Color(0XFFE6BABF),
                                                                      borderRadius: BorderRadius.circular(5.r)
                                                                  ),
                                                                  child: Center(
                                                                    child: Text(
                                                                      AppLocalizations.of(context)!.translate("close"),
                                                                      style: TextStyle(
                                                                          fontSize: 12.sp,
                                                                          fontFamily: "Milliard",
                                                                          fontWeight: FontWeight.w300,
                                                                          color: Color(0XFFBC2C3D)
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: CustomTabView(
                                          initPosition: initPosition,
                                          itemCount: data.length,
                                          tabBuilder: (context, index) => Tab(text: data[index]),
                                          pageBuilder: (context, index) => widget[index],
                                          onPositionChange: (index){
                                            initPosition = index;
                                          },
                                          onScroll: (position) => print('$position'),
                                        ),
                                      ),

                                    ],
                                  ) ,
                                ))
                          ],
                        ),
                      ),
                    ),
                  );
                }

                if(state is GetRestaurantError){
                  return Container(
                    height: 130.w,
                    width: 130,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/error1.png"),
                            )
                        ),
                      ),
                    ),
                  );
                }

                return Container(
                  height: 130.w,
                  width: 130,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("images/error2.png"),
                          )
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  String getProductQtt(List<Product>? products) {
    int qtt = 0;
    products!.forEach((element) {
      qtt++;
    });
    return qtt.toString();
  }
}
