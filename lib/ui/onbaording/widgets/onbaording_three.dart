import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/constants.dart';
import 'package:ivfoods_mobile_app/core/platform/icon/lv_icons.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';
import 'package:ivfoods_mobile_app/size_config.dart';

class OnbaordingThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: getProportionateScreenHeight(35),
              ),
              Container(
                height: getProportionateScreenHeight(337),
                width: getProportionateScreenWidth(336),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(
                        "images/delivery.png",
                      ),
                    )
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(38),
              ),
              Text(
                AppLocalizations.of(context)!.translate("bigTextOnBorThree"),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Milliard",
                    fontWeight: FontWeight.bold,
                    fontSize:28.sp),
              ),
              SizedBox(
                height: getProportionateScreenHeight(50),
              ),
              Text(
                AppLocalizations.of(context)!.translate("smallTextOnBorThree"),
                style: TextStyle(
                  fontFamily: "Milliard",
                  fontSize: fontSize(size: 18),
                  color: Color(0XFF949494),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 180.r),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/login");
                  },
                  borderRadius: BorderRadius.circular(12.r),
                  splashColor: kPrimaryColor.withOpacity(0.1),
                  highlightColor: kPrimaryColor.withOpacity(0.2),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context)!.translate("skip"),
                          style: TextStyle(
                            fontFamily: "Milliard",
                            fontSize: fontSize(size: 18),
                            color: Color(0XFF949494),
                          ),
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(5),
                        ),
                        Icon(
                          LvIcons.lv_skyp,
                          color: Colors.grey,
                          size: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: getProportionateScreenHeight(8),
                    width: getProportionateScreenWidth(18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Color(0XFFE6E6E6),
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(7),
                  ),
                  Container(
                    height: getProportionateScreenHeight(8),
                    width: getProportionateScreenWidth(18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Color(0XFFE6E6E6),
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(7),
                  ),
                  Container(
                    height: getProportionateScreenHeight(8),
                    width: getProportionateScreenWidth(40),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
