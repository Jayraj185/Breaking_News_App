import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, 'First');
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Stack(
            children: [
              Align(alignment: Alignment.center,child: Lottie.asset("assets/animation/news.json")),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: Text(
                    "Welcome",
                    style: GoogleFonts.merriweather(
                      color: Colors.red,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w900
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: 37.h),
                  child: Text(
                    "Breaking News App",
                    style: GoogleFonts.merriweather(
                      color: Colors.red,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w900
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: 80.h),
                  child: Text(
                    "From",
                    style: GoogleFonts.merriweather(
                        color: Colors.black26,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w900
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: 85.h),
                  child: Text(
                    "Jayraj",
                    style: GoogleFonts.merriweather(
                        color: Colors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w900
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
