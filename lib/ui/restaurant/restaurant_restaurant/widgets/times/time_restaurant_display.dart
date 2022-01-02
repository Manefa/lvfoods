import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/core/platform/lv_icons_resto.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/times/add_day/alert_dialogue_add_time.dart';


class HoursRestaurantModel{
  final String day;
  final String open;
  final String close;

  HoursRestaurantModel({required this.day, required this.close, required this.open});
}
HoursRestaurantModel items1 = new HoursRestaurantModel(
    day: "Monday",
    open: "07h : 30min",
    close: "21h : 30min"
);
HoursRestaurantModel items2 = new HoursRestaurantModel(
    day: "Tuesday",
    open: "07h : 30min",
    close: "21h : 30min"
);
HoursRestaurantModel items3 = new HoursRestaurantModel(
    day: "Friday",
    open: "07h : 30min",
    close: "21h : 30min"
);

class TimesRestaurantDisplay extends StatefulWidget {
  const TimesRestaurantDisplay({Key? key}) : super(key: key);

  @override
  _TimesRestaurantDisplayState createState() => _TimesRestaurantDisplayState();
}

class _TimesRestaurantDisplayState extends State<TimesRestaurantDisplay> {
  @override
  Widget build(BuildContext context) {
    List<HoursRestaurantModel> items = [items1, items2, items3];
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(416, 897),
        orientation: Orientation.portrait);
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 16.5.h,),
            //Edit Container
            Container(
              width: 344.w,
              height: 29.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      'Horaires',
                      style: TextStyle(
                        fontFamily: "Milliard",
                        fontSize: 18.sp,
                      )

                  ),
                  Container(
                    width: 87.w,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.1.w,
                        ),
                        borderRadius: BorderRadius.circular(6.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white12,
                            offset: Offset(0, 5),
                            spreadRadius: -17,
                            blurRadius: 20,
                          ),
                        ]
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            LvIconsResto.edit,
                            color: Color.fromRGBO(148, 148, 148,1),
                            size: 12.sp,
                          ),
                          SizedBox(width: 5.7.w,),
                          Text(
                              "Edit Infos",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromRGBO(148, 148, 148, 1),
                                fontFamily: "Milliard",
                                fontSize: 15.sp,
                              )
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 21.h,),
            //HoursList
            Center(
              child: ListView.builder(
                  itemCount: items.length,
                  clipBehavior: Clip.none,
                  shrinkWrap: true,
                  itemBuilder:  (BuildContext context, int index){
                    return Column(
                      children: [
                        Container(
                          height: 20.h,
                          width: 344.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                  items[index].day,
                                  style: TextStyle(
                                    color: Color.fromRGBO(148, 148, 148, 1),
                                    fontFamily: "Milliard",
                                    fontSize: 16.sp,
                                  )

                              ),

                              Container(
                                child: Row(
                                  children: [
                                    Text(
                                        items[index].open+" - "+items[index].close,
                                        style: TextStyle(
                                            fontFamily: "Milliard",
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.w200
                                        )

                                    ),
                                    SizedBox(width: 14.w,),
                                    //Remove Number
                                    Icon(
                                      Icons.close,
                                      color: Color.fromRGBO(148, 148, 148, 1),
                                      size: 16.sp,
                                    )
                                  ],
                                ),
                              )

                            ],
                          ),
                        ),
                        SizedBox(height: 24.h,)
                      ],
                    );
                  }
              ),
            ),
            SizedBox(height: 21.h,),
            //Add Another Day
            Container(
              width: 344.w,
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: (){
                    showDialog(
                        context: context,
                        builder:(BuildContext context){
                          return AlerDialogueAddTimeDisplay();
                        }
                    );
                  },
                  child: Text(
                    '+  Add another day',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Milliard",
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w100
                    ),
                  ),
                ),
              ),
            )


          ],
        ),
      ),

    );
  }
}
