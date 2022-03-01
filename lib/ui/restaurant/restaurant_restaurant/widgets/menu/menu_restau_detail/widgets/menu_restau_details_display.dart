import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/constants.dart';
import 'package:ivfoods_mobile_app/core/platform/loading_widget.dart';
import 'package:ivfoods_mobile_app/core/platform/icon/lv_icons.dart';
import 'package:ivfoods_mobile_app/core/platform/icon/lv_icons_resto.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_categories/domain/entities/category.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_product_details/bloc/get_product_details.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_product_details/domain/entities/categorys.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';
import 'package:ivfoods_mobile_app/ui/delivery/delivery/widgets/sub_widgets/custom_tab_view_order.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/menu/menu_restau_detail/widgets/infos_menu_display.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/menu/menu_restau_detail/widgets/rating_menu_display.dart';

class RestauMenuDetailsDisplay extends StatefulWidget {
  final String code;
  final String name;
  final String address;
  final List<Category> categories;
  const RestauMenuDetailsDisplay({Key? key, required this.code, required this.name, required this.address, required this.categories}) : super(key: key);

  @override
  _RestauMenuDetailsDisplayState createState() => _RestauMenuDetailsDisplayState();
}

class _RestauMenuDetailsDisplayState extends State<RestauMenuDetailsDisplay> {
  GetProductDetailsBloc _getProductDetailsBloc = sl<GetProductDetailsBloc>();

  List<String> data = [];
  int initPosition = 0;

  @override
  void initState() {
    _getProductDetailsBloc.add(StartGetProductDetails(code: widget.code));
    super.initState();
  }



  // @override
  // void didChangeDependencies() {
  //   _getProductDetailsBloc.add(StartGetProductDetails(code: widget.code));
  //   super.didChangeDependencies();
  // }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    data = [AppLocalizations.of(context)!.translate("Information"), AppLocalizations.of(context)!.translate("rating"),];
    Future<void> _refresh() async {
      _getProductDetailsBloc.add(StartGetProductDetails(code: widget.code));
    }
    var size = MediaQuery.of(context).size;
    return BlocProvider<GetProductDetailsBloc>(
      create: (_) => _getProductDetailsBloc,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: BlocBuilder(
              bloc: _getProductDetailsBloc,
              builder: (context, state){
                if(state is GetProductDetailsLoading){
                  return Center(child: LoadingWidget());
                }

                if(state is GetProductDetailsLoaded){
                  List<Widget> widgets = [InfosMenuDisplay( getProductDetails: state.getProductDetails, addres: widget.address, categories: widget.categories,), RatingMenuDisplay(getProductDetails: state.getProductDetails,)];
                  return SafeArea(
                        child: RefreshIndicator(
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
                                          image: NetworkImage(state.getProductDetails.product!.picture!),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  //Details
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
                                      child: Column(
                                        children: [
                                          SizedBox(height: 23.h,),
                                          Center(
                                            child: Container(
                                              width: 344.w,
                                              child: Column(
                                                children: [
                                                  //Name & Price
                                                  Row(
                                                    crossAxisAlignment:CrossAxisAlignment.start,
                                                    children: [
                                                      //Name
                                                      Expanded(
                                                        child: Container(
                                                          width:219.w,
                                                          child:Text(
                                                            state.getProductDetails.product!.name!,
                                                            style: TextStyle(
                                                                fontSize: 18.sp,
                                                                fontFamily: "Milliard",
                                                                fontWeight: FontWeight.w500
                                                            ),
                                                          ) ,
                                                        ),

                                                      ),

                                                      //Price
                                                      Container(
                                                        width: 123.w,
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.end,

                                                              children: [
                                                                Text(
                                                                  state.getProductDetails.product!.price.toString()+" fcfa",
                                                                  style: TextStyle(
                                                                      fontSize: 17.sp,
                                                                      color: Color.fromRGBO(188, 44, 61, 1),
                                                                      fontFamily: "Milliard",
                                                                      fontWeight: FontWeight.w700
                                                                  ),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(height: 7.h,),
                                                  //Localisation
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Icon(
                                                        LvIcons.pin,
                                                        size: 14.sp,
                                                        color:Color.fromRGBO(148, 148, 148,1),
                                                      ),
                                                      SizedBox(width: 7.w,),
                                                      //localisationName
                                                      Container(
                                                        width: 230.w,
                                                        child: Text(
                                                          widget.address+" - "+widget.name,
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
                                                  SizedBox(height: 12.h,),
                                                  //Note & Disponibilité
                                                  Container(
                                                    height: 23.h,
                                                    width: 344.w,
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Container(
                                                          child: Row(
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              //Note
                                                              Icon(
                                                                LvIconsResto.star,
                                                                color:Color.fromRGBO(251, 182, 52, 1),
                                                                size: 14.sp,
                                                              ),
                                                              SizedBox(width: 4.w,),
                                                              Text(
                                                                state.getProductDetails.product!.note.toString(),
                                                                style: TextStyle(
                                                                  fontSize: 14.sp,
                                                                  fontFamily: "Milliard",
                                                                  fontWeight: FontWeight.w200,
                                                                ),
                                                              ),
                                                              SizedBox(width: 20.w,),
                                                              //Moder food
                                                              Icon(
                                                                LvIconsResto.morder,
                                                                color:Color.fromRGBO(72, 132, 238, 1),
                                                                size: 14.sp,
                                                              ),
                                                              SizedBox(width: 10.w,),
                                                              SizedBox(
                                                                width: 152.w,
                                                                child: Text(
                                                                  state.getProductDetails.product!.categories!.isEmpty ? " " : removeLastCharacter(getCategories(state.getProductDetails.product!.categories!).toString()),
                                                                  overflow: TextOverflow.ellipsis,
                                                                  style: TextStyle(
                                                                    fontSize: 14.sp,
                                                                    color: Colors.grey,
                                                                    fontFamily: "Milliard",
                                                                    fontWeight: FontWeight.w200,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        //Statut
                                                        state.getProductDetails.product!.status == "available" ?
                                                        Container(
                                                          width: 98.w,
                                                          height: 23.h,
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(5.r),
                                                              color: Color.fromRGBO(222, 249, 231, 1)
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              AppLocalizations.of(context)!.translate("enable"),
                                                              style: TextStyle(
                                                                  fontSize: 12.sp,
                                                                  fontFamily: "Milliard",
                                                                  color: Color.fromRGBO(104, 211, 137, 1),
                                                                  fontWeight: FontWeight.w500
                                                              ),

                                                            ),
                                                          ),
                                                        ) : state.getProductDetails.product!.status == "unavailable" ? Container(
                                                          width: 98.w,
                                                          height: 23.h,
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(5.r),
                                                              color: Color(0XFFE6BABF)
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              AppLocalizations.of(context)!.translate("disable"),
                                                              style: TextStyle(
                                                                  fontSize: 12.sp,
                                                                  fontFamily: "Milliard",
                                                                  color: Color(0XFFBC2C3D),
                                                                  fontWeight: FontWeight.w500
                                                              ),

                                                            ),
                                                          ),
                                                        ) : Container(
                                                          width: 98.w,
                                                          height: 23.h,
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(5.r),
                                                              color: Color(0XFFFFF7E9)
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              state.getProductDetails.product!.status.toString(),
                                                              style: TextStyle(
                                                                  fontSize: 14.sp,
                                                                  fontFamily: "Milliard",
                                                                  color: Color(0XFFFFF7E9),
                                                                  fontWeight: FontWeight.w500
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 31.5.h),
                                          Expanded(
                                            child: CustomTabView(
                                              initPosition: initPosition,
                                              itemCount: data.length,
                                              tabBuilder: (context, index) => Tab(text: data[index]),
                                              pageBuilder: (context, index) => widgets[index],
                                              onPositionChange: (index){
                                                initPosition = index;
                                              },
                                              onScroll: (position) => print('$position'),
                                            ),
                                          ),

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

                if(state is GetProductDetailsError){
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
    );
  }

  String getCategories(List<Categorys> list) {
    String categories ="";
    list.forEach((element) {
      categories = categories + element.name! + ", ";
    });

    return categories;
  }

  String removeLastCharacter(String str) {
    String result="";
    if ((str != null) && (str.length > 0)) {
      result = str.substring(0, str.length - 2);
    }

    return result;
  }
}
