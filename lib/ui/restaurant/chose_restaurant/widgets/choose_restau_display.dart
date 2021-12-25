import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ChooseRestaurantModel{
  final String image;
  final String name;
  final bool statut;

  ChooseRestaurantModel({required this.image,required this.name,required this.statut,});
}

ChooseRestaurantModel items1 = new ChooseRestaurantModel(
    image:'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80',
    name: "Modiqui restaurant",
    statut: true
);

ChooseRestaurantModel items2 = new ChooseRestaurantModel(
    image:'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80',
    name: "Memphis rest",
    statut: false
);


class ChooseRestaurantDisplay extends StatefulWidget {
  const ChooseRestaurantDisplay({Key? key}) : super(key: key);

  @override
  _ChooseRestaurantDisplayState createState() => _ChooseRestaurantDisplayState();
}

class _ChooseRestaurantDisplayState extends State<ChooseRestaurantDisplay> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(416, 897),
        orientation: Orientation.portrait);
    List<ChooseRestaurantModel> items = [items1, items2,items1, items2,items1, items2];
    return SingleChildScrollView(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: items.length,
          clipBehavior: Clip.none,
          itemBuilder: (BuildContext context, int index){
            return Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, "/restaurantnavigatorpage");
                  },
                  child: Container(
                      height: 110.h,
                      width: 344.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.36),
                                spreadRadius: -3,
                                blurRadius: 10,
                                offset: Offset(0, 5)
                            )
                          ]
                      ),
                      child:Center(
                        child: Container(
                          width: 300.w,
                          height: 50.h,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      height: 77.h,
                                      width: 76.r,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8.r),
                                        image: const DecorationImage(
                                          image: NetworkImage(
                                              'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 20.w,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          items[index].name,
                                          style: TextStyle(
                                            fontFamily: "Milliard",
                                            fontSize:19.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(height: 4.h,),


                                        items[index].statut==true?
                                        Container(
                                          width: 110.w,
                                          height: 21.h,
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(104, 211, 137, 1),
                                              borderRadius: BorderRadius.circular(6.r)
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Restaurant Ouvert',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontFamily: "Milliard",
                                                  color: Colors.white
                                              ),
                                            ),
                                          ),
                                        )
                                            :Container(
                                          width: 110.w,
                                          height: 21.h,
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(251, 182, 52, 1),
                                              borderRadius: BorderRadius.circular(6.r)
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Restaurant Fermé',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily: "Milliard",
                                                  fontSize: 12.sp,
                                                  color: Colors.white
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded ,
                                color: Color(0XFFBCBCBC),
                                size: 15.sp,
                              ),
                            ],
                          ),
                        ),
                      )
                  ),
                ),
                SizedBox(height: 32.h,)
              ],
            );

          }
      ),
    );
  }
}
