import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/core/platform/lv_icons_resto.dart';

class InfosRestaurantModel{
  final String name;
  final String location;
  final String email;
  final bool statut;
  final String style;
  final String description;
  InfosRestaurantModel({required this.name,required this.location,required this.email,required this.statut,required this.style,required this.description,});
}

InfosRestaurantModel namekResto = new InfosRestaurantModel(
  name: "Tao Paie paie restau",
  location: "Namek, Celeste",
  email: "taopiepie@gmail.com",
  statut: true,
  style: "Namekien",
  description: "Rien a dire a part que je suis un chomeur  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ",
);
class InfosRestaurantDisplay extends StatefulWidget {
  const InfosRestaurantDisplay({Key? key}) : super(key: key);

  @override
  _InfosRestaurantDisplayState createState() => _InfosRestaurantDisplayState();
}

class _InfosRestaurantDisplayState extends State<InfosRestaurantDisplay> {
  @override
  Widget build(BuildContext context) {
    bool isSwitched = true;
    List<String> litems= ['+237 691 380 128','+237 677 589 625'];
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
            SizedBox(height: 16.5.h,),
            //Edit Container
            Container(
              width: 344.w,
              height: 29.h,
              child: Align(
                alignment: Alignment.centerRight,
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
                      crossAxisAlignment: CrossAxisAlignment.center,

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
                              fontSize: 15.sp,
                            )
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 21.h,),


            //InfosSection
            //NameRestaurant
            Container(
              width: 344.w,
              //NameRestaurant
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment:CrossAxisAlignment.center,
                children: [
                  Text(
                    "Nom restaurant",
                    style: TextStyle(
                        color: Color.fromRGBO(148, 148, 148, 1),
                        fontFamily: "Milliard",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  SizedBox(width: 82.w,),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        namekResto.name,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Milliard",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w200
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 23.h,),
            //Phone Number
            Container(
              width: 344.w,
              //Phone
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Text(
                    "Phones",
                    style: TextStyle(
                        color: Color.fromRGBO(148, 148, 148, 1),
                        fontFamily: "Milliard",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  SizedBox(width: 82.w,),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        children: [
                          //PhoneNumberList
                          Text(
                            "+237 691 380 128",
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Milliard",
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w200
                            ),
                          ),
                          SizedBox(height: 8.h,),
                          //AddNumberButton
                          InkWell(
                            child: Text(
                              '+  Add phone number',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Milliard",
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w100
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
            //Email
            SizedBox(height: 23.h,),
            Container(
              width: 344.w,
              //NameRestaurant
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment:CrossAxisAlignment.center,
                children: [
                  Text(
                    "Email",
                    style: TextStyle(
                        color: Color.fromRGBO(148, 148, 148, 1),
                        fontFamily: "Milliard",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  SizedBox(width: 82.w,),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        namekResto.email,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Milliard",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w200
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            //Statut
            SizedBox(height: 23.h,),
            Container(
              width: 344.w,
              //NameRestaurant
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment:CrossAxisAlignment.center,
                children: [
                  Text(
                    "Status",
                    style: TextStyle(
                        color: Color.fromRGBO(148, 148, 148, 1),
                        fontFamily: "Milliard",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  SizedBox(width: 82.w,),


                  Container(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child:Row(
                        children: [
                          Text(
                            "Enable",
                            style: TextStyle(
                                color: Color.fromRGBO(188, 44, 61, 1),
                                fontFamily: "Milliard",
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w100
                            ),
                          ),
                          SizedBox(width: 20.w,),
                          SizedBox(
                            height: 15.h,
                            width: 31.w,
                            child: Switch(
                              value: isSwitched,
                              onChanged: (value){
                                setState(() {
                                  isSwitched=false;

                                });
                              },
                              activeTrackColor: Color.fromRGBO(188, 44, 61, 1),
                              inactiveTrackColor: Color.fromRGBO(223, 222, 221, 1),
                              activeColor: Colors.white,
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
            //StyleRestau
            SizedBox(height: 23.h,),
            Container(
              width: 344.w,
              //NameRestaurant
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment:CrossAxisAlignment.center,
                children: [
                  Text(
                    "Style Resto",
                    style: TextStyle(
                        color: Color.fromRGBO(148, 148, 148, 1),
                        fontFamily: "Milliard",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  SizedBox(width: 82.w,),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        namekResto.style,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Milliard",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w200
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            //Localisation
            SizedBox(height: 23.h,),
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
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child:Row(
                        children: [
                          Text(
                            namekResto.location,
                            style: TextStyle(
                                color: Color.fromRGBO(188, 44, 61, 1),
                                fontFamily: "Milliard",
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w100
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
            SizedBox(height: 23.h,),
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
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                  SizedBox(height: 6.h,),
                  Text(
                    namekResto.description,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Milliard",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w100
                    ),
                  ),
                  SizedBox(height: 19.h,),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
