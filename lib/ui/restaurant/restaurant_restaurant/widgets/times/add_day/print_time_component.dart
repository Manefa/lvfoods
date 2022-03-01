import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/constants.dart';

class PrintDateComponent extends StatefulWidget {
  final String time;
  final VoidCallback onclick;

  const PrintDateComponent({Key? key, required this.time, required this.onclick}) : super(key: key);

  @override
  _PrintDateComponentState createState() => _PrintDateComponentState();
}

class _PrintDateComponentState extends State<PrintDateComponent> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: InkWell(
        onTap: widget.onclick,
        child: Row(
          children: [
            Text(
              widget.time,
              style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.bold
              ),
            ),
            Expanded(child: SizedBox()),
            Icon(
              Icons.more_time,
              color: kPrimaryColor,
              size: 35.sp,
            ),
          ],
        ),
      ),
    );
  }
}
