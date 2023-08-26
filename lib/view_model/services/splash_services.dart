


//
// import 'package:courier_management_system/utils/routes/routes_name.dart';
// import 'package:courier_management_system/view_model/auth_view_model.dart';
// import 'package:courier_management_system/view_model/user_view_model.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
//
//
// class SplashServices{
//
// Future<AuthViewModel> getUserData() => UserViewModel().getUser();
//
// void checkAuthentication(BuildContext context){
//
//   getUserData().then((value) async{
// print(value);
  //
  //
  // if(value.token.toString() == 'null' || value.token.toString() == ''){
  //    Future.delayed(Duration(seconds: 3));
  // Navigator.pushNamed(context, RoutesName.login);
  //     }else{
  //   Future.delayed(Duration(seconds: 3));
  //   Navigator.pushNamed(context, RoutesName.home);
  //
  // }
  //
  // }).onError((error, stackTrace) {
  //
  //   if(kDebugMode){
  //   print(error.toString());
  //   }
  //
  // });

// }



// }



import 'dart:async';

import 'package:courier_management_system/utils/routes/routes.dart';
import 'package:courier_management_system/utils/routes/routes_name.dart';
import 'package:flutter/cupertino.dart';

class SplashServices {

  void isLogin(BuildContext context) {
    // final auth = FirebaseAuth.instance;

    // final user = auth.currentUser;

    // if(user != null){

    Timer(Duration(seconds: 3),
            () => Navigator.pushNamed(context, RoutesName.quoteHome));
  }
}













