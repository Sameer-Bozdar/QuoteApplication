

import 'package:courier_management_system/model/ImageModel.dart';
import 'package:courier_management_system/utils/routes/routes_name.dart';
import 'package:courier_management_system/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../view/image_view.dart';
import '../../view/quotesView.dart';


class Routes {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => SplashView());
        case RoutesName.image:
        return MaterialPageRoute(
            builder: (BuildContext context) => ImageView(model: ImageModel(), imageBoxFit: BoxFit.cover,));
        case RoutesName.quoteHome:
        return MaterialPageRoute(
            builder: (BuildContext context) => QuotesHome());
      default:
       return MaterialPageRoute(builder: (_) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Text('No Route Found'),
            ),
          );
        });
    }
  }


}