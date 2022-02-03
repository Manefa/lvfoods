import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ivfoods_mobile_app/constants.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_hours/bloc/add_hours.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_hours/domain/entities/for_add_hours.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AlerDialogueAddTimeDisplay extends StatefulWidget {
  const AlerDialogueAddTimeDisplay({Key? key}) : super(key: key);

  @override
  _AlerDialogueAddTimeDisplayState createState() => _AlerDialogueAddTimeDisplayState();
}

class _AlerDialogueAddTimeDisplayState extends State<AlerDialogueAddTimeDisplay> {
  AddHoursBloc _addHoursBloc = sl<AddHoursBloc>();
  TextEditingController openHourController = TextEditingController();
  TextEditingController openMinuteController = TextEditingController();
  TextEditingController closeHourController = TextEditingController();
  TextEditingController closeMinuteController = TextEditingController();
  String start = "Select Day";
  String? nameRestaurant;
  @override
  Widget build(BuildContext context) {
    String ? valueChoose;
    List dayList = ["Lundi","Mardi","Mercredi","Jeudi","Vendredi","Samedi","Dimanche"];
    nameRestaurant = sl<SharedPreferences>().getString('RESTAURANT_NAME');
    return BlocProvider<AddHoursBloc>(
      create: (_) => _addHoursBloc,
      child: BlocListener(
        bloc: _addHoursBloc,
        listener: (context, state){
          if(state is AddHoursLoading){
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  duration: (state is AddHoursLoading) ? Duration(days: 1) : Duration(seconds: 1),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "En cours...",
                        style: TextStyle(
                          fontFamily: "Milliard",
                          color: Colors.white,
                        ),
                      ),
                      CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ],
                  ),
                  backgroundColor: kPrimaryColor,
                ),
              );
          }

          if(state is AddHoursLoaded){
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            Navigator.of(context).pop();
          }

          if(state is AddHoursError){
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text(state.message + "Echec de l'ajout", style: TextStyle(fontFamily: "Milliard", color: Colors.white),), Icon(Icons.error, color: Colors.white,)],
                  ),
                  backgroundColor: kPrimaryColor,
                ),
              );
          }
        },
        child: Dialog(
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
                  SizedBox(height: 18.h,),
                  //Day Container
                  Container(
                    width: 292.w,
                    height: 70.h,
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
                              start,
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
                                start = valueChoose!;
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
                    height: 70.h,
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
                                    openHours(),
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
                                    openMin(),
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
                    height: 70.h,
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
                                    closeHours(),
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
                                    closeMin(),
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
                  InkWell(
                    onTap: (){
                      String open = openHourController.text + "h" + openMinuteController.text + "min";
                      String close = closeHourController.text + "h" + closeMinuteController.text + "min";
                      print(open);
                      print(close);
                      if(start == "Select Day" || openHourController.text.isEmpty || openMinuteController.text.isEmpty||
                          closeHourController.text.isEmpty || closeMinuteController.text.isEmpty){
                        Fluttertoast.showToast(
                          msg: "Remplissez tous les champs",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 5,
                          backgroundColor: Colors.grey,
                          textColor: Colors.white,
                          fontSize: 16.sp,
                        );
                      }else{
                        ForAddHours hours = ForAddHours(day: start, open: open, close: close);
                        _addHoursBloc.add(StartAddHours(addHours: hours, name:  nameRestaurant!));
                      }
                    },
                    child: Container(
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
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget openHours()=>Container(
    width: 72.w,
    child: TextFormField(
      keyboardType: TextInputType.number,
      controller: openHourController,
      decoration: InputDecoration(
        contentPadding: new EdgeInsets.symmetric(vertical: 35.h, horizontal: 10.w),
        border: OutlineInputBorder(),
      ),
    ),
  );
  Widget openMin()=>Container(
    width: 72.w,
    child: TextFormField(
      keyboardType: TextInputType.number,
      controller: openMinuteController,
      decoration: InputDecoration(
        contentPadding: new EdgeInsets.symmetric(vertical: 35.h, horizontal: 10.w),
        border: OutlineInputBorder(),
      ),
    ),
  );
  Widget closeMin()=>Container(
    width: 72.w,
    child: TextFormField(
      keyboardType: TextInputType.number,
      controller: closeMinuteController,
      decoration: InputDecoration(
        contentPadding: new EdgeInsets.symmetric(vertical: 35.h, horizontal: 10.w),
        border: OutlineInputBorder(),
      ),
    ),
  );
  Widget closeHours()=>Container(
    width: 72.w,
    child: TextFormField(
      keyboardType: TextInputType.number,
      controller: closeHourController,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]')),],
      decoration: InputDecoration(
        contentPadding: new EdgeInsets.symmetric(vertical: 35.h, horizontal: 10.w),
        border: OutlineInputBorder(),
      ),
    ),
  );
}
