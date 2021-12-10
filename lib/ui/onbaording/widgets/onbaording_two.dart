import 'package:flutter/material.dart';
import 'package:ivfoods_mobile_app/constants.dart';
import 'package:ivfoods_mobile_app/size_config.dart';

class OnbaordingTwo extends StatelessWidget {
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
                        "images/burger.png",
                      ),
                    )
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(38),
              ),
              Text(
                "CHOOSE A TASKY",
                style: TextStyle(
                    fontFamily: "Milliard",
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize(size: 33)
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Text(
                "DISK",
                style: TextStyle(
                    fontFamily: "Milliard",
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize(size: 33)
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(50),
              ),
              Text(
                "Worem Ipsum is simply dummy text of the ",
                style: TextStyle(
                  fontFamily: "Milliard",
                  fontSize: fontSize(size: 18),
                  color: Color(0XFF949494),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(7),
              ),
              Text(
                "printing and typesetting industry. Lorem Ipsum",
                style: TextStyle(
                  fontFamily: "Milliard",
                  fontSize: fontSize(size: 18),
                  color: Color(0XFF949494),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(7),
              ),
              Text(
                "has been the",
                style: TextStyle(
                  fontFamily: "Milliard",
                  fontSize: fontSize(size: 18),
                  color: Color(0XFF949494),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(60),
              ),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, "/login");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Skyp",
                      style: TextStyle(
                        fontFamily: "Milliard",
                        fontSize: fontSize(size: 18),
                        color: Color(0XFF949494),
                      ),
                    ),
                    Image.asset("images/skyp_arrow.png"),
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(50),
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
                    width: getProportionateScreenWidth(40),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: kPrimaryColor,
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
