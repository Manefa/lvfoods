import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ivfoods_mobile_app/constants.dart';
import 'package:ivfoods_mobile_app/features/update_password/bloc/update_password.dart';
import 'package:ivfoods_mobile_app/features/update_password/domain/entities/send_password.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';
class ManagePasswordDelivery extends StatefulWidget {
  const ManagePasswordDelivery({Key? key}) : super(key: key);

  @override
  _ManagePasswordDeliveryState createState() => _ManagePasswordDeliveryState();
}

class _ManagePasswordDeliveryState extends State<ManagePasswordDelivery> {
  final formKey = GlobalKey<FormState>();
  String password = '';
  String newPassword = '';
  String lastPassword = '';
  bool _obsecureTextCurrent = true;
  bool _obsecureTextNew = true;
  bool _obsecureTextConfirm = true;
  TextEditingController firstPassword = TextEditingController();
  TextEditingController secondPassword = TextEditingController();
  TextEditingController thirdPassword = TextEditingController();
  UpdatePasswordBloc _updatePasswordBloc = sl<UpdatePasswordBloc>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UpdatePasswordBloc>(
      create: (_) => _updatePasswordBloc,
      child: BlocListener<UpdatePasswordBloc, UpdatePasswordState>(
        bloc: _updatePasswordBloc,
        listener: (context, state){
          if(state is UpdatePasswordLoading){
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
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

          if(state is UpdatePasswordLoaded){
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text(AppLocalizations.of(context)!.translate("updatePerformed"), style: TextStyle(fontFamily: "Milliard", color: Colors.white),), Icon(Icons.check, color: Colors.white,)],
                  ),
                  backgroundColor: kPrimaryColor,
                ),
              );
          }

          if(state is UpdatePasswordError){
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text(AppLocalizations.of(context)!.translate("theUpdateHasFailed")+state.message, style: TextStyle(fontFamily: "Milliard", color: Colors.white),), Icon(Icons.close, color: Colors.white,)],
                  ),
                  backgroundColor: kPrimaryColor,
                ),
              );
          }
        },
        child: SingleChildScrollView(child: Container(
            child: Center(
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
                        Text(
                          AppLocalizations.of(context)!.translate("changePassword"),
                          style: TextStyle(
                            fontFamily: "Milliard",
                            fontSize: 16.sp,
                            color: kPrimaryColor,
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            if(secondPassword.text.toString().trim() == thirdPassword.text.toString().trim()){
                              SendPassword sendPassword = SendPassword(lastPassword: firstPassword.text.trim(), newPassword: secondPassword.text.trim(), confirmPassword: thirdPassword.text.trim() );
                              _updatePasswordBloc.add(LaunchUpdatePassword(sendPassword: sendPassword));
                            }else{
                              Fluttertoast.showToast(
                                  msg: AppLocalizations.of(context)!.translate("passwordConfirmationFailed"),
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 2,
                                  backgroundColor: Colors.grey,
                                  textColor: Colors.white,
                                  fontSize: 16.sp,
                              );
                            }
                          },
                          child: Text(
                            AppLocalizations.of(context)!.translate("save"),
                            style: TextStyle(
                              fontFamily: "Milliard",
                              fontSize: 20.sp,
                              color: kPrimaryColor,
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
                          //Current Password
                          Align(
                            alignment: Alignment.centerLeft,
                            child:   Text(
                              AppLocalizations.of(context)!.translate("currentPassword"),
                              style: TextStyle(
                                fontFamily: "Milliard",
                                fontSize: 16.sp,
                                color: Color.fromRGBO(148, 148, 148, 1),
                              ),
                            ),
                          ),
                          SizedBox(height: 7.h,),
                          currentPassword(),
                          SizedBox(height: 17.h,),
                          //New Password
                          Align(
                            alignment: Alignment.centerLeft,
                            child:   Text(
                              AppLocalizations.of(context)!.translate("newPassword"),
                              style: TextStyle(
                                fontFamily: "Milliard",
                                fontSize: 16.sp,
                                color: Color.fromRGBO(148, 148, 148, 1),
                              ),
                            ),
                          ),
                          SizedBox(height: 7.h,),
                          changePassword(),
                          SizedBox(height: 17.h,),
                          //Confirm Password
                          Align(
                            alignment: Alignment.centerLeft,
                            child:   Text(
                              AppLocalizations.of(context)!.translate("confirmPassword"),
                              style: TextStyle(
                                fontFamily: "Milliard",
                                fontSize: 16.sp,
                                color: Color.fromRGBO(148, 148, 148, 1),
                              ),
                            ),
                          ),
                          SizedBox(height: 7.h,),
                          confirmPassword(),
                          SizedBox(height: 17.h,),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),),
      ),
    );
  }
  Widget currentPassword()=>Container(
    height: 49.h,
    child: TextFormField(
      controller: firstPassword,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20.sp,
        fontFamily: "Milliard",
      ),
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _obsecureTextCurrent = !_obsecureTextCurrent;
            });
          }, icon: _obsecureTextCurrent
            ?Icon(Icons.visibility_outlined, color: Color.fromRGBO(188, 44, 61, 1), size:20.sp,)
            :Icon(Icons.visibility_off_outlined, color: Color.fromRGBO(188, 44, 61, 1), size:20.sp,),
        ),
        contentPadding: new EdgeInsets.symmetric(vertical: 35.h, horizontal: 10.w),
        border: OutlineInputBorder(),
      ),
      obscureText: _obsecureTextCurrent,
      onSaved: (value) => setState(() => password = value!),
    ),
  );

  Widget changePassword()=>Container(
    height: 48.h,
    child: TextFormField(
      controller: secondPassword,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20.sp,
        fontFamily: "Milliard",
      ),
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _obsecureTextNew = !_obsecureTextNew;
            });
          }, icon: _obsecureTextNew
            ?Icon(Icons.visibility_outlined, color: Color.fromRGBO(188, 44, 61, 1), size:20.sp,)
            :Icon(Icons.visibility_off_outlined, color: Color.fromRGBO(188, 44, 61, 1), size:20.sp,),
        ),
        contentPadding: new EdgeInsets.symmetric(vertical: 35.h, horizontal: 10.w),
        border: OutlineInputBorder(),
      ),
      obscureText: _obsecureTextNew,
      validator: (val) => val!.length < 6 ? 'Password too short.' : null,
      onSaved: (value) => setState(() => password = value!),
    ),
  );

  Widget confirmPassword()=>Container(
    height: 48.h,
    child: TextFormField(
      controller: thirdPassword,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20.sp,
        fontFamily: "Milliard",
      ),
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _obsecureTextConfirm = !_obsecureTextConfirm;
            });
          }, icon: _obsecureTextConfirm
            ?Icon(Icons.visibility_outlined, color: Color.fromRGBO(188, 44, 61, 1), size:20.sp,)
            :Icon(Icons.visibility_off_outlined, color: Color.fromRGBO(188, 44, 61, 1), size:20.sp,),
        ),
        contentPadding: new EdgeInsets.symmetric(vertical: 35.h, horizontal: 10.w),
        border: OutlineInputBorder(),
      ),
      obscureText: _obsecureTextConfirm,
      validator: (val) => val!.length < 6 ? 'Password too short.' : null,
      onSaved: (value) => setState(() => password = value!),
    ),
  );
}

