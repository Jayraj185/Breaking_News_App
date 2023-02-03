import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Screens/BottomBarScreen/view/BottomBarPage.dart';
import 'package:news_app/Screens/CategoryScreen/view/NewsViewPage.dart';
import 'package:news_app/Screens/HomeScreen/provider/HomeProvider.dart';
import 'package:news_app/Screens/HomeScreen/view/HomePage.dart';
import 'package:news_app/Screens/HomeScreen/view/NewsViewPage2.dart';
import 'package:news_app/Screens/HomeScreen/view/SplashPage.dart';
import 'package:news_app/Screens/HomeScreen/view/UrlViewPage.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main()
{
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => HomeProvider(),)
        ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              '/' : (context) => SplashPage(),
              'First' : (context) => BottomBarPage(),
              'Home' : (context) => HomePage(),
              'View' : (context) => NewsViewPage(),
              'View2' : (context) => NewsViewPage2(),
              'Url' : (context) => UrlViewPage(),
            },
          );
        },
      ),
    )
  );
}