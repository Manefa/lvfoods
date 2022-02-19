import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ManageAddressDelivery extends StatefulWidget {
  const ManageAddressDelivery({Key? key}) : super(key: key);

  @override
  _ManageAddressDeliveryState createState() => _ManageAddressDeliveryState();
}

class _ManageAddressDeliveryState extends State<ManageAddressDelivery> {
  final formKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String number = '';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Container(
      child:Center(
        child: Column(

          children: [
            SizedBox(height: 11.h,),
            Container(
              height: 6.h,
              width: 114.w,
              decoration: BoxDecoration(
                color: Color.fromRGBO(223, 222, 221, 1),
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            SizedBox(height: 23.h,),
            //Title & Save
            Container(
              height: 52.h,
              width: 344.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Manage Address",
                    style: TextStyle(
                      fontFamily: "Milliard",
                      fontSize: 16.sp,
                      color: Colors.black,
                    ),
                  ),
                  InkWell(
                    onTap: (){},
                    child: Text("Save",
                      style: TextStyle(
                        fontFamily: "Milliard",
                        fontSize: 20.sp,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],

              ),
            ),
            SizedBox(height: 29.h,),
            Container(
              width:344.w,
              child:Form(
                key: formKey,
                child: Column(
                  children: [
                    //Full Name
                    Align(
                      alignment: Alignment.centerLeft,
                      child:   Text("Ville",
                        style: TextStyle(
                          fontFamily: "Milliard",
                          fontSize: 16.sp,
                          color: Color.fromRGBO(148, 148, 148, 1),
                        ),
                      ),
                    ),
                    SizedBox(height: 7.h,),
                    ville(),
                    SizedBox(height: 17.h,),
                    //Email Adress
                    Align(
                      alignment: Alignment.centerLeft,
                      child:   Text("Quartier",
                        style: TextStyle(
                          fontFamily: "Milliard",
                          fontSize: 16.sp,
                          color: Color.fromRGBO(148, 148, 148, 1),
                        ),
                      ),
                    ),
                    SizedBox(height: 7.h,),
                    quartier(),
                    SizedBox(height: 17.h,),
                  ],

                ),

              ),
            )
          ],
        ),
      ),
    ),);
  }
  Widget ville()=>Container(
    height: 48.h,
    child: TextFormField(
      style: TextStyle(
        color: Colors.black,
        fontSize: 20.sp,
        fontFamily: "Milliard",
      ),
      decoration: InputDecoration(
        contentPadding: new EdgeInsets.symmetric(vertical: 35.h, horizontal: 10.w),
        border: OutlineInputBorder(),
      ),
      onSaved: (value) => setState(() => username = value!),
    ),
  );

  Widget quartier()=>Container(
    height: 48.h,
    child: TextFormField(
      style: TextStyle(
        color: Colors.black,
        fontSize: 20.sp,
        fontFamily: "Milliard",
      ),
      decoration: InputDecoration(
        contentPadding: new EdgeInsets.symmetric(vertical: 35.h, horizontal: 10.w),
        suffixIcon:Icon(
          Icons.my_location_rounded,
          color: Color.fromRGBO(188, 44, 61, 1),
          size:20.sp,
        ),
        border: OutlineInputBorder(),
      ),
      onSaved: (value) => setState(() => username = value!),
    ),
  );
}
