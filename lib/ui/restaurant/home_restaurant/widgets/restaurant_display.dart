import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:ivfoods_mobile_app/core/platform/loading_widget.dart';
import 'package:ivfoods_mobile_app/core/platform/lv_icons_resto.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_one_restaurant_and_populate_products/bloc/get_one_restaurant_and_populate_products.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/menu/menu_restau_detail/pages/menu_restau_details.dart';
class RestaurantHomeDisplayModel{
  final String name;
  final String image;
  final String subname;
  final double price;
  final double note;
  final double ? percent;

  RestaurantHomeDisplayModel({required this.name,required this.image ,required this.note,this.percent,required this.price,required this.subname});
}

RestaurantHomeDisplayModel items1= new RestaurantHomeDisplayModel(
    name: "Eru & Watafufu Eru & Watafufu Eru & Watafufu Eru & Watafufu ",
    image:'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80',
    subname: "Poulet braisé",
    note: 3.1,
    //percent: -12,
    price: 2000
);

RestaurantHomeDisplayModel items2= new RestaurantHomeDisplayModel(
    name: "Sauce Gombo",
    image:'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80',
    subname: "Poulet braisé",
    note: 3.1,
    percent: 12,
    price: 2000
);


class RestaurantHomeDisplay extends StatefulWidget {
  final String restaurantName;
  final String address;
  const RestaurantHomeDisplay({Key? key, required this.restaurantName, required this.address}) : super(key: key);
  @override
  _RestaurantHomeDisplayState createState() => _RestaurantHomeDisplayState();
}

class _RestaurantHomeDisplayState extends State<RestaurantHomeDisplay> {
  GetOneRestaurantAndPopulateProductsBloc _getOneRestaurantAndPopulateProductsBloc = sl<GetOneRestaurantAndPopulateProductsBloc>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    //List<RestaurantHomeDisplayModel> items = [items1, items2, items1, items2,items1, items2, items1, items2,items1, items2, items1, items2];
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(416, 897),
        orientation: Orientation.portrait);
    _getOneRestaurantAndPopulateProductsBloc.add(StartGetOneRestaurantAndPopulateProducts(restaurantName: widget.restaurantName));
    return BlocProvider<GetOneRestaurantAndPopulateProductsBloc>(
      create: (_) => _getOneRestaurantAndPopulateProductsBloc,
      child: BlocBuilder(
        bloc: _getOneRestaurantAndPopulateProductsBloc,
        builder: (context, state){
          if(state is GetOneRestaurantAndPopulateProductsLoading){
            return LoadingWidget();
          }
          if(state is GetOneRestaurantAndPopulateProductsLoaded){
            return SingleChildScrollView(
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: width / (height *0.6)
                  ),
                  itemCount: state.getOneRestaurantAndPopulateProducts.restaurant!.products!.length,
                  itemBuilder: (BuildContext context, int index){
                    return InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RestauMenuDetails(code: state.getOneRestaurantAndPopulateProducts.restaurant!.products![index].code, name: widget.restaurantName, address: widget.address,)),
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
                                    height: 80.h,
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
                                                    fontSize: 16.sp,
                                                    fontFamily: "Milliard",
                                                    fontWeight: FontWeight.w500
                                                ),
                                              ),
                                            )),
                                        //SubName
                                        SizedBox(height: 10.h,),
                                        Expanded(
                                            child: Align(
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
                                            )),
                                        //OtherDetail
                                        SizedBox(height: 10.h,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            //Price
                                            Text(
                                              state.getOneRestaurantAndPopulateProducts.restaurant!.products![index].price.toString()+" FCFA",
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontFamily: "Milliard",
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromRGBO(183, 43, 59, 1)
                                              ),
                                            ),
                                            //Reduction
                                            state.getOneRestaurantAndPopulateProducts.restaurant!.products![index].discount == null ?SizedBox( width: 23.w,):Text(
                                              state.getOneRestaurantAndPopulateProducts.restaurant!.products![index].discount.toString()+"%",
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontFamily: "Milliard",
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromRGBO(242, 176, 50, 1)
                                              ),
                                            ),
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
                                                        state.getOneRestaurantAndPopulateProducts.restaurant!.products![index].note.toString(),
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
            );
          }
          if(state is GetOneRestaurantAndPopulateProductsError){
            Container(
              child: Center(child: Text("Error")),
            );
          }

          return Container(
            child: Center(child: Text("Aucun Cas")),
          );
        },
      ),
    );
  }
}