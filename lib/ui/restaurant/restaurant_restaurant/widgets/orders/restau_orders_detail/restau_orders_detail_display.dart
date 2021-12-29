import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/orders/restau_orders_detail/alert_dialogue_order_detail.dart';
enum Level {
  toDelivery, InProgress, carryOut
}

class OrderRestauModel{
  final String name;
  final String image;
  final String reference;
  final String free;
  final int price;
  final String date;
  final double remise;
  final int qtt;
  final Level level;
  final double totalpaid;

  OrderRestauModel({required this.date, required this.name,required this.image, required this.reference, required this.free, required this.price, required this.qtt, required this.totalpaid, required this.level,required this.remise});
}
OrderRestauModel ord1 = new OrderRestauModel(
    name: "Tarte à la viande",
    image: "https://images.pexels.com/photos/3026808/pexels-photo-3026808.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    reference: "#001158486",
    free: "Free",
    date: "2 June At 9:15 PM",
    price: 2500,
    qtt: 2,
    totalpaid: 5000,
    level: Level.InProgress,
    remise: 350
);

class RestauOrderDetailsDisplay extends StatefulWidget {
  const RestauOrderDetailsDisplay({Key? key}) : super(key: key);

  @override
  _RestauOrderDetailsDisplayState createState() => _RestauOrderDetailsDisplayState();
}

class _RestauOrderDetailsDisplayState extends State<RestauOrderDetailsDisplay> {
  @override
  Widget build(BuildContext context) {
    List<OrderRestauModel> items = [ord1];
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(416, 897),
        orientation: Orientation.portrait);
    return SingleChildScrollView(
      child:Center(
        child: Column(
          children: [
            //Reference & Status
            Container(
              height: 27.h,
              width: 344.w,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ord1.reference,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Milliard",
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w200
                    ),

                  ),
                  Container(
                    child: Row(
                      children: [
                        ord1.level==Level.InProgress?
                        Row(
                          children: [
                            Container(
                              height: 20.r,
                              width: 20.r,
                              decoration: BoxDecoration(
                                  color: Color(0XFFFFF7E9),
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.access_time_rounded,
                                  size: 16.sp,
                                  color: Color(0XFFFBB634),
                                ),
                              ),
                            ),
                            SizedBox(width: 7.w,),
                            Text(
                              'Pending',
                              style: TextStyle(
                                color: Color(0XFFFBB634),
                                fontFamily: "Milliard",
                                fontSize: 16.sp,
                              ),
                            )
                          ],

                        ):
                        ord1.level==Level.carryOut?
                        Row(
                          children: [
                            Container(
                              height: 20.r,
                              width: 20.r,
                              decoration: BoxDecoration(
                                  color: Color(0XFFFFF7E9),
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.check,
                                  size: 16.sp,
                                  color: Color(0XFFFBB634),
                                ),
                              ),
                            ),
                            SizedBox(width: 7.w,),
                            Text(
                              'Delivered',
                              style: TextStyle(
                                color: Color(0XFF68D389),
                                fontFamily: "Milliard",
                                fontSize: 16.sp,
                              ),


                            )
                          ],

                        )
                            :
                        Row(
                          children: [
                            Container(
                              height: 20.r,
                              width: 20.r,
                              decoration: BoxDecoration(
                                  color: Color(0XFFFFF7E9),
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.clean_hands_sharp,
                                  size: 16.sp,
                                  color: Color(0XFFA27AFA),
                                ),
                              ),
                            ),
                            SizedBox(width: 7.w,),
                            Text(
                              'Ready',
                              style: TextStyle(
                                color: Color(0XFFA27AFA),
                                fontFamily: "Milliard",
                                fontSize: 16.sp,
                              ),


                            )
                          ],

                        )


                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 5.h,),
            //Date
            Container(
              width: 344.w,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  ord1.date,
                  style: TextStyle(
                    color: Color.fromRGBO(148, 148, 148, 1),
                    fontFamily: "Milliard",
                    fontSize: 15.sp,
                  ),
                ),
              ),
            ),
            SizedBox(height: 11.h,),
            //Divider
            Container(width: 344.w, child: Divider()),
            SizedBox(height: 23.h,),
            //Image Price Name Qtt
            Container(
              width: 344.w,
              child: Row(
                children: [
                  //Image
                  Container(
                    height: 63.r,
                    width: 63.r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.red,
                      /*image: DecorationImage(
                          image: NetworkImage(ord1.image),
                          fit:BoxFit.cover
                      ),*/
                    ),
                  ),

                  SizedBox(width: 12.w,),
                  //Name price and Qtt
                  Container(
                    width: 275.w,
                    child: Column(
                      children: [
                        //Name
                        Container(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                ord1.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: "Milliard",
                                  fontSize: 18.sp,
                                ),
                              ),
                            )
                        ),
                        SizedBox(height: 4.h,),
                        //Price and Qtt
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //Qtt
                              Text(
                                "X "+ord1.qtt.toString(),
                                style: TextStyle(
                                    fontFamily: "Milliard",
                                    fontSize: 14.sp,
                                    color: Color.fromRGBO(148, 148, 148, 1)
                                ),
                              ),
                              //Price
                              Text(
                                ord1.price.toString()+" Fcfa",
                                style: TextStyle(
                                  fontFamily: "Milliard",
                                  fontSize: 18.sp,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),

            ),
            SizedBox(height: 35.h,),
            //Divider
            Container(width: 344.w, child: Divider()),
            SizedBox(height: 21.h,),
            //Price Details
            //Item Total
            Container(
              width: 344.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Item Total",
                    style: TextStyle(
                        fontFamily: "Milliard",
                        fontSize: 16.sp,
                        color: Color.fromRGBO(148, 148, 148, 1)
                    ),
                  ),

                  Text(
                    ord1.totalpaid.toString()+" Fcfa",
                    style: TextStyle(
                      fontFamily: "Milliard",
                      fontSize: 18.sp,
                    ),
                  ),

                ],
              ),

            ),
            SizedBox(height: 13.h,),
            //Remise
            Container(
              width: 344.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Remise",
                    style: TextStyle(
                        fontFamily: "Milliard",
                        fontSize: 16.sp,
                        color: Color.fromRGBO(148, 148, 148, 1)
                    ),
                  ),
                  Text(
                    "-"+ord1.remise.toString()+' Fcfa',
                    style: TextStyle(
                      fontFamily: "Milliard",
                      fontSize: 18.sp,
                    ),
                  ),

                ],
              ),

            ),
            SizedBox(height: 13.h,),

            //Delivery free
            Container(
              width: 344.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Delivery free",
                    style: TextStyle(
                        fontFamily: "Milliard",
                        fontSize: 16.sp,
                        color: Color.fromRGBO(104, 211, 137, 1)
                    ),
                  ),
                  Text(
                    ord1.free,
                    style: TextStyle(
                        fontFamily: "Milliard",
                        fontSize: 18.sp,
                        color: Color.fromRGBO(104, 211, 137, 1)
                    ),
                  ),

                ],
              ),

            ),
            SizedBox(height: 21.h,),
            Container(width: 344.w, child: Divider()),
            SizedBox(height: 16.h,),
            //Total Pay
            Container(
              width: 344.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Total paid",
                    style: TextStyle(
                      fontFamily: "Milliard",
                      fontSize: 27.sp,
                    ),
                  ),
                  Text(
                    ord1.totalpaid.toString()+" Fcfa",
                    style: TextStyle(
                      fontFamily: "Milliard",
                      fontSize: 27.sp,
                    ),
                  ),

                ],
              ),

            ),

            SizedBox(height: 260.h,),

            InkWell(
              onTap: (){
                showDialog(
                    context: context,
                    builder:(BuildContext context){
                      return AlertDialogueOrderReady();
                    }
                );
              },
              child: Container(
                width: 344.w,
                height: 45.h,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0XFF68D389),),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    "Commande prête",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w300,
                      fontFamily: "Milliard",
                      color: Color(0XFF68D389),
                    ),
                  ),
                ),
              ),
            )



          ],
        ),
      ),
    );
  }
}
