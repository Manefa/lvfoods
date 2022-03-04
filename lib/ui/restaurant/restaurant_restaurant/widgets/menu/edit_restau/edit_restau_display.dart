import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ivfoods_mobile_app/constants.dart';
import 'package:ivfoods_mobile_app/core/platform/icon/lv_icons_resto.dart';
import 'package:ivfoods_mobile_app/core/utils/url_convert.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_city/domain/entities/city.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_country/domain/entities/country.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_restaurant/domain/entities/get_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_styles/domain/entities/style.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_restaurant/bloc/update_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_restaurant/domain/entities/for_update_restaurant.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/menu/add_restau/widgets/choice_chip.dart';

class EditRestauDisplay extends StatefulWidget {
  final List<Style> styles;
  final String name;
  final GetRestaurant getRestaurant;
  final List<Country> countries;
  final List<City> cities;
  const EditRestauDisplay(
      {Key? key,
      required this.styles,
      required this.name,
      required this.getRestaurant, required this.countries, required this.cities})
      : super(key: key);

  @override
  _EditRestauDisplayState createState() => _EditRestauDisplayState();
}

class _EditRestauDisplayState extends State<EditRestauDisplay> {
  String name = "";
  String phone = "";
  String email = "";
  String localisation = "";
  String descrip = "";
  String country = "";
  String city = "";
  String district = "";
  String? selectedCountry;
  String? selectedCity;
  var stylesTest = [];
  String? selectedCountryId;

  List<City> getCityForCountry(String countryId, List<City> cities){
    List<City> citiesResults = [];
    cities.forEach((element) {
      if(countryId.toString() == element.country.toString()){
        citiesResults.add(element);
      }
    });

    return citiesResults;
  }

  UpdateRestaurantBloc _updateRestaurantBloc = sl<UpdateRestaurantBloc>();
  TextEditingController restaurantNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController districtController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  int _selectedIndex = 0;
  bool isSwitched = true;
  List<int> mySelected = List.empty();
  List<Style>? styleList;
  List<Style> stylesForSaveList = [];
  String style = "";
  XFile? _imageProfile;
  XFile? _imageCover;
  File? _imageOldProfile;
  File? _imageOldCover;

  @override
  void initState() {
    name = widget.getRestaurant.restaurant!.name!;
    email = widget.getRestaurant.restaurant!.email!;
    localisation = widget.getRestaurant.restaurant!.address!;
    descrip = widget.getRestaurant.restaurant!.description!;
    stylesTest = widget.getRestaurant.restaurant!.styles!;
    selectedCountry = widget.getRestaurant.restaurant!.country;
    selectedCity = widget.getRestaurant.restaurant!.city;

    if (widget.getRestaurant.restaurant!.country == "") {
      country = "";
    } else {
      country = widget.getRestaurant.restaurant!.country.toString();
    }

    if (widget.getRestaurant.restaurant!.city == "") {
      city = "";
    } else {
      city = widget.getRestaurant.restaurant!.city.toString();
    }

    if (widget.getRestaurant.restaurant!.district == "") {
      district = "";
    } else {
      district = widget.getRestaurant.restaurant!.district.toString();
    }

    restaurantNameController = TextEditingController(text: name);
    phoneNumberController = TextEditingController();
    emailController = TextEditingController(text: email);
    locationController = TextEditingController(text: localisation);
    descriptionController = TextEditingController(text: descrip);
    countryController = TextEditingController(text: country);
    cityController = TextEditingController(text: city);
    districtController = TextEditingController(text: district);

    selectedCountryId = findIdWithNameCountry(selectedCountry!, widget.countries);
    namesCity = getCityForCountry(selectedCountryId!, widget.cities);

    for (int i = 0; i < widget.styles.length; i++) {
      Style category =
          Style(id: widget.styles[i].id, name: widget.styles[i].name);
      stylesForSaveList.add(category);
    }

    styleList = widget.styles;
    _asyncMethod();
    super.initState();
  }

  _asyncMethod() async {
    _imageOldCover =
        await urlToFile(widget.getRestaurant.restaurant!.coverPicture!);
    _imageOldProfile =
        await urlToFile(widget.getRestaurant.restaurant!.profilePicture!);
    if (_imageOldProfile != null) {
      _imageProfile = XFile(_imageOldProfile!.path);
      setState(() {});
    }

    if (_imageOldCover != null) {
      _imageCover = XFile(_imageOldCover!.path);
      setState(() {});
    }
  }

  List<City> namesCity = [];
  List<City> namesCityTwo = [];

  @override
  Widget build(BuildContext context) {
    List<int> selectedList = [];
    List<String> _styleOptionsTwo = [];


    if (styleList != null) {
      styleList!.forEach((element) {
        _styleOptionsTwo.add(element.name!);
      });
    }
    int day = 1;
    return BlocProvider<UpdateRestaurantBloc>(
      create: (_) => _updateRestaurantBloc,
      child: BlocListener(
        bloc: _updateRestaurantBloc,
        listener: (context, state) {
          if (state is UpdateRestaurantLoading) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  duration: (state is UpdateRestaurantLoading)
                      ? Duration(days: day)
                      : Duration(seconds: day),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.translate("inProgressBloc"),
                        style: TextStyle(
                          fontFamily: "Milliard",
                          color: Colors.white,
                        ),
                      ),
                      CircularProgressIndicator(
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ],
                  ),
                  backgroundColor: kPrimaryColor,
                ),
              );
          }

          if (state is UpdateRestaurantLoaded) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            Navigator.pop(context);
          }

          if (state is UpdateRestaurantError) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        state.message + AppLocalizations.of(context)!.translate("theUpdateHasFailed"),
                        style: TextStyle(
                            fontFamily: "Milliard", color: Colors.white),
                      ),
                      Icon(
                        Icons.error,
                        color: Colors.white,
                      )
                    ],
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
                              child: _imageProfile == null
                                  ? CircleAvatar(
                                      backgroundColor: Colors.red,
                                    )
                                  : CircleAvatar(
                                      backgroundImage: FileImage(
                                        File(_imageProfile!.path),
                                      ),
                                      backgroundColor: Colors.transparent,
                                    ),
                            ),
                            SizedBox(
                              width: 11.w,
                            ),
                            //UploadIcon
                            InkWell(
                              onTap: () {
                                _showPicker(context);
                              },
                              child: Text(
                                AppLocalizations.of(context)!.translate("uploadLogo"),
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
                SizedBox(
                  height: 26.h,
                ),
                //UploadImage
                Container(
                  width: 344.w,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppLocalizations.of(context)!.translate("uploadImg"),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontFamily: "Milliard",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 23.h,
                ),
                _imageCover == null
                    ? InkWell(
                        onTap: () {
                          _showPickerCover(context);
                        },
                        child: Container(
                          height: 42.h,
                          width: 344.w,
                          child: DottedBorder(
                              color: Color.fromRGBO(188, 44, 61, 1),
                              strokeWidth: 0.2,
                              dashPattern: [10, 6],
                              child: Center(
                                  child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    LvIconsResto.upload,
                                    color: Color.fromRGBO(188, 44, 61, 1),
                                    size: 16.sp,
                                  ),
                                  SizedBox(
                                    width: 19.w,
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!.translate("uploadImgHere"),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Color.fromRGBO(188, 44, 61, 1),
                                        fontSize: 20.sp,
                                        fontFamily: "Milliard",
                                        fontWeight: FontWeight.w200),
                                  )
                                ],
                              ))),
                        ),
                      )
                    : InkWell(
                        onTap: () {
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
                              ]),
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 15.w,
                              ),
                              Icon(
                                Icons.image,
                                color: Color(0XFFCBCBCB),
                              ),
                              SizedBox(
                                width: 14.w,
                              ),
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
                              SizedBox(
                                width: 22.w,
                              ),
                            ],
                          ),
                        ),
                      ),
                SizedBox(
                  height: 26.h,
                ),
                //Restau Name
                Container(
                  width: 344.w,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppLocalizations.of(context)!.translate("restaurantName"),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontFamily: "Milliard",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                restauName(),
                SizedBox(
                  height: 16.h,
                ),
                //Restau Country
                Container(
                  width: 344.w,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppLocalizations.of(context)!.translate("restaurantCountry"),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontFamily: "Milliard",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                Container(
                  width: 344.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                  child: Container(
                    child:  Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedCountry,
                          isExpanded: true,
                          items: widget.countries.map((e) => DropdownMenuItem<String>(
                            value: e.name,
                            child: Text(
                              e.name!,
                            ),
                          ) ).toList(),
                          onChanged: (e) => setState(() {
                            selectedCountry = e;
                            selectedCountryId = findIdWithNameCountry(e!, widget.countries);
                            namesCity = getCityForCountry(selectedCountryId!, widget.cities);
                            print(namesCity);
                          } ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                //Restau City
                Container(
                  width: 344.w,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppLocalizations.of(context)!.translate("restaurantCity"),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontFamily: "Milliard",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                Container(
                  width: 344.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                  child: Container(
                    child:  Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedCity,
                          isExpanded: true,
                          items: namesCity.map((e) => DropdownMenuItem<String>(
                            value: e.name,
                            child: Text(
                              e.name!,
                            ),
                          ) ).toList(),
                          onChanged: (e) => setState(() {
                            selectedCity = e;
                            print(namesCity);
                          } ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                //Restau District
                Container(
                  width: 344.w,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppLocalizations.of(context)!.translate("restaurantDistrict"),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontFamily: "Milliard",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                restauDistrict(),
                SizedBox(
                  height: 16.h,
                ),
                //EmailRestau
                Container(
                  width: 344.w,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppLocalizations.of(context)!.translate("emailRestaurant"),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontFamily: "Milliard",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                restauEmail(),
                //Phone Number
                SizedBox(
                  height: 16.h,
                ),
                //Localisation
                Container(
                  width: 344.w,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppLocalizations.of(context)!.translate("location"),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontFamily: "Milliard",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                localisationRestau(),
                SizedBox(
                  height: 24.h,
                ),
                //Description
                Container(
                  width: 344.w,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppLocalizations.of(context)!.translate("description"),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontFamily: "Milliard",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                description(),
                SizedBox(
                  height: 23.h,
                ),
                //Resto style
                Container(
                  width: 344.w,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppLocalizations.of(context)!.translate("restaurantStyle"),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontFamily: "Milliard",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 21.h,
                ),
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
                    activeBgColorList: [Color.fromRGBO(188, 44, 61, 1)],
                    listOfChipIndicesCurrentlySeclected: selectedList,
                    inactiveBgColorList: [Color.fromRGBO(248, 247, 247, 1)],
                    activeTextColorList: [Colors.white],
                    inactiveTextColorList: [Color.fromRGBO(148, 148, 148, 1)],
                    shouldWrap: true,
                  ),
                ),
                SizedBox(
                  height: 23.h,
                ),
                //EditResto Button
                InkWell(
                  onTap: () {
                    String styles = "";
                    String theIds = "";
                    String styleTestString = "";

                    String theIdsForSave = "";
                    for (int i = 0; i < stylesForSaveList.length; i++) {
                      theIdsForSave =
                          theIdsForSave + stylesForSaveList[i].id! + "|";
                    }

                    for (int i = 0; i < stylesTest.length; i++) {
                      styleTestString = styleTestString + stylesTest[i].id! + "|";
                    }

                    for (int y = 0; y < selectedList.length; y++) {
                      for (int i = 0; i <= _styleOptionsTwo.length; i++) {
                        if (i == selectedList[y]) {
                          styles = styles + _styleOptionsTwo[i].trim() + "|";
                          theIds = theIds + styleList![i].id!.trim() + "|";
                          print(removeLastCharacter(styles.trim()));
                          print(removeLastCharacter(theIds.trim()));
                        }
                      }
                    }

                    if (restaurantNameController.text.isEmpty ||
                        emailController.text.isEmpty ||
                        locationController.text.isEmpty ||
                        _imageCover == null ||
                        _imageProfile == null) {
                      Fluttertoast.showToast(
                        msg: AppLocalizations.of(context)!.translate("fillInAllFieldsAndUploadAllImages"),
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 5,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: 16.sp,
                      );
                    } else {
                      ForUpdateRestaurant restaurant = ForUpdateRestaurant(
                        name: restaurantNameController.text.trim(),
                        email: emailController.text.trim(),
                        description: descriptionController.text.trim(),
                        address: locationController.text.trim(),
                        country: selectedCountry.toString().trim(),
                        city: selectedCity.toString().trim(),
                        district: districtController.text.trim(),
                        profilePicture: File(_imageProfile!.path),
                        coverPicture: File(_imageCover!.path),
                        styles: theIds == ""
                            ? removeLastCharacter(styleTestString.trim())
                            : removeLastCharacter(theIds.trim()),
                      );

                      _updateRestaurantBloc.add(StartUpdateRestaurant(
                          updateRestaurant: restaurant, name: widget.name));
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
                        AppLocalizations.of(context)!.translate("editRestaurant"),
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
                SizedBox(
                  height: 43.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget restauName() => Container(
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
          hintText: AppLocalizations.of(context)!.translate("enterNameOfRestaurant"),
          contentPadding:
              EdgeInsets.symmetric(vertical: 14.r, horizontal: 10.r),
          border: OutlineInputBorder(),
        ),
      ));

  Widget restauCountry() => Container(
      width: 344.w,
      height: 48.h,
      child: TextFormField(
        controller: countryController,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.sp,
          fontFamily: "Milliard",
        ),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
          ),
          hintText: 'Cameroun',
          contentPadding:
              EdgeInsets.symmetric(vertical: 14.r, horizontal: 10.r),
          border: OutlineInputBorder(),
        ),
      ));

  Widget restauCity() => Container(
      width: 344.w,
      height: 48.h,
      child: TextFormField(
        controller: cityController,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.sp,
          fontFamily: "Milliard",
        ),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
          ),
          hintText: 'Douala',
          contentPadding:
              EdgeInsets.symmetric(vertical: 14.r, horizontal: 10.r),
          border: OutlineInputBorder(),
        ),
      ));

  Widget restauDistrict() => Container(
      width: 344.w,
      height: 48.h,
      child: TextFormField(
        controller: districtController,
        onChanged: (value){
          locationController.text = selectedCountry!+"-"+selectedCity!+"-"+districtController.text;
        },
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.sp,
          fontFamily: "Milliard",
        ),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 14.r, horizontal: 10.r),
          border: OutlineInputBorder(),
        ),
      ));


  Widget restauNumber() => Container(
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
          hintText: AppLocalizations.of(context)!.translate("enterTheNumber"),
          contentPadding:
              EdgeInsets.symmetric(vertical: 14.r, horizontal: 10.r),
          border: OutlineInputBorder(),
        ),
      ));

  Widget restauEmail() => Container(
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
          hintText: AppLocalizations.of(context)!.translate("emailRestaurant"),
          contentPadding:
              EdgeInsets.symmetric(vertical: 14.r, horizontal: 10.r),
          border: OutlineInputBorder(),
        ),
      ));
  Widget localisationRestau() => Container(
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
          hintText: AppLocalizations.of(context)!.translate("enterLocalisation"),
          suffixIcon: Icon(
            Icons.my_location_rounded,
            color: Color.fromRGBO(188, 44, 61, 1),
            size: 20.sp,
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 14.r, horizontal: 10.r),
          border: OutlineInputBorder(),
        ),
      ));

  Widget description() => Container(
        height: 121.h,
        width: 344.w,
        decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            border: new Border.all(color: Color.fromRGBO(223, 222, 221, 1))),
        child: new SizedBox.expand(
          child: new TextField(
              controller: descriptionController,
              maxLines: 8,
              style: new TextStyle(
                  fontSize: 16.sp, fontFamily: "Milliard", color: Colors.black),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
                ),
                focusColor: Color(0XFFB8B8B8),
                border: InputBorder.none,
                hintText: AppLocalizations.of(context)!.translate("enterTheDescription"),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
              )),
        ),
      );

  _imgFromCamera() async {
    XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _imageProfile = image;
    });
  }

  _imgFromGallery() async {
    XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);

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
                        AppLocalizations.of(context)!.translate("openTheGallery"),
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
                      AppLocalizations.of(context)!.translate("camera"),
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
        });
  }

  ///////////////////////////////cover

  _imgFromCameraCover() async {
    XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _imageCover = image;
    });
  }

  _imgFromGalleryCover() async {
    XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);

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
                        AppLocalizations.of(context)!.translate("openTheGallery"),
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
                      AppLocalizations.of(context)!.translate("camera"),
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
        });
  }

  String findIdWithNameCountry(String name, List<Country> listCountry){
    String idCountry = "";
    listCountry.forEach((element) {
      if(element.name.toString() == name){
        idCountry = element.id!;
      }
    });

    return idCountry;
  }

  String removeLastCharacter(String str) {
    String result = "";
    if ((str != null) && (str.length > 0)) {
      result = str.substring(0, str.length - 1);
    }

    return result;
  }
}
