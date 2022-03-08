import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class DeliveryIllustration extends StatelessWidget {
  const DeliveryIllustration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 144.h,
      width: 344.w,
      decoration: BoxDecoration(
        color: Color.fromRGBO(218, 235, 247, 1),
        borderRadius: BorderRadius.circular(10.r)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            //height: 63.h,
            width: 111.w,
            //color: Colors.green,
            child: Text(
              //TODO Translate this text
              'Decouvrez\nles livraisons\ndisponibles',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: "Milliard",
                fontSize: 20.sp,
              ),
            ) ,
          ),
          SizedBox(width: 10.w,),
          Container(
            height: 110.h,
            width: 176.w,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/delivery_home_illustration.png"),
                )
            ),
          )
        ],
      ),
    );
  }
}
