import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_categories/domain/entities/category.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/menu/add_meal/add_meal_display.dart';


class AddMeal extends StatefulWidget {
  final List<Category>? categories;
  final String? restaurantName;
  const AddMeal({Key? key, this.categories, this.restaurantName}) : super(key: key);

  @override
  _AddMealState createState() => _AddMealState();
}

class _AddMealState extends State<AddMeal> {
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
          "Add Meal",
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
      body: AddMealDisplay(categories: widget.categories!, restaurantName: widget.restaurantName!,),
      backgroundColor: Colors.white,
    );
  }
}
