import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_product_details/domain/entities/get_product_details.dart';

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
  final GetProductDetails getProductDetails;
  const RatingMenuDisplay({Key? key, required this.getProductDetails}) : super(key: key);

  @override
  _RatingMenuDisplayState createState() => _RatingMenuDisplayState();
}

class _RatingMenuDisplayState extends State<RatingMenuDisplay> {
  @override
  Widget build(BuildContext context) {
    //List<RatingMenuModel> items = [comm1,comm2,comm1,comm1,];

    return widget.getProductDetails.product!.notices!.isNotEmpty ? Expanded(
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
                      itemCount: widget.getProductDetails.product!.notices!.length,
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

                                        image: DecorationImage(
                                          image: NetworkImage(widget.getProductDetails.product!.notices![index].user!.picture!),
                                        )
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
                                              widget.getProductDetails.product!.notices![index].user!.username!,
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
                                                    widget.getProductDetails.product!.notices![index].createdAt!,
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

                              widget.getProductDetails.product!.notices![index].comment == null ?
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
                                    widget.getProductDetails.product!.notices![index].comment!,
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
    ) : Container(
      child: Center(
        child: Container(
          height: 130.w,
          width: 130,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/empty2.png"),
              )
          ),
        ),
      ),
    );
  }
}
