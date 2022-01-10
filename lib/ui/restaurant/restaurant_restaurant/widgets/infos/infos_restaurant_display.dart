import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/constants.dart';
import 'package:ivfoods_mobile_app/core/platform/loading_widget.dart';
import 'package:ivfoods_mobile_app/core/platform/lv_icons_resto.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_restaurant/bloc/get_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_restaurant/domain/entities/styles.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_styles/bloc/get_styles.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_styles/domain/entities/style.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/infos/sub_widgets/alert_dialogue_add_phone.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/infos/sub_widgets/phones_display.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/menu/edit_restau/edit_restau.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InfosRestaurantModel{
  final String name;
  final String location;
  final String email;
  final bool statut;
  final String style;
  final String description;
  InfosRestaurantModel({required this.name,required this.location,required this.email,required this.statut,required this.style,required this.description,});
}

InfosRestaurantModel namekResto = new InfosRestaurantModel(
  name: "Tao Paie paie restau",
  location: "Namek, Celeste",
  email: "taopiepie@gmail.com",
  statut: true,
  style: "Namekien",
  description: "Rien a dire a part que je suis un chomeur  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ",
);
class InfosRestaurantDisplay extends StatefulWidget {
  final String name;
  const InfosRestaurantDisplay({Key? key, required this.name}) : super(key: key);

  @override
  _InfosRestaurantDisplayState createState() => _InfosRestaurantDisplayState();
}

class _InfosRestaurantDisplayState extends State<InfosRestaurantDisplay> {
  GetRestaurantBloc _getRestaurantBloc = sl<GetRestaurantBloc>();
  GetStylesBloc _getStylesBloc = sl<GetStylesBloc>();
  bool isSwitched = true;
  List<Style> styles = [];


  @override
  Widget build(BuildContext context) {
    _getRestaurantBloc.add(StartGetRestaurant(name: widget.name));
    _getStylesBloc.add(StartGetStyles());
    bool isSwitched = true;
    var nameRestaurant = sl<SharedPreferences>().getString('RESTAURANT_NAME');
    List<String> litems= ['+237 691 380 128','+237 677 589 625'];

    _getRestaurantBloc.add(StartGetRestaurant(name: widget.name));
    _getStylesBloc.add(StartGetStyles());
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetRestaurantBloc>(
          create: (_) => _getRestaurantBloc,
        ),

        BlocProvider<GetStylesBloc>(
          create: (_) => _getStylesBloc,
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<GetStylesBloc, GetStylesState>(
            listener: (context, state) {
              if(state is GetStylesLoaded){
                styles = state.getStylesMaster.styles!;
              }
            },
          ),
        ],
        child: SingleChildScrollView(
          child: BlocBuilder(
            bloc: _getRestaurantBloc,
            builder: (context, state){
              if(state is GetRestaurantLoading){
                return LoadingWidget();
              }

              if(state is GetRestaurantLoaded){
                (state.getRestaurant.restaurant!.status == "enable") ? isSwitched = true : isSwitched = false;
                return SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: 16.5.h,),
                        //Edit Container
                        InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => EditRestaurant(styles: styles, name: widget.name, getRestaurant: state.getRestaurant,)),
                            );
                          },
                          child: Container(
                            width: 344.w,
                            height: 29.h,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: 100.w,
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
                                    crossAxisAlignment: CrossAxisAlignment.center,

                                    children: [
                                      Icon(
                                        LvIconsResto.edit,
                                        color: Color.fromRGBO(148, 148, 148,1),
                                        size: 10.sp,
                                      ),
                                      SizedBox(width: 5.7.w,),
                                      Text(
                                          "Edit Infos",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color.fromRGBO(148, 148, 148, 1),
                                            fontFamily: "Milliard",
                                            fontSize: 13.sp,
                                          )
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 21.h,),


                        //InfosSection
                        //NameRestaurant
                        Container(
                          width: 344.w,
                          //NameRestaurant
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Nom restaurant",
                                style: TextStyle(
                                    color: Color.fromRGBO(148, 148, 148, 1),
                                    fontFamily: "Milliard",
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                              SizedBox(width: 82.w,),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    state.getRestaurant.restaurant!.name!,
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Milliard",
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w200
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 23.h,),
                        //Phone Number
                        Container(
                          width: 344.w,
                          //Phone
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Phones",
                                style: TextStyle(
                                    color: Color.fromRGBO(148, 148, 148, 1),
                                    fontFamily: "Milliard",
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      //PhoneNumberList
                                      PhonesDisplay(restaurantName: nameRestaurant!,),
                                      SizedBox(height: 8.h,),
                                      //AddNumberButton
                                      InkWell(
                                        onTap: (){
                                          showDialog(
                                              context: context,
                                              builder:(BuildContext context){
                                                return AlerDialogueAddPhoneDisplay();
                                              }
                                          );
                                        },
                                        child: Text(
                                          '+  Add phone number',
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                              color: kPrimaryColor,
                                              fontFamily: "Milliard",
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w100
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //Email
                        SizedBox(height: 23.h,),
                        Container(
                          width: 344.w,
                          //NameRestaurant
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment:CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Email",
                                style: TextStyle(
                                    color: Color.fromRGBO(148, 148, 148, 1),
                                    fontFamily: "Milliard",
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                              SizedBox(width: 82.w,),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    state.getRestaurant.restaurant!.email!,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Milliard",
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w200
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                        //Statut
                        SizedBox(height: 23.h,),
                        Container(
                          width: 344.w,
                          //NameRestaurant
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment:CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Status",
                                style: TextStyle(
                                    color: Color.fromRGBO(148, 148, 148, 1),
                                    fontFamily: "Milliard",
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                              SizedBox(width: 82.w,),


                              state.getRestaurant.restaurant!.status == "enable" ?Container(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child:Row(
                                    children: [
                                      Text(
                                        "Enable",
                                        style: TextStyle(
                                            color: Color.fromRGBO(188, 44, 61, 1),
                                            fontFamily: "Milliard",
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w100
                                        ),
                                      ),
                                      SizedBox(width: 20.w,),
                                      SizedBox(
                                        height: 15.h,
                                        width: 31.w,
                                        child: Switch(
                                          value: isSwitched,
                                          onChanged: (value){
                                            setState(() {
                                              isSwitched=false;

                                            });
                                          },
                                          activeTrackColor: Color.fromRGBO(188, 44, 61, 1),
                                          inactiveTrackColor: Color.fromRGBO(223, 222, 221, 1),
                                          activeColor: Colors.white,
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ): Container(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child:Row(
                                    children: [
                                      Text(
                                        "Disable",
                                        style: TextStyle(
                                            color: Color.fromRGBO(188, 44, 61, 1),
                                            fontFamily: "Milliard",
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w100
                                        ),
                                      ),
                                      SizedBox(width: 20.w,),
                                      SizedBox(
                                        height: 15.h,
                                        width: 31.w,
                                        child: Switch(
                                          value: isSwitched,
                                          onChanged: (value){
                                            setState(() {
                                              isSwitched=false;
                                            });
                                          },
                                          activeTrackColor: Color.fromRGBO(188, 44, 61, 1),
                                          inactiveTrackColor: Color.fromRGBO(223, 222, 221, 1),
                                          activeColor: Colors.white,
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //StyleRestau
                        SizedBox(height: 23.h,),
                        Container(
                          width: 344.w,
                          //NameRestaurant
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Style Resto",
                                style: TextStyle(
                                    color: Color.fromRGBO(148, 148, 148, 1),
                                    fontFamily: "Milliard",
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                              SizedBox(width: 82.w,),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    removeLastCharacter(getStyles(state.getRestaurant.restaurant!.styles)),
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Milliard",
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w200
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                        //Localisation
                        SizedBox(height: 23.h,),
                        Container(
                          width: 344.w,
                          //NameRestaurant
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Localisation",
                                style: TextStyle(
                                    color: Color.fromRGBO(148, 148, 148, 1),
                                    fontFamily: "Milliard",
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      state.getRestaurant.restaurant!.address!,
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          color: Color.fromRGBO(188, 44, 61, 1),
                                          fontFamily: "Milliard",
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w100
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //Description
                        SizedBox(height: 23.h,),
                        Container(
                          width: 344.w,
                          //NameRestaurant
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Description",
                                  style: TextStyle(
                                      color: Color.fromRGBO(148, 148, 148, 1),
                                      fontFamily: "Milliard",
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                              SizedBox(height: 6.h,),
                              Text(
                                state.getRestaurant.restaurant!.description!,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Milliard",
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w100
                                ),
                              ),
                              SizedBox(height: 20.h,),
                            ],
                          ),
                        ),
                        SizedBox(height: 80.h,),
                      ],
                    ),
                  ),
                );
              }

            if(state is GetRestaurantError){
              return Container(
                height: 130.w,
                width: 130,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/error1.png"),
                        )
                    ),
                  ),
                ),
              );
            }

              return Container(
                height: 130.w,
                width: 130,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/error2.png"),
                        )
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

  String getStyles(List<Styles>? styles) {
    String categories ="";
    styles!.forEach((element) {
      categories = categories + element.name! + ", ";
    });

    return categories;
  }

  String removeLastCharacter(String str) {
    String result="";
    if ((str != null) && (str.length > 0)) {
      result = str.substring(0, str.length - 2);
    }

    return result;
  }
}
