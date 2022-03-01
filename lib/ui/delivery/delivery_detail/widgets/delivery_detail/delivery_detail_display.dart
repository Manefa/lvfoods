import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/order.dart';

class DeliveryDetailDisplay extends StatefulWidget {
  final List<Order> orders;

  const DeliveryDetailDisplay({Key? key, required this.orders}) : super(key: key);
  @override
  _DeliveryDetailDisplayState createState() => _DeliveryDetailDisplayState();
}

class _DeliveryDetailDisplayState extends State<DeliveryDetailDisplay> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: widget.orders.length,
          clipBehavior: Clip.none,
          itemBuilder: (BuildContext context, int index){
            return Container(
              child: Column(
                children: [
                  SizedBox(height: 16,),
                  Row(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(width: 35.w,),
                          Container(
                            height: 62.h,
                            width: 63.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: NetworkImage(widget.orders[index].item!.picture!),
                                  fit: BoxFit.cover,
                                )
                            ),
                          ),
                          SizedBox(width: 15.w,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.orders[index].item!.name!,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Milliard",
                                    fontSize: 20.sp,
                                    color: Color(0XFF2C2627)
                                ),
                              ),
                              SizedBox(height: 8.h,),
                              Row(
                                children: <Widget>[
                                  Text(
                              (widget.orders[index].total!.toDouble() / widget.orders[index].quantity!.toDouble()).toString(),
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontFamily: "Milliard",
                                        color: Color(0XFF949494)
                                    ),
                                  ),
                                  Text(
                                    "  X"+widget.orders[index].quantity.toString(),
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontFamily: "Milliard",
                                        color: Color(0XFF949494)
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      Padding(
                        padding: const EdgeInsets.only(right: 35.0),
                        child: Text(
                          widget.orders[index].total.toString()+" Fcfa",
                          style: TextStyle(
                            fontFamily: "Milliard",
                            fontSize: 15.sp,
                            color: Color(0XFFBC2C3D),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 16,),
                  Padding(
                    padding: const EdgeInsets.only(left: 31, right: 35),
                    child: Container(
                      height: 1,
                      width: size.width,
                      color: Color(0XFFDFDEDD),
                    ),
                  ),
                ],
              ),
            );
          }
        ),
      );
  }
}
