import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ivfoods_mobile_app/constants.dart';
import 'package:ivfoods_mobile_app/features/get_user/bloc/get_user.dart';
import 'package:ivfoods_mobile_app/features/update_users/bloc/update_user.dart';
import 'package:ivfoods_mobile_app/features/update_users/domain/entities/user_for_update.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
class UserModel{
  final String name;
  final String ? image;

  UserModel({required this.name, this.image});

}
UserModel user1 = new UserModel(
  name: "Yael Tamo",
  //image: "https://media.istockphoto.com/photos/postal-delivery-service-picture-id1266986195?b=1&k=20&m=1266986195&s=170667a&w=0&h=Zuvxz_11X7T2ijMNuaZZRn3vkQSBQvKcLWLaKmgob10="

);

class EditInformationDelivery extends StatefulWidget {
  final String image;
  final String fullName;
  final String emailAdress;
  final String userName;
  const EditInformationDelivery({Key? key, required this.image, required this.fullName, required this.emailAdress, required this.userName}) : super(key: key);

  @override
  _EditInformationDeliveryState createState() => _EditInformationDeliveryState();
}

class _EditInformationDeliveryState extends State<EditInformationDelivery> {
  final formKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String fullName = '';
  String picture = '';
  TextEditingController fullNameInput = TextEditingController();
  TextEditingController emailAddressInput = TextEditingController();
  TextEditingController userNameInput = TextEditingController();
  UpdateUserBloc _updateUserBloc = sl<UpdateUserBloc>();
  GetUserBloc _getUserBloc = sl<GetUserBloc>();
  XFile? _image;

  @override
  void initState() {
    username = widget.userName;
    email = widget.emailAdress;
    fullName = widget.fullName;
    picture = widget.image;
    fullNameInput.text = fullName;
    emailAddressInput.text = email;
    userNameInput.text = username;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider<UpdateUserBloc>(
          create: (_) => _updateUserBloc,
        ),
        BlocProvider<GetUserBloc>(
          create: (_) => _getUserBloc,
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<UpdateUserBloc, UpdateUserState>(
            listener: (context, state) {
                if(state is LoadingUpdateUser){
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.translate("wait"),
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

                if(state is LoadedUpdateUser){
                  _getUserBloc.add(GetUser());
                  username = userNameInput.text;
                  email = emailAddressInput.text;
                  fullName = fullNameInput.text;
                  setState(() {

                  });
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text(
                            AppLocalizations.of(context)!.translate("updatePerformed"),
                            style: TextStyle(fontFamily: "Milliard", color: Colors.white),), Icon(Icons.check, color: Colors.white,)],
                        ),
                        backgroundColor: kPrimaryColor,
                      ),
                    );
                }

                if(state is ErrorUpdateUser){
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text(state.message + AppLocalizations.of(context)!.translate("theUpdateHasFailed"), style: TextStyle(fontFamily: "Milliard", color: Colors.white),), Icon(Icons.error, color: Colors.white,)],
                        ),
                        backgroundColor: kPrimaryColor,
                      ),
                    );
                }
            },
          ),

          BlocListener<GetUserBloc, GetUserState>(
            listener: (context, state) {
              if(state is LoadedUser){
                sl<SharedPreferences>().setString("username", state.userMaster.users!.username.toString());
                sl<SharedPreferences>().setString("fullname", state.userMaster.users!.fullName.toString());
                sl<SharedPreferences>().setString("image", state.userMaster.users!.picture.toString());
                sl<SharedPreferences>().setString("email", state.userMaster.users!.email.toString());

              }
            },
          ),
        ],
        child: SingleChildScrollView(child: Container(
          child:Center(
            child: Column(
              children: [
                SizedBox(height: 11.h,),
                Container(
                  height: 6.h,
                  width: 114.w,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(223, 222, 221, 1),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                SizedBox(height: 23.h,),
                //Profil Image Config
                Container(
                  height: 52.h,
                  width: 344.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap:(){
                          _showPicker(context);
                        },
                        child: Container(
                          width: 240.w,
                          child: Row(
                            children: [
                              Container(
                                child:
                                user1.image!=null ?
                                //Letter Name
                                CircleAvatar(
                                  backgroundColor: Color.fromRGBO(246, 246, 246, 1),
                                  child: Center(
                                    child:Text(
                                      user1.name[0],
                                      style: TextStyle(
                                        fontFamily: "Milliard",
                                        fontSize: 20.sp,
                                        color: Color.fromRGBO(188, 44, 61, 1),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                )
                                    :
                                //Image
                                _image ==null ? CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: NetworkImage(widget.image,),
                                ) : CircleAvatar(
                                    backgroundImage: FileImage(
                                      File(_image!.path),
                                  ),
                                  backgroundColor: Colors.transparent,
                                ),

                              ),
                              SizedBox(width: 10.w,),
                              Text(
                                AppLocalizations.of(context)!.translate("changeAvatar"),
                                style: TextStyle(
                                  fontFamily: "Milliard",
                                  fontSize: 16.sp,
                                  color: kPrimaryColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          if(_image != null){
                            if(_image != null || fullNameInput.text.isEmpty || emailAddressInput.text.isEmpty){
                              UserForUpdate userForUpdate = UserForUpdate(username: username, email: email, fullName: fullName, image: File(_image!.path));
                              _updateUserBloc.add(UpdateUser(userForUpdate: userForUpdate));
                            }else{
                              print("ouiiiiiiiiiiiiii");
                              Fluttertoast.showToast(
                                msg: AppLocalizations.of(context)!.translate("fillInAllFields"),
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 2,
                                backgroundColor: Colors.grey,
                                textColor: Colors.white,
                                fontSize: 16.sp,
                              );
                            }
                          }else{
                            if(_image == null){
                              if(fullNameInput.text.isEmpty || emailAddressInput.text.isEmpty){
                                Fluttertoast.showToast(
                                  msg: AppLocalizations.of(context)!.translate("fillInAllFields"),
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 2,
                                  backgroundColor: Colors.grey,
                                  textColor: Colors.white,
                                  fontSize: 16.sp,
                                );
                              }else{
                                UserForUpdate userForUpdate = UserForUpdate(username: username, email: email, fullName: fullName);
                                _updateUserBloc.add(UpdateUser(userForUpdate: userForUpdate));
                              }
                            }
                          }

                        },
                        child: Text(
                          AppLocalizations.of(context)!.translate("save"),
                          style: TextStyle(
                            fontFamily: "Milliard",
                            fontSize: 18.sp,
                            color: kPrimaryColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 29.h,),
                Container(
                  width:344.w,
                  //color:Colors.red,
                  child:Form(
                    key: formKey,
                    child: Column(
                      children: [
                        //Full Name
                        Align(
                          alignment: Alignment.centerLeft,
                          child:   Text(
                            AppLocalizations.of(context)!.translate("fullName"),
                            style: TextStyle(
                              fontFamily: "Milliard",
                              fontSize: 16.sp,
                              color: Color.fromRGBO(148, 148, 148, 1),
                            ),
                          ),
                        ),
                        SizedBox(height: 7.h,),
                        fullNameWidget(),
                        SizedBox(height: 17.h,),
                        //Email Adress
                        Align(
                          alignment: Alignment.centerLeft,
                          child:   Text(
                            AppLocalizations.of(context)!.translate("email"),
                            style: TextStyle(
                              fontFamily: "Milliard",
                              fontSize: 16.sp,
                              color: Color.fromRGBO(148, 148, 148, 1),
                            ),
                          ),
                        ),
                        SizedBox(height: 7.h,),
                        emailAddress(),
                        SizedBox(height: 17.h,),
                        //PhoneNumber
                        Align(
                          alignment: Alignment.centerLeft,
                          child:   Text(
                            AppLocalizations.of(context)!.translate("userName"),
                            style: TextStyle(
                              fontFamily: "Milliard",
                              fontSize: 16.sp,
                              color: Color.fromRGBO(148, 148, 148, 1),
                            ),
                          ),
                        ),
                        SizedBox(height: 7.h,),
                        phoneNumber(),
                        SizedBox(height: 17.h,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),),
      ),
    );
  }

  _imgFromCamera() async {
    XFile? image = await ImagePicker().pickImage(
        source: ImageSource.camera, imageQuality: 50
    );

    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    XFile? image = await  ImagePicker().pickImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    setState(() {
      _image = image;
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

  Widget fullNameWidget()=>Container(
    height: 48.h,
    child: TextFormField(
      controller: fullNameInput,
      onChanged: (value){
        setState(() {
          fullName = value;
        });
      },
      style: TextStyle(
        color: Colors.black,
        fontSize: 20.sp,
        fontFamily: "Milliard",
      ),
      decoration: InputDecoration(
        contentPadding: new EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
        border: OutlineInputBorder(),
        hintText: fullName,
      ),
      onSaved: (value) => setState(() => fullName = value!),
    ),
  );
  Widget emailAddress()=>Container(
    height: 48.h,
    child: TextFormField(
      controller: emailAddressInput,
      onChanged: (value){
        setState(() {
          email = value;
        });
      },
      style: TextStyle(
        color: Colors.black,
        fontSize: 20.sp,
        fontFamily: "Milliard",
      ),
      decoration: InputDecoration(
        contentPadding: new EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
        border: OutlineInputBorder(),
        hintText: email
      ),
      keyboardType: TextInputType.emailAddress,
      /*validator: (value) {
      final pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
      final regExp = RegExp(pattern);
      if (value.isEmpty) {
        return 'Enter an email';
      } else if (!regExp.hasMatch(value)) {
        return 'Enter a valid email';
      } else {
        return null;
      }
    },
    onSaved: (value) => setState(() => email = value),
    */
    ),
  );
  Widget phoneNumber()=>Container(
    height: 48.h,
    child: TextFormField(
      controller: userNameInput,
      onChanged: (value){
        setState(() {
          username = value;
        });
      },
      style: TextStyle(
        color: Colors.black,
        fontSize: 20.sp,
        fontFamily: "Milliard",
      ),
      decoration: InputDecoration(
          contentPadding: new EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
        border: OutlineInputBorder(),
        hintText: username
      ),
      onSaved: (value) => setState(() => username = value!),
    ),
  );
}