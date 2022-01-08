import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/core/platform/lv_icons_resto.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_categories/domain/entities/category.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_one_restaurant_and_populate_products/domain/entities/get_one_restaurant_and_populate_products.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/menu/menu_restau_detail/pages/menu_restau_details.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

class MenuRestaurantDisplay extends StatefulWidget {
  final GetOneRestaurantAndPopulateProducts getOneRestaurantAndPopulateProducts;
  final List<Category> categories;
  const MenuRestaurantDisplay({Key? key, required this.getOneRestaurantAndPopulateProducts, required this.categories}) : super(key: key);

  @override
  _MenuRestaurantDisplayState createState() => _MenuRestaurantDisplayState();
}

class _MenuRestaurantDisplayState extends State<MenuRestaurantDisplay> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final double _heightCard=169.h;
    final double _widthtCard=157.w;
    //List<RestaurantHomeDisplayModel> items = [items1, items2, items1, items2,items1, items2, items1, items2,items1, items2, items1, items2];
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(416, 897),
        orientation: Orientation.portrait);
    var nameRestaurant = sl<SharedPreferences>().getString('RESTAURANT_NAME');
    var adressRestaurant = sl<SharedPreferences>().getString('RESTAURANT_ADDRESS');
    return widget.getOneRestaurantAndPopulateProducts.restaurant!.products!.isNotEmpty ? SingleChildScrollView(
      child: Column(
        children: [
          GridView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: width / (height *0.63)
              ),
              itemCount: widget.getOneRestaurantAndPopulateProducts.restaurant!.products!.length,
              itemBuilder: (BuildContext context, int index){
                return InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          RestauMenuDetails(
                            code: widget.getOneRestaurantAndPopulateProducts.restaurant!.products![index].code,
                            name: nameRestaurant,
                            address: adressRestaurant,
                            categories: widget.categories,
                          )),
                    );
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
                              image: DecorationImage(
                                image: NetworkImage(widget.getOneRestaurantAndPopulateProducts.restaurant!.products![index].picture!),
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
                                            widget.getOneRestaurantAndPopulateProducts.restaurant!.products![index].name!,
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
                                        widget.getOneRestaurantAndPopulateProducts.restaurant!.products![index].description!,
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
                                          widget.getOneRestaurantAndPopulateProducts.restaurant!.products![index].discount==null ?SizedBox( width: 23.w,):Text(
                                            widget.getOneRestaurantAndPopulateProducts.restaurant!.products![index].discount.toString()+" %",
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
                                                    child: Text(
                                                      widget.getOneRestaurantAndPopulateProducts.restaurant!.products![index].note!.toStringAsFixed(2),
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
                                        widget.getOneRestaurantAndPopulateProducts.restaurant!.products![index].price.toString()+" FCFA",
                                        style: TextStyle(
                                            fontSize: 12.sp,
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
          SizedBox(height: 100.h,)
        ],
      ),
    ):Container(
      height: 130.w,
      width: 130,
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
}