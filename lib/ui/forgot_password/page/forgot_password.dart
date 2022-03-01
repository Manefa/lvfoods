import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/constants.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';
import 'package:ivfoods_mobile_app/size_config.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            width: size.width,
            height: size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: getProportionateScreenHeight(35),),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: getProportionateScreenWidth(35),),
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        size: fontSize(size: 20),
                      ),
                    ),
                    SizedBox(width: getProportionateScreenWidth(85),),
                    Text(
                      AppLocalizations.of(context)!.translate("passwordForgot"),
                      style: TextStyle(
                        fontFamily: "Milliard",
                        fontSize: fontSize(size: 20),
                        color: Colors.black,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(85),),
                Container(
                  height: getProportionateScreenHeight(256),
                  width: getProportionateScreenWidth(277),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/lock.png"),
                      fit: BoxFit.contain,
                    )
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(30),),
                Text(
                  AppLocalizations.of(context)!.translate("passwordForget"),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: fontSize(size: 25),
                    fontFamily: "Milliard"
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(28),),
                Center(
                  child: Text(
                    AppLocalizations.of(context)!.translate("passwordForgotText"),
                    style: TextStyle(
                      fontFamily: "Milliard",
                      fontSize: fontSize(size: 16),
                      color: Color(0XFF949494),
                    ),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(96),),
                Container(
                  width: getProportionateScreenWidth(344),
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.center,
                    style: TextStyle(
                      color: Color(0XFFB8B8B8),
                      fontSize: fontSize(size: 16),
                      fontFamily: "Milliard",
                    ),
                    cursorColor: Color(0XFFB8B8B8),
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Icon(
                            Icons.mail_outline,
                            color: Color(0XFFB8B8B8),
                          ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
                      ),
                      focusColor: Color(0XFFB8B8B8),
                      hintText: AppLocalizations.of(context)!.translate("enterEmail"),
                      hintStyle: TextStyle(
                        color: Color(0XFFB8B8B8),
                        fontSize: fontSize(size: 16),
                        fontFamily: "Milliard",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(115),),
                InkWell(
                  child: Container(
                    height: getProportionateScreenHeight(52),
                    width: getProportionateScreenWidth(344),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: kPrimaryColor,
                        boxShadow: [
                          BoxShadow(
                            color: kPrimaryColor.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 10,
                          )
                        ]
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 92.h),
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)!.translate("send"),
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Milliard",
                            fontSize: fontSize(size: 16),
                            fontWeight: FontWeight.w400,
                          ),
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
    );
  }
}
