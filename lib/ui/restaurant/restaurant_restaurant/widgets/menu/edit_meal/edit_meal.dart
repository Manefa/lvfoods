import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_categories/domain/entities/category.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_product_details/domain/entities/get_product_details.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/menu/edit_meal/edit_meal_display.dart';

class EditMeal extends StatefulWidget {
  final GetProductDetails getProductDetails;
  final String code;
  final List<Category> categories;
  const EditMeal({Key? key, required this.getProductDetails, required this.code, required this.categories}) : super(key: key);

  @override
  _EditMealState createState() => _EditMealState();
}

class _EditMealState extends State<EditMeal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          AppLocalizations.of(context)!.translate("editMeal"),
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
      body: EditMealDisplay(getProductDetails: widget.getProductDetails, code: widget.code, categories: widget.categories,),
      backgroundColor: Colors.white,
    );
  }
}
