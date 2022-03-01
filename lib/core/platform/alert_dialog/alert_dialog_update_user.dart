import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlertDialogueUpdateUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0)
        ),
        child: Container(
          height: 218.h,
          width: 344.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.r),
            color: Colors.white,
          ),
          child: Center(
              child:Column(
                children: [
                  SizedBox(height: 18.h,),
                  //Icons
                  Container(
                    height: 45.r,
                    width: 45.r,
                    child: Center(
                        child:Container(
                          width: 45.r,
                          child: CircleAvatar(
                            backgroundColor: Color.fromRGBO(104, 211, 137, 1),
                            radius: 100.r,
                            child:Icon(
                              Icons.assignment_turned_in_rounded,
                              color: Colors.white,
                              size: 16.sp,
                            ),
                          ),
                        )

                    ),
                  ),
                  SizedBox(height: 9.h,),
                  //Title
                  Text(
                    //TODO CHANGE
                    "Mise a jour Terminer",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Milliard",
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 17.h,),
                  //Description
                  Container(
                    width: 290.w,
                    child:Text(
                      //TODO CHANGE
                      "Lorem Ipsum is simply dummy text of the printing and types etting industry. Lorem Ipsum has been the industry's stan dard dummy text ever.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12.sp,
                        //fontWeight: FontWeight.w400,
                        fontFamily: "Milliard",
                        color: Color.fromRGBO(148, 148, 148, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 18.h,),
                  //Close Windows
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "OK",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Milliard",
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              )
          ),
        )
    );
  }
}