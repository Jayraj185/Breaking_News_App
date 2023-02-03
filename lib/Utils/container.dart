import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

Widget contaner(double width,bool check,name)
{
  return Container(
    //height: 3.h,
    width: width.w,
    margin: EdgeInsets.only(left: 3.h,top: 1.5.h),
    decoration: BoxDecoration(
        color: check?Color(0xFFFF3A44):Color(0xFFFAF2EB),
        borderRadius: BorderRadius.circular(6)
    ),
    alignment: Alignment.center,
    child: Text(
      "$name",
      style: TextStyle(
        color: check?Colors.white:Colors.black,
        fontSize: 15.sp
      ),
    ),
  );
}
Widget container2(context, icon)
{
  return Container(
    height: MediaQuery.of(context).size.height! / 8,
    width: MediaQuery.of(context).size.width! / 3.6,
    margin: EdgeInsets.all(10),
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: Colors.red,
        boxShadow: [
          BoxShadow(color: Colors.red.shade200,blurRadius: 15,offset: Offset(0,0))
        ],
        borderRadius: BorderRadius.circular(15)
    ),
    child: Icon(icon,color: Colors.white,size: 40.sp,)
  );
}