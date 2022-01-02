import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AlerDialogueAddTimeDisplay extends StatefulWidget {
  const AlerDialogueAddTimeDisplay({Key? key}) : super(key: key);

  @override
  _AlerDialogueAddTimeDisplayState createState() => _AlerDialogueAddTimeDisplayState();
}

class _AlerDialogueAddTimeDisplayState extends State<AlerDialogueAddTimeDisplay> {
  @override
  Widget build(BuildContext context) {
    String ? valueChoose;
    List dayList = ["Lundi","Mardi","Mercredi","Jeudi","Vendredi","Samedi","Dimanche"];
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(416, 897),
        orientation: Orientation.portrait);
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r)
      ),
      child: Container(
        height: 363.h,
        width: 344.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60.r),
          color: Colors.white,
        ),
        child:Center(
          child: Column(
            children: [
              SizedBox(height: 23.h,),
              //Add Anorher Day
              Container(
                width: 290.5.w,
                height: 21.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Add another day",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Milliard",
                        color: Colors.black,
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.close,
                        color: Colors.black,
                        size: 20.sp,
                      ),
                    )


                  ],
                ),
              ),
              SizedBox(height: 23.h,),
              //Day Container
              Container(
                width: 292.w,
                height: 62.h,
                child: Column(
                  children: [
                    //Title
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Text(
                          "Day",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w100,
                            fontFamily: "Milliard",
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h,),
                    Container(
                      width: 292.w,
                      height: 35.h,
                      padding: EdgeInsets.only(left: 15.w, right: 18.5.w),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color.fromRGBO(223, 222, 221, 1), width: 1.w),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: DropdownButton(
                        hint: Text(
                          "Select Day",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Milliard",
                              fontSize: 15.sp
                          ),
                        ),
                        isExpanded: true,
                        underline: SizedBox(),
                        value: valueChoose,
                        onChanged: (newValue){
                          setState((){
                            valueChoose= newValue as String?;
                          });
                        },
                        items:dayList.map((valueItem) {
                          return DropdownMenuItem(
                              value: valueItem,
                              child: Text(
                                  valueItem,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Milliard",
                                      fontSize: 15.sp
                                  )
                              )
                          );
                        }).toList(),
                      ),


                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h,),
              //Open Hours Container
              Container(
                width: 292.w,
                height: 62.h,
                child: Column(
                  children: [
                    //Title
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Text(
                          "Open Hours",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w100,
                            fontFamily: "Milliard",
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h,),
                    Container(
                      width: 292.w,
                      height: 35.h,
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Hrs Container
                          Container(
                            child:Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                OpenHours(),
                                SizedBox(width: 9.w,),
                                Text(
                                  "Hrs",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w100,
                                    fontFamily: "Milliard",
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                          //Divider
                          SizedBox(
                            width: 18.w,
                            child: Container(
                              height: 2.h,
                              color: Colors.grey,
                            ),
                          ),
                          //Min Container
                          Container(
                            child:Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                OpenMin(),
                                SizedBox(width: 9.w,),
                                Text(
                                  "Min",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w100,
                                    fontFamily: "Milliard",
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15.h,),
              //Close Hours Container
              Container(
                width: 292.w,
                height: 62.h,
                child: Column(
                  children: [
                    //Title
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Text(
                          "Close Hours",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w100,
                            fontFamily: "Milliard",
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h,),
                    Container(
                      width: 292.w,
                      height: 35.h,
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Hrs Container
                          Container(
                            child:Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CloseHours(),
                                SizedBox(width: 9.w,),
                                Text(
                                  "Hrs",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w100,
                                    fontFamily: "Milliard",
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                          //Divider
                          SizedBox(
                            width: 18.w,
                            child: Container(
                              height: 2.h,
                              color: Colors.grey,
                            ),
                          ),
                          //Hrs Container
                          Container(
                            child:Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CloseMin(),
                                SizedBox(width: 9.w,),
                                Text(
                                  "Min",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w100,
                                    fontFamily: "Milliard",
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),


                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15.h,),
              Container(
                width: 292.w,
                height: 32.h,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(188, 44, 61,1),
                    borderRadius: BorderRadius.circular(5.r)
                ),
                child: Center(
                  child: Text(
                    "Add day",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Milliard",
                        fontSize: 12.sp
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
  Widget OpenHours()=>Container(
    width: 72.w,
    child: TextFormField(
      decoration: InputDecoration(
        contentPadding: new EdgeInsets.symmetric(vertical: 35.h, horizontal: 10.w),
        border: OutlineInputBorder(),
      ),
    ),
  );
  Widget OpenMin()=>Container(
    width: 72.w,
    child: TextFormField(
      decoration: InputDecoration(
        contentPadding: new EdgeInsets.symmetric(vertical: 35.h, horizontal: 10.w),
        border: OutlineInputBorder(),
      ),
    ),
  );
  Widget CloseMin()=>Container(
    width: 72.w,
    child: TextFormField(
      decoration: InputDecoration(
        contentPadding: new EdgeInsets.symmetric(vertical: 35.h, horizontal: 10.w),
        border: OutlineInputBorder(),
      ),
    ),
  );
  Widget CloseHours()=>Container(
    width: 72.w,
    child: TextFormField(
      decoration: InputDecoration(
        contentPadding: new EdgeInsets.symmetric(vertical: 35.h, horizontal: 10.w),
        border: OutlineInputBorder(),
      ),
    ),
  );
}
