import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ivfoods_mobile_app/constants.dart';
import 'package:ivfoods_mobile_app/features/auth/blocs/sign_in/Sign_in.dart';
import 'package:ivfoods_mobile_app/features/auth/domain/entities/sign_in_user.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';
import 'package:ivfoods_mobile_app/size_config.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  SignInBloc _signInBloc = sl<SignInBloc>();
  bool? testState;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    int day = 1;
    SizeConfig().init(context);
    Future<bool> _onBackPressed() async {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      return false;
    }
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: BlocProvider<SignInBloc>(
        create: (BuildContext context) => _signInBloc,
          child: BlocListener<SignInBloc, SignInState>(
            listener: (context, SignInState state) {
              if(state is SignInLoading){
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        duration: (state is SignInLoading) ? Duration(days: day) : Duration(seconds: day),
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.translate("connectionProgress"),
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
              if(state != SignInLoading){
                day = 0;
              }
              if(state is SignInError){
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text(state.message, style: TextStyle(fontFamily: "Milliard", color: Colors.white),), Icon(Icons.error, color: Colors.white,)],
                      ),
                      backgroundColor: kPrimaryColor,
                    ),
                  );
              }
              if(state is SignInSuccess){
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      duration: const Duration(seconds: 1),
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text(AppLocalizations.of(context)!.translate("connect"), style: TextStyle(fontFamily: "Milliard", color: Colors.white),), Icon(Icons.check, color: Colors.white,)],
                      ),
                      backgroundColor: kPrimaryColor,
                    ),
                  );
                Timer(Duration(seconds: 2), () => Navigator.pushNamed(context, "/chooseprofil"));
              }
            },

            child: BlocBuilder(
              bloc: sl<SignInBloc>(),
              builder: (context, SignInState state){
                return Scaffold(
                  body: SafeArea(
                    child: SingleChildScrollView(
                      child: Container(
                        width: size.width,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: getProportionateScreenHeight(35),
                            ),
                            Container(
                              height: getProportionateScreenHeight(227),
                              width: getProportionateScreenWidth(246),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    "images/logo.png",
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(20),
                            ),
                            Text(
                              AppLocalizations.of(context)!.translate("welcomeBack"),
                              style: TextStyle(
                                fontSize: fontSize(size: 40),
                                fontWeight: FontWeight.w500,
                                fontFamily: "Milliard",
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(20),),
                            Text(
                              AppLocalizations.of(context)!.translate("signInToContinue"),
                              style: TextStyle(
                                fontSize: fontSize(size: 18),
                                fontFamily: "Milliard",
                                color: Color(0XFF2C2627),
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(40),),
                            Container(
                              width: getProportionateScreenWidth(344),
                              child: TextFormField(
                                controller: username,
                                style: TextStyle(
                                  color: Color(0XFFB8B8B8),
                                  fontSize: fontSize(size: 16),
                                  fontFamily: "Milliard",
                                ),
                                cursorColor: Color(0XFFB8B8B8),
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
                                  ),
                                  focusColor: Color(0XFFB8B8B8),
                                  hintText: AppLocalizations.of(context)!.translate("userName"),
                                  hintStyle: TextStyle(
                                    color: Color(0XFFB8B8B8),
                                    fontSize: fontSize(size: 16),
                                    fontFamily: "Milliard",
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(50),),
                            Container(
                              width: getProportionateScreenWidth(344),
                              child: TextFormField(
                                controller: password,
                                obscureText: true,
                                style: TextStyle(
                                  color: Color(0XFFB8B8B8),
                                  fontSize: fontSize(size: 16),
                                  fontFamily: "Milliard",
                                ),
                                cursorColor: Color(0XFFB8B8B8),
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
                                  ),
                                  focusColor: Color(0XFFB8B8B8),
                                  hintText: AppLocalizations.of(context)!.translate("password"),
                                  hintStyle: TextStyle(
                                    color: Color(0XFFB8B8B8),
                                    fontSize: fontSize(size: 16),
                                    fontFamily: "Milliard",
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(25),),
                            InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, "/forgotpassword");
                              },
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  margin: EdgeInsets.only(left: 30),
                                  child: Text(
                                    AppLocalizations.of(context)!.translate("passwordForget"),
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                      fontFamily: "Milliard",
                                      fontSize: fontSize(size: 16),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(50),),
                            InkWell(
                              onTap: (){
                                SignInUser signInUser = new SignInUser(username: username.text, password: password.text);
                                _signInBloc.add(
                                  Submitted(
                                      signInUser: signInUser
                                  ),
                                );
                              },
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
                                child: Center(
                                  child: Text(
                                    AppLocalizations.of(context)!.translate("signIn"),
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
                            SizedBox(height: getProportionateScreenHeight(30),),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: RichText(
                                text: TextSpan(
                                  text: AppLocalizations.of(context)!.translate("contraTermsOne")+" ",
                                  style: TextStyle(
                                    fontFamily: "Milliard",
                                    fontSize: fontSize(size: 14),
                                    color: Colors.black,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(text: AppLocalizations.of(context)!.translate("contraTermsTwo"), style: TextStyle(fontFamily: "Milliard", fontSize: 14, color: kPrimaryColor),),
                                    TextSpan(text: ',', style: TextStyle(fontFamily: "Milliard", fontSize: 14,),),
                                  ],
                                ),
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: '',
                                style: TextStyle(
                                  fontFamily: "Milliard",
                                  fontSize: fontSize(size: 14),
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.w100,
                                ),
                                children: <TextSpan>[
                                  TextSpan(text: AppLocalizations.of(context)!.translate("contractTermsThree")+" ", style: TextStyle(fontFamily: "Milliard", fontSize: 14, color: Colors.black),),
                                  TextSpan(text: AppLocalizations.of(context)!.translate("contractTermsFour"), style: TextStyle(fontFamily: "Milliard", fontSize: 14, color: kPrimaryColor),),
                                ],
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(20),),
                            Container(
                              width: size.width,
                              height: getProportionateScreenHeight(100),
                              color: Colors.white,
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                    right: getProportionateScreenWidth(260),
                                    bottom: getProportionateScreenHeight(-125),
                                    child: Container(
                                      height: getProportionateScreenHeight(253),
                                      width: getProportionateScreenWidth(253),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            "images/pizza.png",
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
      ),
    );
  }
}
