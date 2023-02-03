import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/Screens/HomeScreen/model/NewsModel.dart';
import 'package:news_app/Screens/HomeScreen/provider/HomeProvider.dart';
import 'package:news_app/Utils/api_http.dart';
import 'package:news_app/Utils/container.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeProvider? homeProviderTrue;
  HomeProvider? homeProviderFalse;
  @override
  Widget build(BuildContext context) {
    homeProviderTrue = Provider.of<HomeProvider>(context,listen: true);
    homeProviderFalse = Provider.of<HomeProvider>(context,listen: false);
    return SafeArea(
      child: DefaultTabController(
        length: 12,
        child: Scaffold(
          backgroundColor: Colors.white,
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
            bottom: TabBar(
              labelColor: Color(0xFFFF3A44),
              indicatorColor: Color(0xFFFF3A44),
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              onTap: (value) {
                homeProviderFalse!.ChnageIndex(value);
              },
              tabs: homeProviderTrue!.countrys.map((e) => Tab(text: "$e",)).toList()
            ),
            // bottom: ,
          ),
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              // Container(
              //   height: 8.h,
              //   //color: Colors.redAccent,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Container(margin: EdgeInsets.only(left: 5.w),child: Image.asset("assets/image/menu.png",height: 5.h,width: 5.h,color: Colors.black45,)),
              //       Container(
              //         child: Row(
              //           children: [
              //             Container(
              //               height: 4.9.h,
              //               width: 4.9.h,
              //               decoration: BoxDecoration(
              //                 color: Color(0xFFFF3A44),
              //                 borderRadius: BorderRadius.circular(5)
              //               ),
              //               alignment: Alignment.center,
              //               child: Text(
              //                 "N",
              //                 style: GoogleFonts.merriweather(
              //                   fontWeight: FontWeight.w900,
              //                   color: Colors.white,
              //                   fontSize: 23.sp
              //                 ),
              //               ),
              //             ),
              //             Container(
              //               height: 7.h,
              //               width: 90,
              //               margin: EdgeInsets.only(top: 1.4.h,left: 2.1.w),
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     "NEWS",
              //                     style: GoogleFonts.merriweather(
              //                       fontSize: 14.sp,
              //                       fontWeight: FontWeight.w900,
              //                       color: Color(0xFFFF3A44),
              //                     ),
              //                   ),
              //                   Text(
              //                     "TODAY",
              //                     style: GoogleFonts.merriweather(
              //                       fontSize: 14.sp,
              //                       fontWeight: FontWeight.w900,
              //                       color: Color(0xFFFF3A44),
              //                     ),
              //                   )
              //                 ],
              //               ),
              //             )
              //           ],
              //         ),
              //       ),
              //       Container(margin: EdgeInsets.only(right: 5.w),child: Image.asset("assets/image/notification.png",height: 3.h,width: 3.h,)),
              //     ],
              //   ),
              // ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 6.w,top: 1.5.h),
                  child: Text(
                    "Quick Reads",
                    style: GoogleFonts.merriweather(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 15.sp
                    ),
                  ),
                ),
              ),
              Container(
                height: 15.h,
                width: MediaQuery.of(context).size.width,
                child: FutureBuilder<NewsModel?>(
                  future: NewsData().getNewsData("${homeProviderTrue!.countrys[homeProviderTrue!.index]}","${homeProviderTrue!.countrys[homeProviderTrue!.index]}"),
                  builder: (context, snapshot) {
                    if(snapshot.hasError)
                    {
                      return Text("${snapshot.error}");
                    }
                    else if(snapshot.hasData)
                    {
                      List<Articles>? list = snapshot.data!.articles;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemCount: list!.length,
                        itemBuilder: (context, index) {
                          return Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              children: [
                                Container(
                                  height: 10.h,
                                  width: 10.h,
                                  margin: EdgeInsets.only(left: 6.w,top: 1.h),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle
                                  ),
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: 9.h,
                                    width: 9.h,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle
                                    ),
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 8.5.h,
                                      width: 8.5.h,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(100)
                                      ),
                                      child: CircleAvatar(
                                        radius: 8.5.h,
                                        backgroundColor: Colors.red,
                                        backgroundImage: NetworkImage("${list[index].urlToImage}"),
                                      ),
                                      // child: ClipRRect(borderRadius: BorderRadius.circular(100),child: Image.network("${list![index].urlToImage}",fit: BoxFit.fill,)),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 15.w,
                                  margin: EdgeInsets.only(left: 6.w,top: 1.h),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "${list[index].source!.name}",
                                    style: GoogleFonts.merriweather(
                                        fontSize: 15.sp,
                                        color: Colors.black,
                                        textStyle: TextStyle(overflow: TextOverflow.ellipsis)
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }
                    return Center(child: CircularProgressIndicator(color: Color(0xFFFF3A44),));
                  },
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 6.w,top: 2.1.h,right: 6.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Top News",
                        style: GoogleFonts.merriweather(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 15.sp
                        ),
                      ),
                      Text(
                        "See All",
                        style: GoogleFonts.merriweather(
                            color: Colors.grey,
                            fontSize: 12.sp
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 22.h,
                width: MediaQuery.of(context).size.width,
                child: FutureBuilder<NewsModel?>(
                  future: NewsData().getNewsData("${homeProviderTrue!.countrys[homeProviderTrue!.index]}", "top-news"),
                  builder: (context,snapshot) {
                    if(snapshot.hasError)
                      {
                        return Center(child: Text("${snapshot.error}"),);
                      }
                    else if(snapshot.hasData)
                      {
                        List<Articles>? list = snapshot.data!.articles;
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemCount: list!.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (){
                                homeProviderFalse!.AddData(list[index]);
                                Navigator.pushNamed(context, "View2");
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    height: 21.h,
                                    width: 70.w,
                                    margin: EdgeInsets.only(left: 6.w,top: 1.h),
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(21)
                                    ),
                                    child: ClipRRect(borderRadius: BorderRadius.circular(21),child: Image.network("${list![index].urlToImage}",fit: BoxFit.fill,)),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      height: 6.h,
                                      width: 60.w,
                                      margin: EdgeInsets.only(left: 12.w,bottom: 0.5.h),
                                      //color: Colors.red,
                                      child: Text(
                                        "${list[index].title}",
                                        maxLines: 2,
                                        style: GoogleFonts.merriweather(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 12.sp,
                                          color: Colors.white,
                                          textStyle: TextStyle(overflow: TextOverflow.ellipsis)
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      }
                    return Center(child: CircularProgressIndicator(color: Color(0xFFFF3A44),));
                  }
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 6.w,top: 2.1.h),
                  child: Text(
                    "Today's News",
                    style: GoogleFonts.merriweather(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp
                    ),
                  ),
                ),
              ),
              Container(
                height: 6.5.h,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.topLeft,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: homeProviderTrue!.DataList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        homeProviderFalse!.ChnageBoolValue(index);
                      },
                      child: contaner(homeProviderTrue!.DataList[index].width!,homeProviderTrue!.DataList[index].condition!,homeProviderTrue!.DataList[index].nameList),
                    );
                  },

                ),
              ),
              SizedBox(height: 1.5.h,),
              Container(
                height: 60.h,
                child: FutureBuilder<NewsModel?>(
                  // future: homeProviderTrue!.SelectedNews("${homeProviderTrue!.countrys[homeProviderTrue!.index]}"),
                  future: NewsData().getNewsData("${homeProviderTrue!.countrys[homeProviderTrue!.ind]}", "${homeProviderTrue!.DataList[homeProviderTrue!.ind].nameList}"),
                  builder: (context, snapshot) {

                    if(snapshot.hasError)
                      {
                        return Center(child: Text("${snapshot.error}"));
                      }
                    else if(snapshot.hasData)
                      {
                        List<Articles>? list = snapshot.data!.articles;
                        return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: list!.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (){
                                homeProviderFalse!.AddData(list[index]);
                                Navigator.pushNamed(context, "View2");
                              },
                              child: Container(
                                height: 15.h,
                                width: MediaQuery.of(context).size.width,
                                //color: Colors.red,
                                margin: EdgeInsets.only(left: 6.w,right: 6.w,top: 0.1.h),
                                child: Column(
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 13.h,
                                      width: MediaQuery.of(context).size.width,
                                      //color: Colors.blue,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 12.h,
                                            width: 35.w,
                                            decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius: BorderRadius.circular(15)
                                            ),
                                            child: list![index].urlToImage==null?Center(child: Text("Image Not Available")):ClipRRect(
                                              borderRadius: BorderRadius.circular(15),
                                              child: Image.network("${list![index].urlToImage}",fit: BoxFit.fill,),
                                            ),
                                          ),
                                          Container(
                                            height: 15.h,
                                            width: 51.w,
                                            margin: EdgeInsets.only(left: 2.w),
                                            //color: Colors.red,
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 6.h,
                                                  width: 50.w,
                                                  margin: EdgeInsets.only(top: 1.3.h),
                                                  // color: Colors.blue,
                                                  child: Text(
                                                    "${list![index].title}",
                                                    maxLines: 2,
                                                    style: GoogleFonts.merriweather(
                                                        color: Colors.black,
                                                        fontSize: 15.sp,
                                                        textStyle: TextStyle(
                                                            overflow: TextOverflow.ellipsis
                                                        ),
                                                        fontWeight: FontWeight.w400
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 5.h,
                                                  width: 50.w,
                                                  // color: Colors.yellow,
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        width: 8.w,
                                                        height: 2.1.h,
                                                        child: Text(
                                                          "${list[index].author==null?"":list[index].author}",
                                                          style: TextStyle(
                                                              color: Colors.grey,
                                                              fontSize: 12.sp,
                                                            overflow: TextOverflow.ellipsis
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 2.1.w,),
                                                      Text.rich(
                                                          TextSpan(
                                                            text: "•",
                                                            style: TextStyle(
                                                                color: Colors.grey.shade600,
                                                                fontSize: 15.sp
                                                            ),
                                                          )
                                                      ),
                                                      Container(
                                                        width: 12.w,
                                                        height: 2.1.h,
                                                        child: Text(
                                                          "${list[index].source!.name}",
                                                          style: TextStyle(
                                                              color: Colors.grey,
                                                              fontSize: 12.sp,
                                                              overflow: TextOverflow.ellipsis
                                                          ),
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      Container(
                                                        width: 23.w,
                                                        height: 2.1.h,
                                                        child: Text(
                                                          "${list[index].publishedAt}",
                                                          style: TextStyle(
                                                              color: Colors.grey,
                                                              fontSize: 12.sp,
                                                              overflow: TextOverflow.ellipsis
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),

                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Divider(thickness: 1,)
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    return Center(child: CircularProgressIndicator(color: Color(0xFFFF3A44),),);

                  },
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 6.w,top: 2.1.h),
                  child: Text(
                    "Company's News",
                    style: GoogleFonts.merriweather(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp
                    ),
                  ),
                ),
              ),
              Container(
                height: 6.5.h,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.topLeft,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: homeProviderTrue!.DataList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        homeProviderFalse!.ChnageBoolValue2(index);
                      },
                      child: contaner(homeProviderTrue!.CompanyDataList[index].width!,homeProviderTrue!.CompanyDataList[index].condition!,homeProviderTrue!.CompanyDataList[index].nameList),
                    );
                  },

                ),
              ),
              SizedBox(height: 1.5.h,),
              Container(
                height: 60.h,
                child: FutureBuilder<NewsModel?>(
                  // future: homeProviderTrue!.SelectedNews("${homeProviderTrue!.countrys[homeProviderTrue!.index]}"),
                  future: NewsData().getNewsData("${homeProviderTrue!.CompanyDataList[homeProviderTrue!.ind2].nameList}", "${homeProviderTrue!.CompanyDataList[homeProviderTrue!.ind2].nameList}"),
                  builder: (context, snapshot) {
                    if(snapshot.hasError)
                    {
                      return Center(child: Text("${snapshot.error}"));
                    }
                    else if(snapshot.hasData)
                    {
                      List<Articles>? list = snapshot.data!.articles;
                      return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: list!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (){
                              homeProviderFalse!.AddData(list[index]);
                              Navigator.pushNamed(context, "View2");
                            },
                            child: Container(
                              height: 15.h,
                              width: MediaQuery.of(context).size.width,
                              //color: Colors.red,
                              margin: EdgeInsets.only(left: 6.w,right: 6.w,top: 0.1.h),
                              child: Column(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 13.h,
                                    width: MediaQuery.of(context).size.width,
                                    //color: Colors.blue,
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 12.h,
                                          width: 35.w,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: list![index].urlToImage==null?Center(child: Text("Image Not Available")):ClipRRect(
                                            borderRadius: BorderRadius.circular(15),
                                            child: Image.network("${list![index].urlToImage}",fit: BoxFit.fill,),
                                          ),
                                        ),
                                        Container(
                                          height: 15.h,
                                          width: 51.w,
                                          margin: EdgeInsets.only(left: 2.w),
                                          //color: Colors.red,
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 6.h,
                                                width: 50.w,
                                                margin: EdgeInsets.only(top: 1.3.h),
                                                // color: Colors.blue,
                                                child: Text(
                                                  "${list![index].title}",
                                                  maxLines: 2,
                                                  style: GoogleFonts.merriweather(
                                                      color: Colors.black,
                                                      fontSize: 15.sp,
                                                      textStyle: TextStyle(
                                                          overflow: TextOverflow.ellipsis
                                                      ),
                                                      fontWeight: FontWeight.w400
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 5.h,
                                                width: 50.w,
                                                // color: Colors.yellow,
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width: 8.w,
                                                      height: 2.1.h,
                                                      child: Text(
                                                        "${list[index].author==null?"":list[index].author}",
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 12.sp,
                                                            overflow: TextOverflow.ellipsis
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 2.1.w,),
                                                    Text.rich(
                                                        TextSpan(
                                                          text: "•",
                                                          style: TextStyle(
                                                              color: Colors.grey.shade600,
                                                              fontSize: 15.sp
                                                          ),
                                                        )
                                                    ),
                                                    Container(
                                                      width: 12.w,
                                                      height: 2.1.h,
                                                      child: Text(
                                                        "${list[index].source!.name}",
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 12.sp,
                                                            overflow: TextOverflow.ellipsis
                                                        ),
                                                      ),
                                                    ),
                                                    Spacer(),
                                                    Container(
                                                      width: 23.w,
                                                      height: 2.1.h,
                                                      child: Text(
                                                        "${list[index].publishedAt}",
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 12.sp,
                                                            overflow: TextOverflow.ellipsis
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Divider(thickness: 1,)
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return Center(child: CircularProgressIndicator(color: Color(0xFFFF3A44),),);

                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
