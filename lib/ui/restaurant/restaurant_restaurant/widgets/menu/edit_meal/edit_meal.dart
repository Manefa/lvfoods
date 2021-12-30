import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_product_details/domain/entities/get_product_details.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/menu/edit_meal/edit_meal_display.dart';

class EditMeal extends StatefulWidget {
  final GetProductDetails getProductDetails;
  final String code;
  const EditMeal({Key? key, required this.getProductDetails, required this.code}) : super(key: key);

  @override
  _EditMealState createState() => _EditMealState();
}

class _EditMealState extends State<EditMeal> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(416, 897),
        orientation: Orientation.portrait);
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          "Edit Meal",
          style: TextStyle(
              color: Colors.black,
              fontFamily: "Milliard",
              fontSize: 20.sp,
              fontWeight: FontWeight.w400
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: EditMealDisplay(getProductDetails: widget.getProductDetails, code: widget.code,),
      backgroundColor: Colors.white,
    );
  }
}
