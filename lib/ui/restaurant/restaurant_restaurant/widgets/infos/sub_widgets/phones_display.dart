import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/constants.dart';
import 'package:ivfoods_mobile_app/core/platform/loading_widget.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_restaurant/bloc/get_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/remove_phone/bloc/remove_phone.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PhonesDisplay extends StatefulWidget {
  final String restaurantName;
  const PhonesDisplay({Key? key, required this.restaurantName}) : super(key: key);

  @override
  _PhonesDisplayState createState() => _PhonesDisplayState();
}

class _PhonesDisplayState extends State<PhonesDisplay> {
  RemovePhoneBloc _removePhoneBloc = sl<RemovePhoneBloc>();
  GetRestaurantBloc _getRestaurantBloc = sl<GetRestaurantBloc>();

  @override
  Widget build(BuildContext context) {

    var nameRestaurant = sl<SharedPreferences>().getString('RESTAURANT_NAME');
    _getRestaurantBloc.add(StartGetRestaurant(name: nameRestaurant!));
    return MultiBlocProvider(
      providers: [
        BlocProvider<RemovePhoneBloc>(
          create: (_) => _removePhoneBloc,
        ),

        BlocProvider<GetRestaurantBloc>(
          create: (_) => _getRestaurantBloc,
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<GetRestaurantBloc, GetRestaurantState>(
            listener: (context, state) {
              if(state is GetRestaurantLoading){

              }

              if(state is GetRestaurantLoaded){

              }

              if(state is GetRestaurantError){

              }
            },
          ),

          BlocListener<RemovePhoneBloc, RemovePhoneState>(
            listener: (context, state){
              if(state is RemovePhoneLoading){
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      duration: (state is RemovePhoneLoading) ? Duration(days: 1) : Duration(seconds: 1),
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

              if(state is RemovePhoneLoaded){
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                setState(() {

                });
              }

              if(state is RemovePhoneError){
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
        child: BlocBuilder(
          bloc: _getRestaurantBloc,
          builder: (context, state){
            if(state is GetRestaurantLoading){
              return LoadingWidget();
            }

            if(state is GetRestaurantLoaded){
              return Container(
                child: state.getRestaurant.restaurant!.phones!.isNotEmpty ?
                ListView.builder(
                    itemCount: state.getRestaurant.restaurant!.phones!.length,
                    clipBehavior: Clip.none,
                    shrinkWrap: true,
                    itemBuilder:  (BuildContext context, int index){
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  state.getRestaurant.restaurant!.phones![index].code.toString()+" "+state.getRestaurant.restaurant!.phones![index].content.toString(),
                                  style: TextStyle(
                                    fontFamily: "Milliard",
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w200,
                                  ),
                                ),
                              ),
                              SizedBox(width: 14.w,),
                              InkWell(
                                onTap: (){
                                  String phone = state.getRestaurant.restaurant!.phones![index].code.toString()+"|"+state.getRestaurant.restaurant!.phones![index].content!.toString();
                                  print(phone);
                                  _removePhoneBloc.add(StartRemovePhone(phone: phone, name: widget.restaurantName));
                                },
                                child: Icon(
                                  Icons.close,
                                  color: Color.fromRGBO(148, 148, 148, 1),
                                  size: 16.sp,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h,)
                        ],
                      );
                    }
                )
                    :Align(
                  alignment: Alignment.centerRight,
                      child: Text(
                  "Aucun numero",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontFamily: "Milliard",
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w200,
                  ),
                ),
                    )
              );
            }

            if(state is GetRestaurantError){
              Container(
                height: 130.h,
                width: 130.w,
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
    );
  }
}
