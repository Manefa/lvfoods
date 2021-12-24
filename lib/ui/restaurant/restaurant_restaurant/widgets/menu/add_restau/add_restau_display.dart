import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/core/platform/lv_icons_resto.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/menu/add_restau/widgets/choice_chip.dart';

class AddRestauDisplay extends StatefulWidget {
  const AddRestauDisplay({Key? key}) : super(key: key);

  @override
  _AddRestauDisplayState createState() => _AddRestauDisplayState();
}

class _AddRestauDisplayState extends State<AddRestauDisplay> {
  final formKey = GlobalKey<FormState>();
  int _selectedIndex=0;
  List<String> _restauStyleOptions = [
    'Senegalais',
    'Kmer',
    'Resto Local',
    'Senegalais',
    'Kmer',
    'Resto Local',
    'Resto Local'
  ];



  @override
  Widget build(BuildContext context) {
    bool isSwitched = true;
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
            //LogoAndSave
            Container(
              height: 57.h,
              width: 344.w,
              //color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        //Image
                        Container(
                          height: 57.h,
                          width: 57.w,
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                          ),
                        ),
                        SizedBox(width: 11.w,),
                        //UploadIcon
                        InkWell(
                          child: Text(
                            "Upload Logo",
                            style: TextStyle(
                              color: Color.fromRGBO(188, 44, 61, 1),
                              fontSize: 18.sp,
                              fontFamily: "Milliard",
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    child: Text(
                      "Save",
                      style: TextStyle(
                        color: Color.fromRGBO(188, 44, 61, 1),
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Milliard",
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 26.h,),
            //Restau Name
            Container(
              width: 344.w,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Restaurant Name",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontFamily: "Milliard",
                  ),
                ),
              ),
            ),
            SizedBox(height: 7.h,),
            restauName(),
            //Phone Number
            SizedBox(height: 16.h,),
            Container(
              width: 344.w,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Phone Number",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontFamily: "Milliard",
                  ),
                ),
              ),
            ),
            SizedBox(height: 7.h,),
            restauNumber(),
            SizedBox(height: 16.h,),
            //EmailRestau
            Container(
              width: 344.w,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Email Restaurant",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontFamily: "Milliard",
                  ),
                ),
              ),
            ),
            SizedBox(height: 7.h,),
            restauEmail(),
            //Phone Number
            SizedBox(height: 16.h,),
            //Localisation
            Container(
              width: 344.w,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Localisation",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontFamily: "Milliard",
                  ),
                ),
              ),
            ),
            SizedBox(height: 7.h,),
            localisationRestau(),
            SizedBox(height: 21.h,),
            //Statut
            Container(
              height: 21.h,
              width: 344.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      "Status",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontFamily: "Milliard",
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          "Enable",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontFamily: "Milliard",
                          ),
                        ),
                        SizedBox(width: 19.w,),
                        //Switch
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
                        )

                      ],
                    ),

                  )
                ],
              ),
            ),
            SizedBox(height: 24.h,),
            //Resto style
            Container(
              width: 344.w,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Resto style",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontFamily: "Milliard",
                  ),
                ),
              ),
            ),
            SizedBox(height: 21.h,),
            Container(
              width: 344.w,
              child: ChipList(
                listOfChipNames: _restauStyleOptions,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: "Milliard",
                ),
                borderRadiiList: [8.r],
                runSpacing: 17.h,
                activeBgColorList: [Color.fromRGBO(188, 44, 61,1)],
                listOfChipIndicesCurrentlySeclected: [_selectedIndex],
                inactiveBgColorList: [Color.fromRGBO(248, 247, 247, 1)],
                activeTextColorList: [Colors.white],
                inactiveTextColorList: [Color.fromRGBO(148, 148, 148,1)],
                shouldWrap: true,
              ),
            ),
            SizedBox(height: 23.h,),
            //Description
            Container(
              width: 344.w,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Description",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontFamily: "Milliard",
                  ),
                ),
              ),
            ),
            SizedBox(height: 7.h,),
            description(),
            SizedBox(height: 23.h,),
            //UploadImage
            Container(
              width: 344.w,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Upload Slide Cover Image",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontFamily: "Milliard",
                  ),
                ),
              ),
            ),
            SizedBox(height: 23.h,),
            Container(
              height: 42.h,
              width: 344.w,
              child: DottedBorder(
                  color: Color.fromRGBO(188, 44, 61, 1),
                  strokeWidth: 0.2,
                  dashPattern: [10,6],
                  child:Center(
                      child:Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            LvIconsResto.upload,
                            color: Color.fromRGBO(188, 44, 61, 1),
                            size: 16.sp,
                          ),
                          SizedBox(width: 19.w,),
                          Text(
                            "Upload Images Here",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Color.fromRGBO(188, 44, 61, 1),
                                fontSize: 20.sp,
                                fontFamily: "Milliard",

                                fontWeight: FontWeight.w200
                            ),
                          )
                        ],
                      )
                  )
              ),
            ),
            SizedBox(height: 43.h,),
            //AddResto Button
            Container(
              width: 340.w,
              height: 45.h,
              decoration: BoxDecoration(
                color: Color.fromRGBO(188, 44, 61, 1),
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Center(
                child: Text(
                  "Add Restaurant",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w300,
                    fontFamily: "Milliard",
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 43.h,),


          ],
        ),
      ),

    );
  }
  Widget restauName()=>Container(
      width: 344.w,
      height: 48.h,
      child: TextFormField(
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.sp,
          fontFamily: "Milliard",
        ),
        decoration: InputDecoration(
          hintText: 'Enter Name',
          contentPadding:  EdgeInsets.symmetric(vertical: 14.r, horizontal: 10.r),
          border: OutlineInputBorder(),
        ),
      )
  );
  Widget restauNumber()=>Container(
      width: 344.w,
      height: 48.h,
      child: TextFormField(
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.sp,
          fontFamily: "Milliard",
        ),
        decoration: InputDecoration(
          hintText: 'Enter Number',
          contentPadding:  EdgeInsets.symmetric(vertical: 14.r, horizontal: 10.r),
          border: OutlineInputBorder(),
        ),
      )
  );
  Widget restauEmail()=>Container(
      width: 344.w,
      height: 48.h,
      child: TextFormField(

        style: TextStyle(
          color: Colors.black,
          fontSize: 20.sp,
          fontFamily: "Milliard",
        ),
        decoration: InputDecoration(
          hintText: 'Enter Email',
          contentPadding:  EdgeInsets.symmetric(vertical: 14.r, horizontal: 10.r),
          border: OutlineInputBorder(),
        ),
      )
  );
  Widget localisationRestau()=>Container(
      width: 344.w,
      height: 48.h,
      child: TextFormField(

        style: TextStyle(
          color: Colors.black,
          fontSize: 20.sp,
          fontFamily: "Milliard",
        ),
        decoration: InputDecoration(
          hintText: 'Enter Localisation',
          suffixIcon:Icon(
            Icons.my_location_rounded,
            color: Color.fromRGBO(188, 44, 61, 1),
            size:20.sp,
          ),
          contentPadding:  EdgeInsets.symmetric(vertical: 14.r, horizontal: 10.r),
          border: OutlineInputBorder(),
        ),
      )
  );
  Widget description()=>Container(
    height: 121.h,
    width: 344.w,
    decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        border: new Border.all(color: Color.fromRGBO(223, 222, 221, 1))
    ),
    child: new SizedBox.expand(
      child: new TextField(
          maxLines: 8,
          style: new TextStyle(
              fontSize: 16.sp,
              fontFamily: "Milliard",
              color: Colors.black
          ),
          decoration: const InputDecoration(
            hintText: "Enter description...",
            contentPadding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
          )
      ),
    ),
  );
}
