import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/core/platform/lv_icons_resto.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/chip_list.dart';


class AddMealDisplay extends StatefulWidget {
  const AddMealDisplay({Key? key}) : super(key: key);

  @override
  _AddMealDisplayState createState() => _AddMealDisplayState();
}

class _AddMealDisplayState extends State<AddMealDisplay> {
  final formKey = GlobalKey<FormState>();
  int _selectedIndex=0;
  List<String> _categorieOptions = [
    'Desert',
    'Entrée ',
    'Plat de résistance',
    'Autres Cat1',
    'Catégorie 2',
  ];

  List<String> _statusOptions=[
    'Disponible',
    'indisponible',
    'Bientot dispo',
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
            //Meal Name
            Container(
              width: 344.w,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Name Meal",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontFamily: "Milliard",
                  ),
                ),
              ),
            ),
            SizedBox(height: 7.h,),
            mealName(),
            SizedBox(height: 15.h,),
            //Categorie
            Container(
              width: 344.w,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Categorie",
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
                listOfChipNames: _categorieOptions,
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
            SizedBox(height: 17.h,),
            //Price
            Container(
              width: 344.w,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Price",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontFamily: "Milliard",
                  ),
                ),
              ),
            ),
            SizedBox(height: 7.h,),
            restauPrice(),
            SizedBox(height: 17.h,),

            //Remise
            Container(
              width: 344.w,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Remise",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontFamily: "Milliard",
                  ),
                ),
              ),
            ),
            SizedBox(height: 7.h,),
            remisePrice(),
            SizedBox(height: 17.h,),


            //Status
            Container(
              width: 344.w,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Status",
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
                listOfChipNames: _statusOptions,
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
  Widget mealName()=>Container(
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

  Widget restauPrice()=>Container(
      width: 344.w,
      height: 48.h,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.sp,
                fontFamily: "Milliard",
              ),
              decoration: InputDecoration(
                hintText: '500',
                contentPadding:  EdgeInsets.symmetric(vertical: 14.r, horizontal: 10.r),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            width: 76.w,
            height: 48.h,
            color: Color.fromRGBO(241, 241, 241,1),
            child: Center(
              child: Text(
                  'FCFA',
                  style: TextStyle(
                    color: Color.fromRGBO(145, 145, 145, 1),
                    fontSize: 20.sp,
                    fontFamily: "Milliard",
                  )

              ),
            ),
          )
        ],
      )
  );

  Widget remisePrice()=>Container(
      width: 344.w,
      height: 48.h,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(

              style: TextStyle(
                color: Colors.black,
                fontSize: 20.sp,
                fontFamily: "Milliard",
              ),
              decoration: InputDecoration(
                hintText: '50',
                contentPadding:  EdgeInsets.symmetric(vertical: 14.r, horizontal: 10.r),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            width: 76.w,
            height: 48.h,
            color: Color.fromRGBO(241, 241, 241,1),
            child: Center(
              child: Text(
                  '%',
                  style: TextStyle(
                    color: Color.fromRGBO(145, 145, 145, 1),
                    fontSize: 20.sp,
                    fontFamily: "Milliard",
                  )

              ),
            ),
          )
        ],
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
