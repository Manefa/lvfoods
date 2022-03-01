import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';
class NotificationModel{
  final String ? image;
  final String title;
  final String time;
  final String description;
  final bool statut;

  NotificationModel({required this.time, this.image,required this.title,required this.statut, required this.description});
}
NotificationModel items1 = new NotificationModel(
    title: "Order still pending",
    statut: false,
    time: "3 hous ago",
    description: "Lorem Ipsum Is Simply Dummy Text Of The Prin sdjkkkkkkkkkkkkkkkkkkkkkkkkkkjdjjjdjdjjjdjjcncnncncncneuueueueoaoaooiozizizizieuuee"
);
class NotificationRestauDetails extends StatefulWidget {
  const NotificationRestauDetails({Key? key}) : super(key: key);

  @override
  _NotificationRestauDetailsState createState() => _NotificationRestauDetailsState();
}

class _NotificationRestauDetailsState extends State<NotificationRestauDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          AppLocalizations.of(context)!.translate("notifications"),
          style: TextStyle(
              color: Colors.black,
              fontFamily: "Milliard",
              fontSize: 20.sp,
              fontWeight: FontWeight.w400
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: 344.w,
                child:Row(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          //Image
                          items1.image == null ?
                          Container(
                            height: 55.r,
                            width: 55.r,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 242, 218, 1),
                                borderRadius: BorderRadius.circular(10.r)
                            ),
                            child: Center(
                              child: Text(
                                items1.title[0].toUpperCase()+items1.title[1].toUpperCase(),
                                style: TextStyle(
                                  color: Color.fromRGBO(251, 182, 52, 1),
                                  fontSize: 25.sp,
                                  fontFamily: "Milliard",
                                  fontWeight: FontWeight.w500,

                                ),
                              ),
                            ),
                          )
                              : Container(
                            height: 55.r,
                            width: 55.r,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                image: DecorationImage(
                                    image: NetworkImage(
                                      items1.image!,
                                    )
                                )
                            ),
                          ),
                          SizedBox(width: 12.w,),
                          //Tile Hours
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //Title
                                Container(
                                  child: Align(
                                    alignment:Alignment.centerLeft,
                                    child: Text(
                                      items1.title,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Color.fromRGBO(44, 38, 39,1),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 20.sp,
                                          fontFamily: "Milliard"
                                      ),
                                    ),
                                  ),
                                ),
                                //Time
                                Container(
                                  width: 100.w,
                                  child: Align(
                                    alignment:Alignment.centerLeft,
                                    child: Text(
                                      items1.time,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Color.fromRGBO(148, 148, 148,1),
                                          fontSize: 13.sp,
                                          fontFamily: "Milliard"
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
                  ],
                ) ,
              ),
              SizedBox(height: 30.h,),
              //Description
              Container(
                width: 344.w,
                child: Align(
                  alignment:Alignment.centerLeft,
                  child: Text(
                    items1.description,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color.fromRGBO(44, 38, 39,1),
                        fontSize: 18.sp,
                        fontFamily: "Milliard"
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
}
