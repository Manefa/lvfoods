import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:ivfoods_mobile_app/constants.dart';
import 'package:ivfoods_mobile_app/core/platform/loading_widget.dart';
import 'package:ivfoods_mobile_app/core/platform/icon/lv_icons_resto.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_categories/bloc/get_categories.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_categories/domain/entities/category.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_one_restaurant_and_populate_products/bloc/get_one_restaurant_and_populate_products.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/menu/menu_restau_detail/pages/menu_restau_details.dart';


class RestaurantHomeDisplay extends StatefulWidget {
  final String restaurantName;
  final String address;
  const RestaurantHomeDisplay({Key? key, required this.restaurantName, required this.address}) : super(key: key);
  @override
  _RestaurantHomeDisplayState createState() => _RestaurantHomeDisplayState();
}

class _RestaurantHomeDisplayState extends State<RestaurantHomeDisplay> {
  GetOneRestaurantAndPopulateProductsBloc _getOneRestaurantAndPopulateProductsBloc = sl<GetOneRestaurantAndPopulateProductsBloc>();
  GetCategoriesBloc _getCategoriesBloc = sl<GetCategoriesBloc>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<Category> categories = [];
    Future<void> _refresh() async {
      _getOneRestaurantAndPopulateProductsBloc.add(StartGetOneRestaurantAndPopulateProducts(restaurantName: widget.restaurantName));
      _getCategoriesBloc.add(StartGetCategories());
    }
    _getOneRestaurantAndPopulateProductsBloc.add(StartGetOneRestaurantAndPopulateProducts(restaurantName: widget.restaurantName));
    _getCategoriesBloc.add(StartGetCategories());
    return SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<GetOneRestaurantAndPopulateProductsBloc>(
              create: (_) => _getOneRestaurantAndPopulateProductsBloc,
            ),

            BlocProvider<GetCategoriesBloc>(
              create: (_) => _getCategoriesBloc,
            ),
          ],
          child: MultiBlocListener(
            listeners: [
              BlocListener<GetCategoriesBloc, GetCategoriesState>(
                listener: (context, state) {
                  if(state is GetCategoriesLoaded){
                    categories = state.getCategoriesMaster.categories!;
                  }
                },
              ),
            ],
            child: BlocBuilder(
              bloc: _getOneRestaurantAndPopulateProductsBloc,
              builder: (context, state){
                if(state is GetOneRestaurantAndPopulateProductsLoading){
                  return LoadingWidget();
                }
                if(state is GetOneRestaurantAndPopulateProductsLoaded){
                  return state.getOneRestaurantAndPopulateProducts.restaurant!.products!.isNotEmpty ? SingleChildScrollView(
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                            childAspectRatio: width / (height *0.63)
                        ),
                        itemCount: state.getOneRestaurantAndPopulateProducts.restaurant!.products!.length,
                        itemBuilder: (BuildContext context, int index){
                          return InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => RestauMenuDetails(code: state.getOneRestaurantAndPopulateProducts.restaurant!.products![index].code, name: widget.restaurantName, address: widget.address, categories: categories,),),
                              ).then((_) => setState(() {}));
                            },
                            child: SizedBox(
                              width: 157.w,
                              height: 169.h,
                              child: Card(
                                child: Column(
                                  children: [
                                    //Image
                                    Container(
                                      height: 106.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(5.r),
                                          topLeft: Radius.circular(5.r),
                                        ),
                                        image:  DecorationImage(
                                          image: NetworkImage(state.getOneRestaurantAndPopulateProducts.restaurant!.products![index].picture!),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10.h,),
                                    Row(
                                      children: [
                                        SizedBox(width: 9.w,),
                                        Container(
                                          height: 100.h,
                                          width: 137.w,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              //Name
                                              Expanded(
                                                  child: Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: Text(
                                                      state.getOneRestaurantAndPopulateProducts.restaurant!.products![index].name!,
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 15.sp,
                                                          fontFamily: "Milliard",
                                                          fontWeight: FontWeight.w500
                                                      ),
                                                    ),
                                                  )),
                                              //SubName
                                              SizedBox(height: 10.h,),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  state.getOneRestaurantAndPopulateProducts.restaurant!.products![index].description!,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontFamily: "Milliard",
                                                      fontWeight: FontWeight.w500,
                                                      color: Color.fromRGBO(148, 148, 148, 1)
                                                  ),
                                                ),
                                              ),
                                              //OtherDetail
                                              SizedBox(height: 10.h,),
                                              IntrinsicHeight(
                                                child: Row(
                                                  children: [
                                                    //Reduction
                                                    state.getOneRestaurantAndPopulateProducts.restaurant!.products![index].discount == null ? SizedBox( width: 23.w,):Text(
                                                      state.getOneRestaurantAndPopulateProducts.restaurant!.products![index].discount.toString()+"%",
                                                      style: TextStyle(
                                                          fontSize: 12.sp,
                                                          fontFamily: "Milliard",
                                                          fontWeight: FontWeight.w500,
                                                          color: Color.fromRGBO(242, 176, 50, 1)
                                                      ),
                                                    ),
                                                    VerticalDivider(),
                                                    //Note
                                                    Container(
                                                      child: Center(
                                                        child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            Align(
                                                              alignment: Alignment.centerLeft,
                                                              child: Icon(
                                                                LvIconsResto.star,
                                                                color:Color.fromRGBO(251, 182, 52, 1),
                                                                size: 12.sp,
                                                              ),
                                                            ),
                                                            SizedBox(width: 3.2.w,),
                                                            Align(
                                                              alignment: Alignment.centerRight,
                                                              child: Text  (
                                                                state.getOneRestaurantAndPopulateProducts.restaurant!.products![index].note!.toStringAsFixed(2),
                                                                style: TextStyle(
                                                                    fontSize: 12.sp,
                                                                    fontFamily: "Milliard",
                                                                    fontWeight: FontWeight.w500,
                                                                    color:Color.fromRGBO(251, 182, 52, 1)
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 10.h,),
                                              //Price
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  state.getOneRestaurantAndPopulateProducts.restaurant!.products![index].price.toString()+" FCFA",
                                                  style: TextStyle(
                                                      fontSize: 14.sp,
                                                      fontFamily: "Milliard",
                                                      fontWeight: FontWeight.w600,
                                                      color: Color.fromRGBO(183, 43, 59, 1)
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                    ),
                  ) : Container(
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("images/empty2.png"),
                          )
                        ),
                      ),
                    ),
                  );
                }
                if(state is GetOneRestaurantAndPopulateProductsError){
                  Container(
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
}