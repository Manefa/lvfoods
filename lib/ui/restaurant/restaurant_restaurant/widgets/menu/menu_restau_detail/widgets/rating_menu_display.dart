import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingMenuModel{
  final String name;
  final String ? image;
  final String date;
  final int rate;
  final String ? commentaire;

  RatingMenuModel({required this.name, required this.date, required this.rate, this.image, this.commentaire});
}
RatingMenuModel comm1 = new RatingMenuModel(
    name: "Pauline Mnomo",
    image:'images/Hilton_Emblema.jpg',
    date: "Yesterday 10:35 AM",
    rate: 5,
    commentaire: "Lorem Ipsum is simply dummy text of the printing and types etting industr lorem Ipsum has."
);

RatingMenuModel comm2 = new RatingMenuModel(
  name: "Julien Manga",
  image:'images/Hilton_Emblema.jpg',
  date: "Yesterday 10:35 AM",
  rate: 5,
);

class RatingMenuDisplay extends StatefulWidget {
  const RatingMenuDisplay({Key? key}) : super(key: key);

  @override
  _RatingMenuDisplayState createState() => _RatingMenuDisplayState();
}

class _RatingMenuDisplayState extends State<RatingMenuDisplay> {
  @override
  Widget build(BuildContext context) {
    List<RatingMenuModel> items = [comm1,comm2,comm1,comm1,];
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(416, 897),
        orientation: Orientation.portrait);
    return Expanded(
      child:Center(
        child: Container(
          width: 344.w,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 19.h,),
                  ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      clipBehavior: Clip.none,
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index){
                        return Container(
                          child: Column(
                            children: [
                              Container(
                                height: 47.h,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 47.r,
                                      height: 47.r,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(9.r),
                                          color: Colors.red
                                      ),
                                    ),
                                    SizedBox(width: 17.w,),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          //Name
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              items[index].name,
                                              style: TextStyle(
                                                fontFamily: "Milliard",
                                                fontWeight: FontWeight.w300,
                                                fontSize: 16.sp,
                                              ),

                                            ),
                                          ),
                                          //Rate & Date
                                          Container(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  //Rate Container
                                                ),
                                                Text(
                                                  items[index].date,
                                                  style: TextStyle(
                                                    fontFamily: "Milliard",
                                                    color: Color.fromRGBO(148, 148, 148, 1),
                                                    fontSize: 13.sp,
                                                  ),

                                                ),
                                              ],
                                            ),
                                          )

                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 9.h,),

                              items[index].commentaire==null?
                              Column(
                                children: [
                                  SizedBox(height: 14.5.h,),
                                  Divider(),
                                  SizedBox(height: 14.5.h,),
                                ],
                              )
                                  :
                              Column(
                                children: [
                                  Text(
                                    items[index].commentaire!,
                                    style: TextStyle(
                                      fontFamily: "Milliard",
                                      fontSize: 14.sp,
                                      color: Color.fromRGBO(148, 148, 148, 1),
                                    ),

                                  ),
                                  SizedBox(height: 14.5.h,),
                                  Divider(),
                                  SizedBox(height: 14.5.h,),
                                ],
                              )

                            ],
                          ),

                        );
                      }
                  ),
                  SizedBox(height: 60.h,)
                ],
              ),
            ),

          ),
        ),
      ) ,
    );
  }
}
