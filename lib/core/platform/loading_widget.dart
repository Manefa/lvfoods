import 'package:flutter/material.dart';
import 'package:ivfoods_mobile_app/constants.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
     Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Center(
        child: CircularProgressIndicator(
          color: kPrimaryColor,
        ),
      ),
    );
  }
}