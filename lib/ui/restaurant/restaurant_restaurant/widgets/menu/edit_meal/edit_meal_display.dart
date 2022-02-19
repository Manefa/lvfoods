import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ivfoods_mobile_app/constants.dart';
import 'package:ivfoods_mobile_app/core/platform/lv_icons_resto.dart';
import 'package:ivfoods_mobile_app/core/utils/url_convert.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_categories/domain/entities/category.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_product_details/domain/entities/get_product_details.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_product/bloc/update_product.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_product/domain/entities/for_update_product.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:ivfoods_mobile_app/ui/restaurant/restaurant_restaurant/widgets/chip_list.dart';


class EditMealDisplay extends StatefulWidget {
  final GetProductDetails getProductDetails;
  final String code;
  final List<Category> categories;
  const EditMealDisplay({Key? key, required this.getProductDetails, required this.code, required this.categories}) : super(key: key);

  @override
  _EditMealDisplayState createState() => _EditMealDisplayState();
}


class _EditMealDisplayState extends State<EditMealDisplay> {
  String name = "";
  String price = "";
  String remise = "";
  String description = "";
  List<Category>? categoriesList;
  List<Category> categoriesForSaveList = [];
  final formKey = GlobalKey<FormState>();
  UpdateProductBloc _updateProductBloc = sl<UpdateProductBloc>();

  XFile? _imageCover;
  File? _oldCoverFile;

  TextEditingController mealNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController remiseController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState()  {
    name = widget.getProductDetails.product!.name!;
    price = widget.getProductDetails.product!.price.toString();
    remise = widget.getProductDetails.product!.discount!.toString();
    description = widget.getProductDetails.product!.description!.toString();
    categoriesList = widget.categories;
    for(int i = 0; i < widget.getProductDetails.product!.categories!.length; i++){
      Category category = Category(id:widget.getProductDetails.product!.categories![i].id , name: widget.getProductDetails.product!.categories![i].name);
      categoriesForSaveList.add(category);
    }
    mealNameController = TextEditingController(text: name);
    priceController = TextEditingController(text: price);
    remiseController = TextEditingController(text: remise);
    descriptionController = TextEditingController(text: description);
    _asyncMethod();
    super.initState();
  }

  _asyncMethod() async {
    _oldCoverFile = await urlToFile(widget.getProductDetails.product!.picture!);
    if(_oldCoverFile != null){
      _imageCover = XFile(_oldCoverFile!.path);
      print("chargement effectuer");
      setState(() {

      });
    }
  }


  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(416, 897),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.portrait);

    int day = 1;

   List<int> selectedList = [];
    // List<String> _categorieOptions = [
    //   'Desert',
    //   'Entrée',
    //   'Plat de résistance',
    // ];

    List<String> _categorieOptionsTwo = [];

    if(categoriesList != null){
      categoriesList!.forEach((element) {
        _categorieOptionsTwo.add(element.name!);
      });
    }


    return BlocProvider<UpdateProductBloc>(
      create: (_) => _updateProductBloc,
      child: BlocListener(
        bloc: _updateProductBloc,
        listener: (context, state){
          if(state is UpdateProductLoading){
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  duration: (state is UpdateProductLoading) ? Duration(days: day) : Duration(seconds: day),
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

          if(state is UpdateProductLoaded){
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            Navigator.pop(context);
          }

          if(state is UpdateProductError){
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text(state.message + "Echec de la mise a jour", style: TextStyle(fontFamily: "Milliard", color: Colors.white),), Icon(Icons.error, color: Colors.white,)],
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
                //Meal Name
                Container(
                  width: 344.w,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Name Meal",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontFamily: "Milliard",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 7.h,),
                Container(
                    width: 344.w,
                    height: 48.h,
                    child: TextFormField(
                      controller: mealNameController,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontFamily: "Milliard",
                      ),
                      decoration: InputDecoration(
                        contentPadding:  EdgeInsets.symmetric(vertical: 14.r, horizontal: 10.r),
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                SizedBox(height: 23.h,),
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
                ):InkWell(
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
                SizedBox(height: 15.h,),
                //Price
                Container(
                  width: 344.w,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Price",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontFamily: "Milliard",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 7.h,),
                Container(
                    width: 344.w,
                    height: 48.h,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: priceController,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontFamily: "Milliard",
                            ),
                            decoration: InputDecoration(
                              hintText: widget.getProductDetails.product!.price!.toString(),
                              contentPadding:  EdgeInsets.symmetric(vertical: 14.r, horizontal: 10.r),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Container(
                          width: 76.w,
                          height: 48.h,
                          color: Color.fromRGBO(241, 241, 241,1),
                          child: Center(
                            child: Text(
                                'FCFA',
                                style: TextStyle(
                                  color: Color.fromRGBO(145, 145, 145, 1),
                                  fontSize: 20.sp,
                                  fontFamily: "Milliard",
                                )

                            ),
                          ),
                        )
                      ],
                    )
                ),
                SizedBox(height: 17.h,),

                //Remise
                Container(
                  width: 344.w,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Remise",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontFamily: "Milliard",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 7.h,),
                Container(
                  width: 344.w,
                  height: 48.h,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: remiseController,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontFamily: "Milliard",
                          ),
                          decoration: InputDecoration(
                            contentPadding:  EdgeInsets.symmetric(vertical: 14.r, horizontal: 10.r),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Container(
                        width: 76.w,
                        height: 48.h,
                        color: Color.fromRGBO(241, 241, 241,1),
                        child: Center(
                          child: Text(
                              '%',
                              style: TextStyle(
                                color: Color.fromRGBO(145, 145, 145, 1),
                                fontSize: 20.sp,
                                fontFamily: "Milliard",
                              )
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 17.h,),

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
                Container(
                  height: 121.h,
                  width: 344.w,
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      border: new Border.all(color: Color.fromRGBO(223, 222, 221, 1))
                  ),
                  child: new SizedBox.expand(
                    child: new TextFormField(
                        controller: descriptionController,
                        maxLines: 8,
                        style: new TextStyle(
                            fontSize: 16.sp,
                            fontFamily: "Milliard",
                            color: Colors.black
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                        )
                    ),
                  ),
                ),
                SizedBox(height: 43.h,),
                //Categorie
                Container(
                  width: 344.w,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Categorie",
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
                  width: 344.w,
                  child: ChipList(
                    supportsMultiSelect: true,
                    listOfChipNames: _categorieOptionsTwo,
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
                SizedBox(height: 17.h,),
                //EditResto Button
                InkWell(
                  onTap: (){
                    String categories="";
                    String theIds="";

                    String theIdsForSave="";
                    for(int i = 0; i<categoriesForSaveList.length; i++){
                      theIdsForSave = theIdsForSave+categoriesForSaveList[i].id!+"|";
                    }

                    for(int y=0; y < selectedList.length; y++){
                      for(int i=0; i <= _categorieOptionsTwo.length; i++){
                        if(i == selectedList[y]){
                          categories = categories+_categorieOptionsTwo[i].trim()+"|";
                          theIds = theIds+categoriesList![i].id!.trim()+"|";
                          print(removeLastCharacter(categories.trim()));
                          print(removeLastCharacter(theIds.trim()));
                        }
                      }
                    }

                    if(mealNameController.text.isEmpty || priceController.text.isEmpty || remiseController.text.isEmpty || descriptionController.text.isEmpty){
                      Fluttertoast.showToast(
                        msg: "Renseignez tout les champs",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 5,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: 16.sp,
                      );
                    }else{
                      ForUpdateProduct product = ForUpdateProduct(
                          name: mealNameController.text,
                          categories: theIds == "" ? removeLastCharacter(theIdsForSave.trim()) : removeLastCharacter(theIds.trim()),
                          price: double.parse(priceController.text),
                          discount: double.parse(remiseController.text.toString()),
                          description: descriptionController.text,
                          picture: _imageCover == null ? null : File(_imageCover!.path));
                      _updateProductBloc.add(StartUpdateProduct(forUpdateProduct: product, code: widget.code));
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
                        "Edit Meal",
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
}
