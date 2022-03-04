import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:ivfoods_mobile_app/constants.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_hours/bloc/add_hours.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_hours/domain/entities/for_add_hours.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/times/add_day/print_time_component.dart';
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
  var openTime = TimeOfDay.now();
  var closeTime = TimeOfDay.now();
  DateTime? dateTime;

  Future<TimeOfDay> pickTime(BuildContext context) async {
    final newTime = await showTimePicker(
      context: context,
      initialTime: dateTime != null
          ? TimeOfDay(hour: dateTime!.hour, minute: dateTime!.minute)
          : openTime,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.light(
              primary: kPrimaryColor
            ),
            dialogBackgroundColor:Colors.blue[900],
          ),
          child: child!,
        );
      },
    );

    if (newTime == null) return TimeOfDay.now();

    return newTime;
  }

  Future<TimeOfDay> pickTimeClose(BuildContext context) async {
    final newTime = await showTimePicker(
      context: context,
      initialTime: dateTime != null
          ? TimeOfDay(hour: dateTime!.hour, minute: dateTime!.minute)
          : closeTime,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.light(
                primary: kPrimaryColor
            ),
            dialogBackgroundColor:Colors.blue[900],
          ),
          child: child!,
        );
      },
    );

    if (newTime == null) return TimeOfDay.now();

    return newTime;
  }

  String start = "Select Day";
  String? nameRestaurant;
  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = AppLocalizations.of(context)!.locale.languageCode;
    String ? valueChoose;
    List dayList = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"];
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
                        AppLocalizations.of(context)!.translate("inProgressBloc"),
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
                    children: [Text(state.message + AppLocalizations.of(context)!.translate("failureToAdd"), style: TextStyle(fontFamily: "Milliard", color: Colors.white),), Icon(Icons.error, color: Colors.white,)],
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
                          AppLocalizations.of(context)!.translate("addAnotherDay"),
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
                              AppLocalizations.of(context)!.translate("day"),
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
                              AppLocalizations.of(context)!.translate("openHours"),
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
                        PrintDateComponent(
                          time: formatTimeOfDay(openTime),
                          onclick: () async {
                            var tes = await pickTime(context);
                            setState(() {
                              openTime = tes;
                              print(openTime.hourOfPeriod);
                            });
                          },
                        ),
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
                              AppLocalizations.of(context)!.translate("closeHours"),
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
                        PrintDateComponent(
                          time: formatTimeOfDay(closeTime),
                          onclick: () async {
                            var tes = await pickTimeClose(context);
                            setState(() {
                              closeTime = tes;
                              print(closeTime.hourOfPeriod);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h,),
                  InkWell(
                    onTap: (){
                      String open = openTime.hour.toString().padLeft(2,"0")  + ":" + openTime.minute.toString().padRight(2,"0");
                      String close = closeTime.hour.toString().padLeft(2,"0") + ":" + closeTime.minute.toString().padLeft(2,"0");
                      print(open);
                      print(close);
                      if(start == "Select Day" || openTime.toString().isEmpty || openTime.toString().isEmpty||
                          openTime.toString().isEmpty || openTime.toString().isEmpty){
                        Fluttertoast.showToast(
                          msg: AppLocalizations.of(context)!.translate("fillInAllFields"),
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
                          AppLocalizations.of(context)!.translate("addAnotherDay"),
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

  String formatTimeOfDay(TimeOfDay tod) {
    final now = new DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm();  //"6:00 AM"
    return format.format(dt);
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
