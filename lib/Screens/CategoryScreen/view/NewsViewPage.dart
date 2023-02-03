import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/Screens/HomeScreen/model/NewsModel.dart';
import 'package:news_app/Screens/HomeScreen/provider/HomeProvider.dart';
import 'package:news_app/Utils/api_http.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class NewsViewPage extends StatefulWidget {
  const NewsViewPage({Key? key}) : super(key: key);

  @override
  State<NewsViewPage> createState() => _NewsViewPageState();
}

class _NewsViewPageState extends State<NewsViewPage> {
  HomeProvider? homeProviderTrue;
  HomeProvider? homeProviderFalse;

  @override
  Widget build(BuildContext context) {
    homeProviderTrue = Provider.of<HomeProvider>(context, listen: true);
    homeProviderFalse = Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back,color: Colors.red,size: 30,),
            ),
            backgroundColor: Colors.white,
            title: Text("${homeProviderTrue!.CetegoryName}'s News",
              style: GoogleFonts.merriweather(
                  color: Colors.red, fontWeight: FontWeight.w900),),
            centerTitle: true,
          ),
          backgroundColor: Colors.white,
          body: FutureBuilder<NewsModel?>(
            future: NewsData().getNewsData(
                "india", "${homeProviderTrue!.CetegoryName}"),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text("${snapshot.error}"),);
              }
              else if (snapshot.hasData) {
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
                        height: MediaQuery.of(context).size.height / 4,
                        width: MediaQuery.of(context).size.width / 1,
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  "${list![index].urlToImage}", fit: BoxFit.fill,
                                   height: MediaQuery.of(context).size.height / 4,
                                   width: MediaQuery.of(context).size.width / 1,
                                )),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 6.h,
                                width: 60.w,
                                margin: EdgeInsets.only(
                                    left: 12.w, bottom: 0.5.h),
                                child: Text(
                                  "${list[index].title}",
                                  maxLines: 2,
                                  style: GoogleFonts.merriweather(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 12.sp,
                                      color: Colors.white,
                                      textStyle: TextStyle(
                                          overflow: TextOverflow.ellipsis)
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              return Center(
                child: CircularProgressIndicator(color: Colors.red,),);
            },
          ),
      ),
    );
  }
}
