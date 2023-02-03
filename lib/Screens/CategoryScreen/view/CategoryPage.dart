import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/Screens/HomeScreen/provider/HomeProvider.dart';
import 'package:news_app/Utils/container.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  HomeProvider? homeProviderTrue;
  HomeProvider? homeProviderFalse;
  @override
  Widget build(BuildContext context) {
    homeProviderTrue = Provider.of<HomeProvider>(context,listen: true);
    homeProviderFalse = Provider.of<HomeProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Container(margin: EdgeInsets.only(left: 5.w),child: Image.asset("assets/image/menu.png",height: 5.h,width: 5.h,color: Colors.black45,)),
          title: Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 4.9.h,
                  width: 4.9.h,
                  decoration: BoxDecoration(
                      color: Color(0xFFFF3A44),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "N",
                    style: GoogleFonts.merriweather(
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        fontSize: 23.sp
                    ),
                  ),
                ),
                Container(
                  height: 7.h,
                  width: 90,
                  margin: EdgeInsets.only(top: 1.4.h,left: 2.1.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "NEWS",
                        style: GoogleFonts.merriweather(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFFFF3A44),
                        ),
                      ),
                      Text(
                        "TODAY",
                        style: GoogleFonts.merriweather(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFFFF3A44),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          centerTitle: true,
          actions: [
            Container(margin: EdgeInsets.only(right: 5.w),child: Image.asset("assets/image/notification.png",height: 3.h,width: 3.h,)),
          ],
          // bottom: ,
        ),
        backgroundColor: Colors.white,
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: (){
                    homeProviderFalse!.ChnageName("Food");
                    Navigator.pushNamed(context, "View");
                  },
                  child: container2(context,Icons.food_bank_outlined),
                ),
                InkWell(
                    onTap: (){
                  homeProviderFalse!.ChnageName("Health");
                  Navigator.pushNamed(context, "View");
                }, child: container2(context,Icons.family_restroom)),
                InkWell(
                  onTap: (){
                    homeProviderFalse!.ChnageName("Media");
                    Navigator.pushNamed(context, "View");
                  },
                    child: container2(context,Icons.camera_indoor),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //SizedBox(width: 0.w,),
                Text(
                  "Food",
                  style: GoogleFonts.merriweather(
                    fontSize: 15.sp,
                    color: Colors.black,
                  ),
                ),
                //SizedBox(width: 1.w,),
                Text(
                  "Health",
                  style: GoogleFonts.merriweather(
                    fontSize: 15.sp,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Media",
                  style: GoogleFonts.merriweather(
                    fontSize: 15.sp,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.1.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: (){
                    homeProviderFalse!.ChnageName("Bollywood");
                    Navigator.pushNamed(context, "View");
                  },
                  child: container2(context,Icons.movie),
                ),
                InkWell(
                    onTap: (){
                      homeProviderFalse!.ChnageName("Tollywood");
                      Navigator.pushNamed(context, "View");
                    },
                    child: container2(context,Icons.movie_creation_outlined)),
                InkWell(
                  onTap: (){
                    homeProviderFalse!.ChnageName("Hollywood");
                    Navigator.pushNamed(context, "View");
                  },
                  child: container2(context,Icons.movie_filter_rounded),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Bollywood",
                  style: GoogleFonts.merriweather(
                    fontSize: 15.sp,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Tollywood",
                  style: GoogleFonts.merriweather(
                    fontSize: 15.sp,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Hollywood",
                  style: GoogleFonts.merriweather(
                    fontSize: 15.sp,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.1.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: (){
                    homeProviderFalse!.ChnageName("General");
                    Navigator.pushNamed(context, "View");
                  },
                  child: container2(context,Icons.person),
                ),
                InkWell(
                    onTap: (){
                      homeProviderFalse!.ChnageName("Business");
                      Navigator.pushNamed(context, "View");
                    },
                    child: container2(context,Icons.work_outline)),
                InkWell(
                  onTap: (){
                    homeProviderFalse!.ChnageName("Weather");
                    Navigator.pushNamed(context, "View");
                  },
                  child: container2(context,Icons.cloud),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "General",
                  style: GoogleFonts.merriweather(
                    fontSize: 15.sp,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Business",
                  style: GoogleFonts.merriweather(
                    fontSize: 15.sp,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Weather",
                  style: GoogleFonts.merriweather(
                    fontSize: 15.sp,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.1.h,),
          ],
        )
      ),
    );
  }
}
