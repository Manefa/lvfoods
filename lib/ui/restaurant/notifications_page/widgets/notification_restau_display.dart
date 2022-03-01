import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/notifications_page/widgets/notification_restau_details.dart';
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
NotificationModel items2 = new NotificationModel(
    title: "Order still pending",
    image: "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMTEhUSEBMWFhUWGBkVGBUYFhYYFxcgGhYXFxoXFRgaHighGB8lHRcYITEhJSorLy4uFx8zODMtNygtLisBCgoKDg0OGxAQGzUlICUtLy0tMC0vLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLf/AABEIAOEA4QMBIgACEQEDEQH/xAAcAAEAAgIDAQAAAAAAAAAAAAAABgcEBQECAwj/xABREAABAwIDAwcFDAYGCQUAAAABAAIDBBEFEiEGMUEHEyIyUWFxFBVCgZEWI1JUVZKTobHB0eEzU2JygtIkQ5SksuIXNERFY3Oi8PE1ZIOEwv/EABsBAQACAwEBAAAAAAAAAAAAAAADBQECBAYH/8QAOxEAAQMCBAIIAwUHBQAAAAAAAQACAwQRBRIhMUFREyJhcYGRodEyscEGFEJS0iNigpKi8PEVFiVy4f/aAAwDAQACEQMRAD8AvBEREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREXF0RcoihW321stCY2xxsPONcc7idC0i4sN+8cVq94YLnZTU9PJUSCOMXJ8FNboqOquUKuebCQM19CMfa66uHA5zJTwyONy+Njie0loJKjinbISGrsrsLnomtdLbrcjfZbBFg4xPzcEsgNi2NzgeyzSVT9Hyi1zNHPbIL+nGL+1tklnbHbNxWtDhk9a1xht1bbm26u5FCtg9sJa18kckTW5Gh2dpNjc2AynduPHgpqFIx4eLhc1RTyU8hikFiERLpdbKBERERERERERERERERERERERERERERERERERERRPajbinpCWA87KP6tvo/vu3N8N6g+F8oFQ6sjkneBETkdGAAxocbZu0kG2p4XWy5VNmbHyyIaEgTAewSfYD6lWp0Pgq2omka+2wC9vg+F0NRSZ93EWJP4T2DYW4L6bDr7lBuVqiz0jZRvieD6nAsP1kH1LN5OMa8ppA1xvJD727tNh0XettvWCvDlMx6CCmdBIC+SoaWsjbv7M57ACR4nQLseWvjJ5heWhz0VYM27Ha+G/oqYYNRv3q/NhZc1BT90Yb83T7l871scrHZZWuY7flNxv3aKwdg8Sq/I3+Rnn5I3aw5g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RERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERF/9k=",
    statut: true,
    time: "10 hous ago",
    description: "Lorem Ipsum Is Simply Dummy Text Of The Prin sdjkkkkkkkkkkkkkkkkkkkkkkkkkkjdjjjdjdjjjdjjcncnncncncneuueueueoaoaooiozizizizieuuee"
);

class NotificationRestauDisplay extends StatefulWidget {
  const NotificationRestauDisplay({Key? key}) : super(key: key);

  @override
  _NotificationRestauDisplayState createState() => _NotificationRestauDisplayState();
}

class _NotificationRestauDisplayState extends State<NotificationRestauDisplay> {
  @override
  Widget build(BuildContext context) {
    List<NotificationModel> items = [items1,items2,items1];
    final Color _containerHomepage;

    return SingleChildScrollView(
      child: Column(
        children: [
          //New Notification
          //Title
          Center(
            child: Container(
              width: 344.w,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppLocalizations.of(context)!.translate("new"),
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Milliard",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 25.h,),
          //NewList
          ListView.builder(
              shrinkWrap: true,
              clipBehavior: Clip.none,
              itemCount:items.length,
              itemBuilder: (BuildContext context, int index){
                return  InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NotificationRestauDetails()),
                    );
                    setState(() {
                      if(items[index].statut== true){
                        items[index].statut== false;
                      }
                      print(items[index].statut);
                    });
                  },
                  child: Container(
                    width:416,
                    height: 93.h,
                    color: items[index].statut== true? Colors.white: Color.fromRGBO(248, 235, 236, 1),
                    child: Center(
                        child:Container(
                          width: 344.w,
                          height: 55.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    //Image
                                    items[index].image == null ?
                                    Container(
                                      height: 55.r,
                                      width: 55.r,
                                      decoration: BoxDecoration(
                                          color: Color.fromRGBO(255, 242, 218, 1),
                                          borderRadius: BorderRadius.circular(10.r)
                                      ),
                                      child: Center(
                                        child: Text(
                                          items[index].title[0].toUpperCase()+items[index].title[1].toUpperCase(),
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
                                                items[index].image!,
                                              )
                                          )
                                      ),
                                    ),
                                    SizedBox(width: 12.w,),
                                    //Tile Hours Description
                                    Container(
                                      height: 55.h,
                                      width: 229.w,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          //Title
                                          Container(
                                            child: Align(
                                              alignment:Alignment.centerLeft,
                                              child: Text(
                                                items[index].title,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: Color.fromRGBO(44, 38, 39,1),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 17.sp,
                                                    fontFamily: "Milliard"
                                                ),
                                              ),
                                            ),
                                          ),
                                          //Description
                                          Container(
                                            child: Align(
                                              alignment:Alignment.centerLeft,
                                              child: Text(
                                                items[index].description,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: Color.fromRGBO(44, 38, 39,1),
                                                    fontSize: 13.sp,
                                                    fontFamily: "Milliard"
                                                ),
                                              ),
                                            ),
                                          ),
                                          //Time
                                          Container(
                                            child: Align(
                                              alignment:Alignment.centerLeft,
                                              child: Text(
                                                items[index].time,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.start,
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
                              items[index].statut == false?
                              Container(
                                height: 7.r,
                                width: 7.r,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(188, 44, 61,1),
                                    borderRadius: BorderRadius.circular(100.r)
                                ),
                              )
                                  :SizedBox()
                            ],
                          ),
                        )
                    ),
                  ),
                );
              }
          ),
          SizedBox(height: 16,),
          //Promotion Notification
          //Title
          Center(
            child: Container(
              width: 344.w,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppLocalizations.of(context)!.translate("promo"),
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Milliard",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 25.h,),
          //PromoList
          ListView.builder(
              shrinkWrap: true,
              clipBehavior: Clip.none,
              itemCount:items.length,
              itemBuilder: (BuildContext context, int index){
                return  InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NotificationRestauDetails()),
                    );
                    setState(() {
                      if(items[index].statut== true){
                        items[index].statut== false;
                      }
                      print(items[index].statut);
                    });
                  },
                  child: Container(
                    width:416,
                    height: 93.h,
                    color: items[index].statut== true? Colors.white: Color.fromRGBO(248, 235, 236, 1),
                    child: Center(
                        child:Container(
                          width: 344.w,
                          height: 55.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    //Image
                                    items[index].image == null ?
                                    Container(
                                      height: 55.r,
                                      width: 55.r,
                                      decoration: BoxDecoration(
                                          color: Color.fromRGBO(255, 242, 218, 1),
                                          borderRadius: BorderRadius.circular(10.r)
                                      ),
                                      child: Center(
                                        child: Text(
                                          items[index].title[0].toUpperCase()+items[index].title[1].toUpperCase(),
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
                                                items[index].image!,
                                              )
                                          )
                                      ),
                                    ),
                                    SizedBox(width: 12.w,),
                                    //Tile Hours Description
                                    Container(
                                      height: 55.h,
                                      width: 229.w,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          //Title
                                          Container(
                                            child: Align(
                                              alignment:Alignment.centerLeft,
                                              child: Text(
                                                items[index].title,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: Color.fromRGBO(44, 38, 39,1),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 17.sp,
                                                    fontFamily: "Milliard"
                                                ),
                                              ),
                                            ),
                                          ),
                                          //Description
                                          Container(
                                            child: Align(
                                              alignment:Alignment.centerLeft,
                                              child: Text(
                                                items[index].description,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: Color.fromRGBO(44, 38, 39,1),
                                                    fontSize: 13.sp,
                                                    fontFamily: "Milliard"
                                                ),
                                              ),
                                            ),
                                          ),
                                          //Time
                                          Container(
                                            child: Align(
                                              alignment:Alignment.centerLeft,
                                              child: Text(
                                                items[index].time,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.start,
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
                              items[index].statut == false?
                              Container(
                                height: 7.r,
                                width: 7.r,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(188, 44, 61,1),
                                    borderRadius: BorderRadius.circular(100.r)
                                ),
                              )
                                  :SizedBox()
                            ],
                          ),
                        )
                    ),
                  ),
                );
              }
          ),

        ],
      ),
    );
  }
}
