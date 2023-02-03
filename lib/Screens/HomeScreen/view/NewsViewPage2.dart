import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/Screens/HomeScreen/provider/HomeProvider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class NewsViewPage2 extends StatefulWidget {
  const NewsViewPage2({Key? key}) : super(key: key);

  @override
  State<NewsViewPage2> createState() => _NewsViewPage2State();
}

class _NewsViewPage2State extends State<NewsViewPage2> {
  HomeProvider? homeProviderTrue;
  HomeProvider? homeProviderFalse;

  @override
  Widget build(BuildContext context) {
    homeProviderTrue = Provider.of<HomeProvider>(context, listen: true);
    homeProviderFalse = Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back,color: Colors.red,size: 30,),
          ),
          title: Text(
            "${homeProviderTrue!.articles!.source!.name}'s News",
            style: GoogleFonts.merriweather(
              fontSize: 15.sp,
              fontWeight: FontWeight.w900,
              color: Color(0xFFFF3A44),
              textStyle: TextStyle(overflow: TextOverflow.ellipsis)
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: MediaQuery.of(context).size.height/3,
                width: MediaQuery.of(context).size.width/1.5,
                margin: EdgeInsets.only(bottom: 43.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 21,
                      offset: Offset(0,0)
                    )
                  ]
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    "${homeProviderTrue!.articles!.urlToImage}",
                    fit: BoxFit.fill,
                    height: MediaQuery.of(context).size.height/2,
                    width: MediaQuery.of(context).size.width/1,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                  margin: EdgeInsets.only(top: 3.h,left: 6.w),
                  child: ListTile(
                    leading: Text(
                      "Title  :",
                      style: GoogleFonts.merriweather(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          textStyle: TextStyle(overflow: TextOverflow.ellipsis)
                      ),
                    ),
                    title: Text(
                      "${homeProviderTrue!.articles!.title}",
                      style: GoogleFonts.merriweather(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFFFF3A44),
                          textStyle: TextStyle(overflow: TextOverflow.ellipsis)
                      ),
                    ),
                  )
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(top: 12.h,left: 6.w),
                child: ListTile(
                  leading: Text(
                    "Author  :",
                    style: GoogleFonts.merriweather(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                        textStyle: TextStyle(overflow: TextOverflow.ellipsis)
                    ),
                  ),
                  title: Text(
                    "${homeProviderTrue!.articles!.author==null?"":homeProviderTrue!.articles!.author}",
                    style: GoogleFonts.merriweather(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFFFF3A44),
                        textStyle: TextStyle(overflow: TextOverflow.ellipsis)
                    ),
                  ),
                )
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                  margin: EdgeInsets.only(top: 21.h,left: 6.w),
                  child: ListTile(
                    leading: Text(
                      "Time  :",
                      style: GoogleFonts.merriweather(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          textStyle: TextStyle(overflow: TextOverflow.ellipsis)
                      ),
                    ),
                    title: Text(
                      "${homeProviderTrue!.articles!.publishedAt}",
                      style: GoogleFonts.merriweather(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFFFF3A44),
                          textStyle: TextStyle(overflow: TextOverflow.ellipsis)
                      ),
                    ),
                  )
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: (){
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black38,
                                    blurRadius: 15,
                                    offset: Offset(0,0)
                                )
                              ],
                              //borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Container(
                                height: 10.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black38,
                                          blurRadius: 9,
                                          offset: Offset(0,0)
                                      )
                                    ],
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))
                                ),
                                alignment: Alignment.bottomCenter,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 2.1.h),
                                      child: Text(
                                        "${homeProviderTrue!.articles!.author==null?"":homeProviderTrue!.articles!.author}",
                                        style: GoogleFonts.merriweather(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w900,
                                            color: Color(0xFFFF3A44),
                                            textStyle: TextStyle(overflow: TextOverflow.ellipsis)
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 1.5.h,),
                                    Container(
                                      height: MediaQuery.of(context).size.height/90,
                                      width: MediaQuery.of(context).size.width/6,
                                      margin: EdgeInsets.only(top: 1.h),
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black38,
                                                blurRadius: 9,
                                                offset: Offset(0,0)
                                            )
                                          ],
                                          borderRadius: BorderRadius.circular(15)
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 3.h),
                                child: Text(
                                  "Description",
                                  style: GoogleFonts.merriweather(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black,
                                      textStyle: TextStyle(overflow: TextOverflow.ellipsis)
                                  ),
                                ),
                              ),
                              Container(
                                width: 90.w,
                                height: 29.h,
                                margin: EdgeInsets.only(top: 3.h),
                                child: Text(
                                  "${homeProviderTrue!.articles!.description}\n\n${homeProviderTrue!.articles!.content}",
                                  maxLines: 17,
                                  style: GoogleFonts.merriweather(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w900,
                                      color: Color(0xFFFF3A44),
                                      textStyle: TextStyle(overflow: TextOverflow.ellipsis)
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'Url');
                                },
                                child: Text(
                                  "Read More....",
                                  style: GoogleFonts.merriweather(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.blue,
                                    // textStyle: TextStyle(overflow: TextOverflow.ellipsis)
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height/4.6,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        blurRadius: 15,
                        offset: Offset(0,0)
                      )
                    ],
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height/90,
                        width: MediaQuery.of(context).size.width/6,
                        margin: EdgeInsets.only(top: 1.h),
                        decoration: BoxDecoration(
                          color: Colors.red,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 9,
                                  offset: Offset(0,0)
                              )
                            ],
                          borderRadius: BorderRadius.circular(15)
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 3.h),
                        child: Text(
                          "Description",
                          style: GoogleFonts.merriweather(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                              textStyle: TextStyle(overflow: TextOverflow.ellipsis)
                          ),
                        ),
                      ),
                      Container(
                        width: 87.w,
                        height: 10.h,
                        margin: EdgeInsets.only(top: 3.h),
                        child: Text(
                          "${homeProviderTrue!.articles!.description}\n\n${homeProviderTrue!.articles!.content}",
                          maxLines: 6,
                          style: GoogleFonts.merriweather(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFFFF3A44),
                              textStyle: TextStyle(overflow: TextOverflow.ellipsis)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}
