import 'package:flutter/material.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_categories/domain/entities/category.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/menu/menu_restau_detail/widgets/menu_restau_details_display.dart';
class RestauMenuDetails extends StatefulWidget {
  final String? code;
  final String? name;
  final String? address;
  final List<Category>? categories;
  const RestauMenuDetails({Key? key, this.code, this.name, this.address, this.categories}) : super(key: key);

  @override
  _RestauMenuDetailsState createState() => _RestauMenuDetailsState();
}

class _RestauMenuDetailsState extends State<RestauMenuDetails> {
  @override
  Widget build(BuildContext context) {
    return RestauMenuDetailsDisplay(code: widget.code!, name: widget.name!, address: widget.address!, categories: widget.categories!,);
  }
}
