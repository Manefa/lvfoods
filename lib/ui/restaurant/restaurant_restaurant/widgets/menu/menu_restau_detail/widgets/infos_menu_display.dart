import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/core/platform/lv_icons_resto.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_product_details/domain/entities/category.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_product_details/domain/entities/get_product_details.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/menu/add_meal/add_meal.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/menu/edit_meal/edit_meal.dart';
class InfosMenuDisplay extends StatefulWidget {
  final GetProductDetails getProductDetails;
  final String addres;
  const InfosMenuDisplay({Key? key, required this.getProductDetails, required this.addres}) : super(key: key);

  @override
  _InfosMenuDisplayState createState() => _InfosMenuDisplayState();
}

class _InfosMenuDisplayState extends State<InfosMenuDisplay> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(416, 897),
        orientation: Orientation.portrait);
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 18.h,),
            //Remove and Edit Button
            Container(
              width: 344.w,
              height: 29.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 122.w,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.1.w,
                        ),
                        borderRadius: BorderRadius.circular(6.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white12,
                            offset: Offset(0, 5),
                            spreadRadius: -17,
                            blurRadius: 20,
                          ),
                        ]
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            LvIconsResto.remove,
                            color: Color.fromRGBO(188, 44, 61,1),
                            size: 12.sp,
                          ),
                          SizedBox(width: 5.7.w,),
                          Text(
                              "Remove product",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromRGBO(188, 44, 61, 1),
                                fontFamily: "Milliard",
                                fontSize: 13.sp,
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditMeal(getProductDetails: widget.getProductDetails, code: widget.getProductDetails.product!.code!,)),
                      ).then((_) => setState(() {}));
                    },
                    child: Container(
                      width: 87.w,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 0.1.w,
                          ),
                          borderRadius: BorderRadius.circular(6.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white12,
                              offset: Offset(0, 5),
                              spreadRadius: -17,
                              blurRadius: 20,
                            ),
                          ]
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              LvIconsResto.edit,
                              color: Color.fromRGBO(148, 148, 148,1),
                              size: 12.sp,
                            ),
                            SizedBox(width: 5.7.w,),
                            Text(
                                "Edit Infos",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromRGBO(148, 148, 148, 1),
                                  fontFamily: "Milliard",
                                  fontSize: 13.sp,
                                )
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 21.h,),
            //Name meal
            Container(
              width: 344.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                      'Name meal',
                      style: TextStyle(
                        color: Color.fromRGBO(148, 148, 148, 1),
                        fontFamily: "Milliard",
                        fontSize: 16.sp,
                      )

                  ),
                  Expanded(
                    child: Container(
                      width: 178.w,
                      child: Text(
                          widget.getProductDetails.product!.name!,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontFamily: "Milliard",
                            fontSize: 16.sp,
                          )

                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 21.h,),

            //Price
            Container(
              width: 344.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                      'Price',
                      style: TextStyle(
                        color: Color.fromRGBO(148, 148, 148, 1),
                        fontFamily: "Milliard",
                        fontSize: 16.sp,
                      )

                  ),
                  Text(
                      widget.getProductDetails.product!.price.toString()+" fcfa",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontFamily: "Milliard",
                        fontSize: 16.sp,
                      )

                  )


                ],
              ),
            ),
            SizedBox(height: 21.h,),

            //Category
            Container(
              width: 344.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                      'Category',
                      style: TextStyle(
                        color: Color.fromRGBO(148, 148, 148, 1),
                        fontFamily: "Milliard",
                        fontSize: 16.sp,
                      )

                  ),
                  Text(
                      removeLastCharacter(getCategories(widget.getProductDetails.product!.categories!).toString()),
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontFamily: "Milliard",
                        fontSize: 16.sp,
                      )
                  )
                ],
              ),
            ),
            SizedBox(height: 21.h,),

            //Status
            Container(
              width: 344.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                      'Status',
                      style: TextStyle(
                        color: Color.fromRGBO(148, 148, 148, 1),
                        fontFamily: "Milliard",
                        fontSize: 16.sp,
                      )

                  ),
                  Text(
                      widget.getProductDetails.product!.status!,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontFamily: "Milliard",
                        fontSize: 16.sp,
                      )
                  )
                ],
              ),
            ),
            SizedBox(height: 21.h,),

            //Localisation
            Container(
              width: 344.w,
              //NameRestaurant
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment:CrossAxisAlignment.center,
                children: [
                  Text(
                    "Localisation",
                    style: TextStyle(
                      color: Color.fromRGBO(148, 148, 148, 1),
                      fontFamily: "Milliard",
                      fontSize: 16.sp,
                    ),
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child:Row(
                        children: [
                          Text(
                            widget.addres,
                            style: TextStyle(
                              color: Color.fromRGBO(188, 44, 61, 1),
                              fontFamily: "Milliard",
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(width: 6.w,),
                          Icon(
                            Icons.my_location_rounded,
                            color: Color.fromRGBO(188, 44, 61, 1),
                            size:16.sp,
                          ),

                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
            //Description
            SizedBox(height: 21.h,),
            Container(
              width: 344.w,
              //NameRestaurant
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Description",
                      style: TextStyle(
                        color: Color.fromRGBO(148, 148, 148, 1),
                        fontFamily: "Milliard",
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 6.h,),
                  Text(
                    widget.getProductDetails.product!.description!,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Milliard",
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 19.h,),
                ],
              ),
            ),
            SizedBox(height: 52.h,),
          ],
        ),
      ),
    );
  }

  String getCategories(List<Category> list) {
    String categories ="";
    list.forEach((element) {
      categories = categories + element.name! + ",";
    });

    return categories;
  }

  String removeLastCharacter(String str) {
    String result="";
    if ((str != null) && (str.length > 0)) {
      result = str.substring(0, str.length - 1);
    }

    return result;
  }

}
