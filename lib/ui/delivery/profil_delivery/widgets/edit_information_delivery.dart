import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/constants.dart';
import 'package:ivfoods_mobile_app/core/platform/alert_dialog/alert_dialog_update_user.dart';
import 'package:ivfoods_mobile_app/features/get_user/bloc/get_user.dart';
import 'package:ivfoods_mobile_app/features/get_user/domain/entities/phone.dart';
import 'package:ivfoods_mobile_app/features/update_users/bloc/update_user.dart';
import 'package:ivfoods_mobile_app/features/update_users/domain/entities/user_for_update.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
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

  @override
  void initState() {
    username = widget.userName;
    email = widget.emailAdress;
    fullName = widget.fullName;
    picture = widget.image;
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
                          children: [Text("Mise a jour effectuer", style: TextStyle(fontFamily: "Milliard", color: Colors.white),), Icon(Icons.check, color: Colors.white,)],
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
                          children: [Text(state.message + "La mise a jour a Echouer", style: TextStyle(fontFamily: "Milliard", color: Colors.white),), Icon(Icons.error, color: Colors.white,)],
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
                      Container(
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
                              CircleAvatar(
                                backgroundColor: Colors.transparent,
                                backgroundImage: NetworkImage(widget.image,),
                              ),

                            ),
                            SizedBox(width: 10.w,),
                            Text("Change Avatar",
                              style: TextStyle(
                                fontFamily: "Milliard",
                                fontSize: 16.sp,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          UserForUpdate userForUpdate = UserForUpdate(username: userNameInput.text, email: emailAddressInput.text, fullName: fullNameInput.text);
                          _updateUserBloc.add(UpdateUser(userForUpdate: userForUpdate));
                        },
                        child: Text("Save",
                          style: TextStyle(
                            fontFamily: "Milliard",
                            fontSize: 20.sp,
                            color: Colors.black,
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
                          child:   Text("Full Name",
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
                          child:   Text("Email Address",
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
                          child:   Text("User Name",
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

  Widget fullNameWidget()=>Container(
    height: 48.h,
    child: TextFormField(
      controller: fullNameInput,
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