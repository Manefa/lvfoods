import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/constants.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/user.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerDetail extends StatefulWidget {
  final User user;
  final String phoneTwo;

  const CustomerDetail({Key? key, required this.user, required this.phoneTwo, }) : super(key: key);
  @override
  _CustomerDetailState createState() => _CustomerDetailState();
}

class _CustomerDetailState extends State<CustomerDetail> {
  String phoneNumber="";
  @override
  Widget build(BuildContext context) {
      var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: size.width,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 25.h,),
                Row(
                  children: <Widget>[
                    SizedBox(width: 35.w,),
                    widget.user.picture != null ?
                    Container(
                      height: 76.h,
                      width: 77.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(widget.user.picture.toString()),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ):
                    Container(
                      height: 76.h,
                      width: 77.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color.fromRGBO(246, 246, 246, 1),
                      ),
                      child: Center(
                        child: Text(
                          widget.user.fullName![0],
                        style: TextStyle(
                          fontFamily: "Milliard",
                          fontSize: 35.sp,
                          color: Color.fromRGBO(188, 44, 61, 1),
                          fontWeight: FontWeight.w600,
                        ),
                    ),
                      ),
                    ),
                    SizedBox(width: 15.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.user.fullName!,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontFamily: "Milliard",
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 35.h,),
                Row(
                  children: <Widget>[
                    SizedBox(width: 35.w,),
                    Text(
                      AppLocalizations.of(context)!.translate("email"),
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: "Milliard",
                        color: Color(0XFF949494),
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Text(
                        widget.user.email.toString(),
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontFamily: "Milliard",
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    SizedBox(width: 35.w,),
                  ],
                ),
                SizedBox(height: 25.h,),
                Row(
                  children: <Widget>[
                    SizedBox(width: 35.w,),
                    Text(
                      AppLocalizations.of(context)!.translate("phones"),
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: "Milliard",
                        color: Color(0XFF949494),
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    if(widget.user.phones!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Text(
                        (widget.user.phones!.length == 1 ) ? widget.user.phones![0].code.toString()+" "+widget.user.phones![0].content.toString() : widget.user.phones![0].code.toString()+" "+widget.user.phones![0].content.toString()+" / "+ widget.user.phones![1].code.toString()+" "+widget.user.phones![1].content.toString(),
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontFamily: "Milliard",
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),

                    SizedBox(width: 35.w,),
                  ],
                ),
                SizedBox(height: 200.h,),
                Row(
                  children: [
                    SizedBox(width: 35.w,),
                    InkWell(
                      onTap: (){
                        print(widget.phoneTwo);
                        // phoneNumber = widget.user.phones![0].content.toString();
                        // widget.phoneTwo.isNotEmpty ? launch("tel://${widget.phoneTwo}") : launch("tel://$phoneNumber");
                      },
                      child: Container(
                        width: 340.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0XFF68D389),),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.call,
                                size: 25.sp,
                                color: Color(0XFF68D389),
                              ),
                              SizedBox(width: 30.w,),
                              Text(
                                AppLocalizations.of(context)!.translate("callCustomer"),
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: "Milliard",
                                  color: Color(0XFF68D389),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h,),
                //TODO: hide this while waiting for the update
                // Row(
                //   children: [
                //     SizedBox(width: 35.w,),
                //     Container(
                //       height: 45.h,
                //       width: 342.w,
                //       decoration: BoxDecoration(
                //         color: kPrimaryColor,
                //         borderRadius: BorderRadius.circular(5),
                //       ),
                //       child: Center(
                //         child: Text(
                //           AppLocalizations.of(context)!.translate("trackCustomer"),
                //           style: TextStyle(
                //             fontFamily: "Milliard",
                //             fontSize: 16.sp,
                //             fontWeight: FontWeight.w300,
                //             color: Colors.white
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(height: 30.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
