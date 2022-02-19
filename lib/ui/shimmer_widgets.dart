// ignore_for_file: empty_constructor_bodies

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  const ShimmerWidget.rectangular({
    required this.height,
    required this.width,
  }):this.shapeBorder =  const RoundedRectangleBorder();

  const ShimmerWidget.circular({
    required this.height,
    required this.width,
    this.shapeBorder= const CircleBorder(),
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child:  Container(
            width:width,
            height: height,
            decoration: ShapeDecoration(
              color: Color.fromRGBO(246, 246, 246, 1),
              shape: shapeBorder,
            ),
        ),
        baseColor: Color.fromRGBO(246, 246, 246, 1),
        highlightColor:Colors.grey[300]!,

    );
  }
}