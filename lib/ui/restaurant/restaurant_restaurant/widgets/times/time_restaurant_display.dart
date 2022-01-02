import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/constants.dart';
import 'package:ivfoods_mobile_app/core/platform/loading_widget.dart';
import 'package:ivfoods_mobile_app/core/platform/lv_icons_resto.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_restaurant/bloc/get_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/remove_hours/bloc/remove_hours.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/remove_phone/bloc/remove_phone.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/times/add_day/alert_dialogue_add_time.dart';
import 'package:shared_preferences/shared_preferences.dart';


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
  GetRestaurantBloc _getRestaurantBloc = sl<GetRestaurantBloc>();
  RemoveHoursBloc _removeHoursBloc = sl<RemoveHoursBloc>();
  String? nameRestaurant;

  @override
  Widget build(BuildContext context) {
    //List<HoursRestaurantModel> items = [items1, items2, items3];
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(416, 897),
        orientation: Orientation.portrait);
    nameRestaurant = sl<SharedPreferences>().getString('RESTAURANT_NAME');
    _getRestaurantBloc.add(StartGetRestaurant(name: nameRestaurant!));
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetRestaurantBloc>(
          create: (_) => _getRestaurantBloc,
        ),

        BlocProvider<RemoveHoursBloc>(
          create: (_) => _removeHoursBloc,
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<GetRestaurantBloc, GetRestaurantState>(
            listener: (context, state) {

            },
          ),
          BlocListener<RemoveHoursBloc, RemoveHoursState>(
            listener: (context, state) {
              if(state is RemoveHoursLoading){
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      duration: (state is RemoveHoursLoading) ? Duration(days: 1) : Duration(seconds: 1),
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "En cours...",
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

              if(state is RemoveHoursLoaded){
                _getRestaurantBloc.add(StartGetRestaurant(name: nameRestaurant!));
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              }

              if(state is RemoveHoursError){
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text(state.message + "Echec de la suppression", style: TextStyle(fontFamily: "Milliard", color: Colors.white),), Icon(Icons.error, color: Colors.white,)],
                      ),
                      backgroundColor: kPrimaryColor,
                    ),
                  );
              }
            },
          ),
        ],
        child: SingleChildScrollView(
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
                          ),
                      ),
                      // Container(
                      //   width: 87.w,
                      //   decoration: BoxDecoration(
                      //       border: Border.all(
                      //         color: Colors.grey,
                      //         width: 0.1.w,
                      //       ),
                      //       borderRadius: BorderRadius.circular(6.r),
                      //       boxShadow: [
                      //         BoxShadow(
                      //           color: Colors.white12,
                      //           offset: Offset(0, 5),
                      //           spreadRadius: -17,
                      //           blurRadius: 20,
                      //         ),
                      //       ]
                      //   ),
                      //   child: Center(
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Icon(
                      //           LvIconsResto.edit,
                      //           color: Color.fromRGBO(148, 148, 148,1),
                      //           size: 12.sp,
                      //         ),
                      //         SizedBox(width: 5.7.w,),
                      //         Text(
                      //             "Edit Infos",
                      //             textAlign: TextAlign.center,
                      //             style: TextStyle(
                      //               color: Color.fromRGBO(148, 148, 148, 1),
                      //               fontFamily: "Milliard",
                      //               fontSize: 15.sp,
                      //             )
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
                SizedBox(height: 21.h,),
                //HoursList
                BlocBuilder(
                  bloc: _getRestaurantBloc,
                  builder: (context, state){
                    if(state is GetRestaurantLoading){
                      return LoadingWidget();
                    }
                    if(state is GetRestaurantLoaded){
                      return Center(
                        child: ListView.builder(
                            itemCount: state.getRestaurant.restaurant!.hours!.length,
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
                                            state.getRestaurant.restaurant!.hours![index].day!,
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
                                                  state.getRestaurant.restaurant!.hours![index].hour!.open!+" - "+state.getRestaurant.restaurant!.hours![index].hour!.close!,
                                                  style: TextStyle(
                                                      fontFamily: "Milliard",
                                                      fontSize: 17.sp,
                                                      fontWeight: FontWeight.w200
                                                  )

                                              ),
                                              SizedBox(width: 14.w,),
                                              //Remove Number
                                              InkWell(
                                                onTap: (){
                                                  String hours = "";
                                                  hours = state.getRestaurant.restaurant!.hours![index].day!+"|"+state.getRestaurant.restaurant!.hours![index].hour!.open!+"|"+state.getRestaurant.restaurant!.hours![index].hour!.close!;
                                                  _removeHoursBloc.add(StartRemoveHours(name: nameRestaurant!, hours: hours));
                                                  print(hours);
                                                },
                                                child: Icon(
                                                  Icons.close,
                                                  color: Color.fromRGBO(148, 148, 148, 1),
                                                  size: 16.sp,
                                                ),
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
                      );
                    }

                    if(state is GetRestaurantError){
                      return Container(
                        child: Text("Aucun cas"+state.message.toString()),
                      );
                    }
                    return Container(
                      child: Text("Aucun cas"),
                    );
                  },
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
                            color: kPrimaryColor,
                            fontFamily: "Milliard",
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                  ),
                )


              ],
            ),
          ),

        ),
      ),
    );
  }
}
