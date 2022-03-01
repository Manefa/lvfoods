

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/constants.dart';
import 'package:ivfoods_mobile_app/core/platform/alert_dialog/country_code_picker.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_phone/bloc/add_phone.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_phone/domain/entities/for_add_phone.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlerDialogueAddPhoneDisplay extends StatefulWidget {
  const AlerDialogueAddPhoneDisplay({Key? key}) : super(key: key);

  @override
  _AlerDialogueAddPhoneDisplayState createState() => _AlerDialogueAddPhoneDisplayState();
}

class _AlerDialogueAddPhoneDisplayState extends State<AlerDialogueAddPhoneDisplay> {
  AddPhoneBloc _addPhoneBloc = sl<AddPhoneBloc>();
  TextEditingController openHourController = TextEditingController();
  TextEditingController openMinuteController = TextEditingController();
  TextEditingController closeHourController = TextEditingController();
  TextEditingController closeMinuteController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  String? nameRestaurant;
  String? code = "+237";
  @override
  Widget build(BuildContext context) {

    nameRestaurant = sl<SharedPreferences>().getString('RESTAURANT_NAME');
    return BlocProvider<AddPhoneBloc>(
      create: (_) => _addPhoneBloc,
      child: BlocListener(
        bloc: _addPhoneBloc,
        listener: (context, state){
          if(state is AddPhoneLoading){
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  duration: (state is AddPhoneLoading) ? Duration(days: 1) : Duration(seconds: 1),
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

          if(state is AddPhoneLoaded){
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            setState(() {

            });
            Navigator.of(context).pop();
          }

          if(state is AddPhoneError){
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
            height: 263.h,
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
                          AppLocalizations.of(context)!.translate("addAnotherPhone"),
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
                  Row(
                    children: <Widget>[
                      SizedBox(width: 18.w,),
                      Text(
                        AppLocalizations.of(context)!.translate("phone"),
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Milliard",
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h,),
                  Center(
                    child: _phoneContainer(),
                  ),
                  SizedBox(height: 40.h,),
                  InkWell(
                    onTap: (){

                      ForAddPhone phone = ForAddPhone(codes: code, contents: phoneController.text);
                      _addPhoneBloc.add(StartAddPhone(addPhone: phone, name: nameRestaurant!));
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
                          AppLocalizations.of(context)!.translate("addPhone"),
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

  Widget _phoneContainer() {
    return new Container(
      width: 292.w,
      height: 48.h,
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          border: new Border.all(color: Color.fromRGBO(223, 222, 221, 1))
      ),
      child: new TextFormField(
        controller: phoneController,
        textAlignVertical: TextAlignVertical.top,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          prefixIcon: CountryCodePicker(
            onChanged: (val){
              code = val.dialCode;
            },
            initialSelection: '+237',
            favorite: ['+237', 'CMR'],
            textStyle: TextStyle(
              color: Color(0XFF949494),
              fontSize: 20.sp,
              fontFamily: "Milliard",
            ),
            showFlag: true,
            padding: EdgeInsets.zero,
            flagDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
          ),
          focusColor: Color(0XFFB8B8B8),
          border: InputBorder.none,
        ),
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.sp,
          fontFamily: "Milliard",
        ),
      ),
    );
  }

  Widget openHours()=>Container(
    width: 72.w,
    child: TextFormField(
      controller: openHourController,
      decoration: InputDecoration(
        prefixIcon: CountryCodePicker(
          initialSelection: '+237',
          favorite: ['+237', 'CMR'],
          textStyle: TextStyle(
            color: Color(0XFF949494),
            fontSize: 20.sp,
            fontFamily: "Milliard",
          ),
          showFlag: true,
          padding: EdgeInsets.zero,
          flagWidth: 12,
          flagDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        contentPadding: new EdgeInsets.symmetric(vertical: 35.h, horizontal: 10.w),
        border: OutlineInputBorder(),
      ),
    ),
  );
  Widget openMin()=>Container(
    width: 72.w,
    child: TextFormField(
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
      controller: closeHourController,
      decoration: InputDecoration(
        contentPadding: new EdgeInsets.symmetric(vertical: 35.h, horizontal: 10.w),
        border: OutlineInputBorder(),
      ),
    ),
  );
}
