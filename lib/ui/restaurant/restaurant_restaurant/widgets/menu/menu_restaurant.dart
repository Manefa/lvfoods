import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/core/platform/loading_widget.dart';
import 'package:ivfoods_mobile_app/core/platform/icon/lv_icons_resto.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_categories/bloc/get_categories.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_categories/domain/entities/category.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_one_restaurant_and_populate_products/bloc/get_one_restaurant_and_populate_products.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/menu/add_meal/add_meal.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/menu/menu_restaurant_display.dart';
import 'package:ivfoods_mobile_app/ui/shimmer_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuRestaurant extends StatefulWidget {
  const MenuRestaurant({Key? key}) : super(key: key);

  @override
  _MenuRestaurantState createState() => _MenuRestaurantState();
}

class _MenuRestaurantState extends State<MenuRestaurant> {
  GetOneRestaurantAndPopulateProductsBloc _getOneRestaurantAndPopulateProductsBloc = sl<GetOneRestaurantAndPopulateProductsBloc>();
  GetCategoriesBloc _getCategories = sl<GetCategoriesBloc>();

  String? nameRestaurant;

  @override
  Widget build(BuildContext context) {
    List<Category> categories = [];
    nameRestaurant = sl<SharedPreferences>().getString('RESTAURANT_NAME');
    _getOneRestaurantAndPopulateProductsBloc.add(StartGetOneRestaurantAndPopulateProducts(restaurantName: nameRestaurant!));
    _getCategories.add(StartGetCategories());

    return MultiBlocProvider(
      providers: [
        BlocProvider<GetOneRestaurantAndPopulateProductsBloc>(
            create: (_) => _getOneRestaurantAndPopulateProductsBloc,
        ),

        BlocProvider<GetCategoriesBloc>(
          create: (_) => _getCategories,
        ),
      ],
      child: Container(
        child: Column(
          children: [
            SizedBox(height: 18.5.h,),
            //AddButton
            BlocBuilder(
              bloc: _getCategories,
              builder: (context, state){
                if(state is GetCategoriesLoading){
                  return buildButtonShimmer();
                }
                if(state is GetCategoriesLoaded){
                  categories = state.getCategoriesMaster.categories!;
                  return Center(
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddMeal(restaurantName: nameRestaurant!, categories: categories,)),
                        ).then((value) => setState(() {

                        }));
                      },
                      child: Container(
                        width: 344.w,
                        height: 35.h,
                        child: DottedBorder(
                          color: Color.fromRGBO(209, 113, 124, 1),
                          strokeWidth: 0.2,
                          dashPattern: [10,6],
                          child: Center(
                              child:Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    LvIconsResto.add,
                                    color: Color.fromRGBO(188, 44, 61, 1),
                                    size: 16.sp,
                                  ),
                                  SizedBox(width: 14.w,),
                                  Text(
                                    AppLocalizations.of(context)!.translate("addMeal"),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Color.fromRGBO(188, 44, 61, 1),
                                        fontSize: 20.sp,
                                        fontFamily: "Milliard",
                                        fontWeight: FontWeight.w200
                                    ),
                                  )
                                ],
                              )
                          ),
                        ),
                      ),
                    ),
                  );
                }

                return Container();
              },
            ),
            SizedBox(height: 19.h,),
            //Liste
            BlocBuilder(
              bloc: _getOneRestaurantAndPopulateProductsBloc,
              builder: (context, state){

                if(state is GetOneRestaurantAndPopulateProductsLoading){
                  return LoadingWidget();
                }

                if(state is GetOneRestaurantAndPopulateProductsLoaded){
                  //print(categories);
                  return Expanded(
                    child: Center(
                      child: Container(
                          width: 344.w,
                          child: MenuRestaurantDisplay(getOneRestaurantAndPopulateProducts: state.getOneRestaurantAndPopulateProducts, categories: categories)),
                    ),
                  );
                }

                if(state is GetOneRestaurantAndPopulateProductsError){
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
          ],
        ),
      ),
    );
  }

  Widget buildButtonShimmer(){
    return ListTile(
      title: Align(
        alignment: Alignment.center,
        child: ShimmerWidget.rectangular(
          height: 35.h,
          width: 344.w,
        ),
      ),
    );
  }
}