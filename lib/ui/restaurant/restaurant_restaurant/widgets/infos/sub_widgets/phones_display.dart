import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhonesDisplay extends StatefulWidget {
  const PhonesDisplay({Key? key}) : super(key: key);

  @override
  _PhonesDisplayState createState() => _PhonesDisplayState();
}

class _PhonesDisplayState extends State<PhonesDisplay> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(416, 897),
        orientation: Orientation.portrait);
    return Container(
      child: ListView.builder(
          itemCount: 5,
          clipBehavior: Clip.none,
          shrinkWrap: true,
          itemBuilder:  (BuildContext context, int index){
            return Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                          "+237 697 00 27 90",
                          style: TextStyle(
                              fontFamily: "Milliard",
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w200,
                          ),
                      ),
                    ),
                    SizedBox(width: 14.w,),
                    Icon(
                      Icons.close,
                      color: Color.fromRGBO(148, 148, 148, 1),
                      size: 16.sp,
                    ),
                  ],
                ),
                SizedBox(height: 20.h,)
              ],
            );
          }
      ),
    );
  }
}
