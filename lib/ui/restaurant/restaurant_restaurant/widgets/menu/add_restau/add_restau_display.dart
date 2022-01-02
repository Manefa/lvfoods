import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:ivfoods_mobile_app/constants.dart';
import 'package:ivfoods_mobile_app/core/platform/alert_dialog/country_code_picker.dart';
import 'package:ivfoods_mobile_app/core/platform/lv_icons_resto.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_restaurant/bloc/add_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_restaurant/domain/entities/for_create_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_styles/domain/entities/style.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/menu/add_restau/widgets/choice_chip.dart';

class AddRestauDisplay extends StatefulWidget {
  final List<Style> styles;
  const AddRestauDisplay({Key? key, required this.styles}) : super(key: key);

  @override
  _AddRestauDisplayState createState() => _AddRestauDisplayState();
}

class _AddRestauDisplayState extends State<AddRestauDisplay> {
  AddRestaurantBloc _addRestaurantBloc = sl<AddRestaurantBloc>();
  TextEditingController restaurantNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController phoneController = TextEditingController();



  final formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');
  PhoneNumber number2 = PhoneNumber(dialCode: '+237');
  int _selectedIndex=0;
  bool isSwitched = true;
  List<int> mySelected = List.empty();
  List<Style>? styleList;
  // List<String> _restauStyleOptions = [
  //   'Senegalais',
  //   'Kmer',
  //   'Bami',
  //   'Douala',
  //   'Francais',
  // ];
  String style="";
  XFile? _imageProfile;
  XFile? _imageCover;

  @override
  void initState() {
    styleList = widget.styles;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(416, 897),
        orientation: Orientation.portrait);
    List<int> selectedList = [];
    List<String> _styleOptionsTwo = [];

    if(styleList != null){
      styleList!.forEach((element) {
        _styleOptionsTwo.add(element.name!);
      });
    }
    int day = 1;
    return BlocProvider<AddRestaurantBloc>(
      create: (_) => _addRestaurantBloc,
      child: BlocListener(
        bloc: _addRestaurantBloc,
        listener: (context, state){
          if(state is AddRestaurantLoading){
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  duration: (state is AddRestaurantLoading) ? Duration(days: day) : Duration(seconds: day),
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

          if(state != AddRestaurantLoading){
            day = 0;
          }

          if(state is AddRestaurantLoaded){
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            Navigator.pop(context);
          }

          if(state is AddRestaurantError){
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text(state.message + "Echec de l'ajout", style: TextStyle(fontFamily: "Milliard", color: Colors.white),), Icon(Icons.error, color: Colors.white,)],
                  ),
                  backgroundColor: kPrimaryColor,
                ),
              );
          }
        },

        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                //LogoAndSave
                Container(
                  height: 57.h,
                  width: 344.w,
                  //color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            //Image
                            Container(
                              height: 57.h,
                              width: 57.w,
                              child: _imageProfile == null ? CircleAvatar(
                                backgroundColor: Colors.red,
                              ): CircleAvatar(
                                backgroundImage: FileImage(
                                  File(_imageProfile!.path),
                                ),
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                            SizedBox(width: 11.w,),
                            //UploadIcon
                            InkWell(
                              onTap: (){
                                _showPicker(context);
                              },
                              child: Text(
                                "Upload Logo",
                                style: TextStyle(
                                  color: Color.fromRGBO(188, 44, 61, 1),
                                  fontSize: 18.sp,
                                  fontFamily: "Milliard",
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 26.h,),
                //UploadImage
                Container(
                  width: 344.w,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Upload Slide Cover Image",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontFamily: "Milliard",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 23.h,),
                _imageCover == null ? InkWell(
                  onTap: (){
                    _showPickerCover(context);
                  },
                  child: Container(
                    height: 42.h,
                    width: 344.w,
                    child: DottedBorder(
                        color: Color.fromRGBO(188, 44, 61, 1),
                        strokeWidth: 0.2,
                        dashPattern: [10,6],
                        child:Center(
                            child:Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  LvIconsResto.upload,
                                  color: Color.fromRGBO(188, 44, 61, 1),
                                  size: 16.sp,
                                ),
                                SizedBox(width: 19.w,),
                                Text(
                                  "Upload Images Here",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Color.fromRGBO(188, 44, 61, 1),
                                      fontSize: 20.sp,
                                      fontFamily: "Milliard",

                                      fontWeight: FontWeight.w200
                                  ),
                                )
                              ],
                            )
                        )
                    ),
                  ),
                ): InkWell(
                  onTap: (){
                    _showPickerCover(context);
                  },
                  child: Container(
                    height: 50.h,
                    width: 344.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0XFFF4F4F4),
                            spreadRadius: 2,
                            blurRadius: 6,
                          )
                        ]
                    ),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 15.w,),
                        Icon(
                          Icons.image,
                          color: Color(0XFFCBCBCB),
                        ),
                        SizedBox(width: 14.w,),
                        SizedBox(
                          width: 120.w,
                          child: Text(
                            _imageCover!.name,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        Icon(
                          Icons.cancel,
                          color: Color(0XFFCBCBCB),
                          size: 20.sp,
                        ),
                        SizedBox(width: 22.w,),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 26.h,),
                //Restau Name
                Container(
                  width: 344.w,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Restaurant Name",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontFamily: "Milliard",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 7.h,),
                restauName(),
                //Phone Number
                SizedBox(height: 16.h,),
                Container(
                  width: 344.w,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Phone Number",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontFamily: "Milliard",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 7.h,),
                phoneNum(),
                SizedBox(height: 16.h,),
                //EmailRestau
                Container(
                  width: 344.w,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Email Restaurant",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontFamily: "Milliard",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 7.h,),
                restauEmail(),
                //Phone Number
                SizedBox(height: 16.h,),
                //Localisation
                Container(
                  width: 344.w,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Localisation",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontFamily: "Milliard",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 7.h,),
                localisationRestau(),
                //SizedBox(height: 21.h,),
                //Statut
                // Container(
                //   height: 21.h,
                //   width: 344.w,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Container(
                //         child: Text(
                //           "Status",
                //           style: TextStyle(
                //             color: Colors.black,
                //             fontSize: 18.sp,
                //             fontFamily: "Milliard",
                //           ),
                //         ),
                //       ),
                //       Container(
                //         child: Row(
                //           children: [
                //             isSwitched ? Text(
                //               "Enable",
                //               style: TextStyle(
                //                 color: Colors.black,
                //                 fontSize: 18.sp,
                //                 fontFamily: "Milliard",
                //               ),
                //             ) : Text(
                //               "Disable",
                //               style: TextStyle(
                //                 color: Colors.black,
                //                 fontSize: 18.sp,
                //                 fontFamily: "Milliard",
                //               ),
                //             ) ,
                //             SizedBox(width: 19.w,),
                //             //Switch
                //             SizedBox(
                //               height: 15.h,
                //               width: 31.w,
                //               child: Switch(
                //                 value: isSwitched,
                //                 onChanged: (value){
                //                   setState(() {
                //                     isSwitched=value;
                //                   });
                //                 },
                //                 activeTrackColor: Color.fromRGBO(188, 44, 61, 1),
                //                 inactiveTrackColor: Color.fromRGBO(223, 222, 221, 1),
                //                 activeColor: Colors.white,
                //               ),
                //             )
                //
                //           ],
                //         ),
                //
                //       )
                //     ],
                //   ),
                // ),
                SizedBox(height: 24.h,),
                //Description
                Container(
                  width: 344.w,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Description",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontFamily: "Milliard",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 7.h,),
                description(),
                SizedBox(height: 23.h,),
                //Resto style
                Container(
                  width: 344.w,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Resto style",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontFamily: "Milliard",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 21.h,),
                Container(
                  child: ChipList(
                    supportsMultiSelect: true,
                    listOfChipNames: _styleOptionsTwo,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: "Milliard",
                    ),
                    borderRadiiList: [8.r],
                    runSpacing: 17.h,
                    activeBgColorList: [Color.fromRGBO(188, 44, 61,1)],
                    listOfChipIndicesCurrentlySeclected: selectedList,
                    inactiveBgColorList: [Color.fromRGBO(248, 247, 247, 1)],
                    activeTextColorList: [Colors.white],
                    inactiveTextColorList: [Color.fromRGBO(148, 148, 148,1)],
                    shouldWrap: true,
                  ),
                ),
                // SizedBox(height: 23.h,),
                // _phoneContainer(),
                SizedBox(height: 23.h,),
                //AddResto Button
                InkWell(
                  onTap: (){
                    String styles="";
                    String theIds="";
                    for(int y=0; y < selectedList.length; y++){
                      for(int i=0; i <= _styleOptionsTwo.length; i++){
                        if(i == selectedList[y]){
                          styles = styles+_styleOptionsTwo[i].trim()+"|";
                          theIds = theIds+styleList![i].id!.trim()+"|";
                          print(removeLastCharacter(styles.trim()));
                          print(removeLastCharacter(theIds.trim()));
                        }
                      }
                    }

                    if(restaurantNameController.text.isEmpty ||
                        phoneNumberController.text.isEmpty ||
                        emailController.text.isEmpty ||
                        locationController.text.isEmpty || _imageCover == null || _imageProfile == null ){
                      Fluttertoast.showToast(
                        msg: "Renseignez tout les champs et chargez toutes les images",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 5,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: 16.sp,
                      );
                    }
                    else{
                      ForCreateRestaurant restaurant = ForCreateRestaurant(name: restaurantNameController.text, email: emailController.text,
                      description: descriptionController.text, address: locationController.text, profilePicture: File(_imageProfile!.path), coverPicture: File(_imageCover!.path), styles: removeLastCharacter(theIds.trim()));

                      _addRestaurantBloc.add(StartAddRestaurant(createRestaurant: restaurant));
                    }
                  },
                  child: Container(
                    width: 340.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(188, 44, 61, 1),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Center(
                      child: Text(
                        "Add Restaurant",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w300,
                          fontFamily: "Milliard",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 43.h,),
              ],
            ),
          ),

        ),
      ),
    );
  }
  Widget restauName()=>Container(
      width: 344.w,
      height: 48.h,
      child: TextFormField(
        controller: restaurantNameController,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.sp,
          fontFamily: "Milliard",
        ),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
          ),
          hintText: 'Enter Name',
          contentPadding:  EdgeInsets.symmetric(vertical: 14.r, horizontal: 10.r),
          border: OutlineInputBorder(),
        ),
      )
  );




Widget phoneNum()=>Form(
  key: formKey,
  child: Container(
    width: 344.w,
    height: 48.h,
    decoration: BoxDecoration(
      border: Border.all(width: 2, color: Colors.grey),

    ),
    child:InternationalPhoneNumberInput(
      onInputChanged: (PhoneNumber number) {
        print(number.phoneNumber);
      },
      onInputValidated: (bool value) {
        print(value);
      },
      selectorConfig: SelectorConfig(
        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
      ),
      ignoreBlank: false,
      autoValidateMode: AutovalidateMode.disabled,
      selectorTextStyle: TextStyle(color: Colors.black),
      initialValue: number,

      textFieldController: controller,
      formatInput: false,
      keyboardType:
      TextInputType.numberWithOptions(signed: true, decimal: true),
      inputBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
      ),
      onSaved: (PhoneNumber number) {
        print('On Saved: $number');
      },
    ),
  ),
);

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
    await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');

    setState(() {
      this.number = number;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }



    Widget restauNumber()=>Container(
      width: 344.w,
      height: 48.h,
      child: TextFormField(
        controller: phoneNumberController,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.sp,
          fontFamily: "Milliard",
        ),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
          ),
          focusColor: Color(0XFFB8B8B8),
          hintText: 'Enter Number',
          contentPadding:  EdgeInsets.symmetric(vertical: 14.r, horizontal: 10.r),
          border: OutlineInputBorder(),
        ),
      )
  );
  Widget restauEmail()=>Container(
      width: 344.w,
      height: 48.h,
      child: TextFormField(
        controller: emailController,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.sp,
          fontFamily: "Milliard",
        ),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
          ),
          focusColor: Color(0XFFB8B8B8),
          hintText: 'Enter Email',
          contentPadding:  EdgeInsets.symmetric(vertical: 14.r, horizontal: 10.r),
          border: OutlineInputBorder(),
        ),
      )
  );
  Widget localisationRestau()=>Container(
      width: 344.w,
      height: 48.h,
      child: TextFormField(
        controller: locationController,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.sp,
          fontFamily: "Milliard",
        ),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
          ),
          focusColor: Color(0XFFB8B8B8),
          hintText: 'Enter Localisation',
          suffixIcon:Icon(
            Icons.my_location_rounded,
            color: Color.fromRGBO(188, 44, 61, 1),
            size:20.sp,
          ),
          contentPadding:  EdgeInsets.symmetric(vertical: 14.r, horizontal: 10.r),
          border: OutlineInputBorder(),
        ),
      )
  );

  Widget description()=>Container(
    height: 121.h,
    width: 344.w,
    decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        border: new Border.all(color: Color.fromRGBO(223, 222, 221, 1))
    ),
    child: new SizedBox.expand(
      child: new TextField(
        controller: descriptionController,
          maxLines: 8,
          style: new TextStyle(
              fontSize: 16.sp,
              fontFamily: "Milliard",
              color: Colors.black
          ),
          decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
            ),
            focusColor: Color(0XFFB8B8B8),
            border: InputBorder.none,
            hintText: "Enter description...",
            contentPadding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
          )
      ),
    ),
  );

  _imgFromCamera() async {
    XFile? image = await ImagePicker().pickImage(
        source: ImageSource.camera, imageQuality: 50
    );

    setState(() {
      _imageProfile = image;
    });
  }

  _imgFromGallery() async {
    XFile? image = await  ImagePicker().pickImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    setState(() {
      _imageProfile = image;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(
                        Icons.photo_library,
                        color: kPrimaryColor,
                      ),
                      title: new Text(
                        'Photo Library',
                        style: TextStyle(
                          fontFamily: "Milliard",
                        ),
                      ),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(
                      Icons.photo_camera,
                      color: kPrimaryColor,
                    ),
                    title: new Text(
                      'Camera',
                      style: TextStyle(
                        fontFamily: "Milliard",
                      ),
                    ),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }



  ///////////////////////////////cover



  _imgFromCameraCover() async {
    XFile? image = await ImagePicker().pickImage(
        source: ImageSource.camera, imageQuality: 50
    );

    setState(() {
      _imageCover = image;
    });
  }

  _imgFromGalleryCover() async {
    XFile? image = await  ImagePicker().pickImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    setState(() {
      _imageCover = image;
    });
  }

  void _showPickerCover(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(
                        Icons.photo_library,
                        color: kPrimaryColor,
                      ),
                      title: new Text(
                        'Photo Library',
                        style: TextStyle(
                          fontFamily: "Milliard",
                        ),
                      ),
                      onTap: () {
                        _imgFromGalleryCover();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(
                      Icons.photo_camera,
                      color: kPrimaryColor,
                    ),
                    title: new Text(
                      'Camera',
                      style: TextStyle(
                        fontFamily: "Milliard",
                      ),
                    ),
                    onTap: () {
                      _imgFromCameraCover();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  String removeLastCharacter(String str) {
    String result="";
    if ((str != null) && (str.length > 0)) {
      result = str.substring(0, str.length - 1);
    }

    return result;
  }

  // Widget _phoneContainer() {
  //   return new Container(
  //     width: 344.w,
  //     height: 48.h,
  //     decoration: new BoxDecoration(
  //         borderRadius: BorderRadius.circular(5.r),
  //         border: new Border.all(color: Color.fromRGBO(223, 222, 221, 1))
  //     ),
  //     child: new TextFormField(
  //       controller: phoneController,
  //       textAlignVertical: TextAlignVertical.top,
  //       decoration: InputDecoration(
  //         prefixIcon: CountryCodePicker(
  //           initialSelection: '+237',
  //           favorite: ['+237', 'CMR'],
  //           textStyle: TextStyle(
  //             color: Color(0XFF949494),
  //             fontSize: 20.sp,
  //             fontFamily: "Milliard",
  //           ),
  //           showFlag: true,
  //           padding: EdgeInsets.zero,
  //           flagDecoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(4),
  //           ),
  //           flagWidth: 35.w,
  //         ),
  //
  //         focusedBorder: OutlineInputBorder(
  //           borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
  //         ),
  //         focusColor: Color(0XFFB8B8B8),
  //         border: InputBorder.none,
  //       ),
  //       style: TextStyle(
  //         color: Colors.black,
  //         fontSize: 20.sp,
  //         fontFamily: "Milliard",
  //       ),
  //     ),
  //   );
  // }
}



