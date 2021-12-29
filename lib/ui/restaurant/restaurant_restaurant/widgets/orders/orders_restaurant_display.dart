import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/core/platform/lv_icons.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/orders/restau_orders_detail/restau_orders_detail.dart';

enum Level {
  toDelivery, InProgress, carryOut
}

class OrderAllModel{
  final String name;
  final String image;
  final String location;
  final String hours;
  final int price;
  final int qtt;
  final bool state;
  final Level level;

  OrderAllModel({required this.name,required this.image, required this.location, required this.hours, required this.price, required this.qtt, required this.state, required this.level});
}

OrderAllModel items1 = new OrderAllModel(
  name: "Taro Sauce Jaune",
  image: "https://images.pexels.com/photos/3026808/pexels-photo-3026808.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  location: "Byem-assi. Yaoundé",
  hours: "3",
  price: 2000,
  qtt: 2,
  state: true,
  level: Level.carryOut,
);

OrderAllModel items2 = new OrderAllModel(
  name: "Shawarma",
  image: "https://images.pexels.com/photos/2878741/pexels-photo-2878741.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  location: "Byem-assi. Yaoundé",
  hours: "2",
  price: 1000,
  qtt: 2,
  state: false,
  level: Level.InProgress,
);

OrderAllModel items3 = new OrderAllModel(
  name: "Poulet rôtie, Pamplemousse 1L - Poulet rôtie, Pamplemousse 1L - Poulet rôtie, Pamplemousse 1L",
  image: "https://images.pexels.com/photos/2097090/pexels-photo-2097090.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
  location: "Byem-assi. Yaoundé",
  hours: "8",
  price: 12000,
  qtt: 2,
  state: true,
  level: Level.toDelivery,
);

OrderAllModel items4 = new OrderAllModel(
  name: "Taro Sauce Jaune - Taro Sauce Jaune-Taro Sauce Jaune - Taro Sauce Jaune",
  image: "https://images.pexels.com/photos/2641886/pexels-photo-2641886.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  location: "Byem-assi. Yaoundé",
  hours: "3",
  price: 7000,
  qtt: 2,
  state: false,
  level: Level.toDelivery,
);

OrderAllModel items5 = new OrderAllModel(
  name: "Eru couscous manioc",
  image: "https://images.pexels.com/photos/776945/pexels-photo-776945.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  location: "Byem-assi. Yaoundé",
  hours: "3",
  price: 10000,
  qtt: 2,
  state: true,
  level: Level.carryOut,
);

OrderAllModel items6 = new OrderAllModel(
  name: "Pizza Roma supplément de fromage",
  image: "https://images.pexels.com/photos/1579926/pexels-photo-1579926.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  location: "Byem-assi. Yaoundé",
  hours: "3",
  price: 12000,
  qtt: 2,
  state: false,
  level: Level.InProgress,
);


class OrderRestaurantDisplay extends StatefulWidget {
  const OrderRestaurantDisplay({Key? key}) : super(key: key);

  @override
  _OrderRestaurantDisplayState createState() => _OrderRestaurantDisplayState();
}

class _OrderRestaurantDisplayState extends State<OrderRestaurantDisplay> {
  @override
  Widget build(BuildContext context) {
    List<OrderAllModel> items = [items2, items3,items1,items5,items5];
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(416, 897),
        orientation: Orientation.portrait);
    return SingleChildScrollView(
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          clipBehavior: Clip.none,
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index){
            return Container(
              //color: Colors.withe,
              child: Column(
                children: [
                  SizedBox(height: 16.h,),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RestauOrderDetails()),
                      );
                    },
                    child: Container(
                      width: 340.w,
                      //color: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          //ImageContainer
                          Container(
                            height: 66.h,
                            width: 63.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(items[index].image),
                                  fit:BoxFit.cover
                              ),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          SizedBox(width: 8.w,),
                          //InformationCOntainer
                          Expanded(
                              child:Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  //Name
                                  Container(
                                    child: Text(
                                      items[index].name,
                                      style: TextStyle(
                                        fontFamily: "Milliard",
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),),
                                  SizedBox(height: 3.h,),
                                  //Location
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(
                                          LvIcons.pin,
                                          size: 15.sp,
                                          color: Color.fromRGBO(148, 148, 148, 1),
                                        ),
                                        SizedBox(width: 8.8.w,),
                                        Text(
                                          items[index].location,
                                          style: TextStyle(
                                            color: Color.fromRGBO(148, 148, 148, 1),
                                            fontFamily: "Milliard",
                                            fontSize: 15.sp,
                                          ),
                                        )

                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 3.h,),
                                  //Timer
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(
                                          LvIcons.ic_timer_24px,
                                          size: 15.sp,
                                          color: Color.fromRGBO(148, 148, 148, 1),
                                        ),
                                        SizedBox(width: 8.8.w,),
                                        Text(
                                          items[index].hours +" Hours Ago",
                                          style: TextStyle(
                                            color: Color.fromRGBO(148, 148, 148, 1),
                                            fontFamily: "Milliard",
                                            fontSize: 15.sp,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  //PlatNumber Statut,and Price
                                  SizedBox(height: 3.h,),
                                  Container(
                                    child: IntrinsicHeight(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          //PlatNumber Statut
                                          Container(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  LvIcons.dish,
                                                  size: 15.sp,
                                                  color:  Color(0XFF4884EE),
                                                ),
                                                SizedBox(width: 3.w,),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 2.0),
                                                  child: Text(
                                                    "X "+items[index].qtt.toString(),
                                                    style: TextStyle(
                                                      color:  Color(0XFF4884EE),
                                                      fontFamily: "Milliard",
                                                      fontSize: 15.sp,
                                                    ),
                                                  ),
                                                ),
                                                VerticalDivider(),
                                                items[index].level == Level.carryOut ?
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
                                                      size: 10.sp,
                                                      color: Color(0XFFFBB634),
                                                    ),
                                                  ),
                                                ):(items[index].level == Level.toDelivery ?
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
                                                      size: 10.sp,
                                                      color: Color(0XFFA27AFA),
                                                    ),
                                                  ),
                                                ):Container(
                                                  height: 20.r,
                                                  width: 20.r,
                                                  decoration: BoxDecoration(
                                                      color: Color(0XFFFFF7E9),
                                                      borderRadius: BorderRadius.circular(8)
                                                  ),
                                                  child: Center(
                                                    child: Icon(
                                                      Icons.access_time_rounded,
                                                      size: 10.sp,
                                                      color: Color(0XFFFBB634),
                                                    ),
                                                  ),
                                                )),
                                                SizedBox(width: 5.w,),
                                                items[index].level == Level.carryOut ?
                                                Text(
                                                  "Delivered",
                                                  style: TextStyle(
                                                    color: Color(0XFF68D389),
                                                    fontSize: 15.sp,
                                                    fontFamily: "Milliard",
                                                  ),
                                                ) : (
                                                    items[index].level == Level.toDelivery ?
                                                    Text(
                                                      "Ready",
                                                      style: TextStyle(
                                                        color: Color(0XFFA27AFA),
                                                        fontSize: 15.sp,
                                                        fontFamily: "Milliard",
                                                      ),
                                                    ) : Text(
                                                      "In Progress",
                                                      style: TextStyle(
                                                        color: Color(0XFFFBB634),
                                                        fontSize: 15.sp,
                                                        fontFamily: "Milliard",
                                                      ),
                                                    )
                                                ),
                                              ],
                                            ),
                                          ),

                                          //Price
                                          Text(
                                            items[index].price.toString()+" fcfa",
                                            style: TextStyle(
                                                color:  Color.fromRGBO(188, 44, 61, 1),
                                                fontFamily: "Milliard",
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w200
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                          ),
                          SizedBox(width: 8.w,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h,),
                  Divider(),
                ],
              ),
              //Page Modification
            );
          }

      ),
    );
  }
}
