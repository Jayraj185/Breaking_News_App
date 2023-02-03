import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/Screens/HomeScreen/provider/HomeProvider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class UrlViewPage extends StatefulWidget {
  const UrlViewPage({Key? key}) : super(key: key);

  @override
  State<UrlViewPage> createState() => _UrlViewPageState();
}

class _UrlViewPageState extends State<UrlViewPage> {
  HomeProvider? homeProviderTrue;
  HomeProvider? homeProviderFalse;
  @override
  Widget build(BuildContext context) {
    homeProviderTrue = Provider.of<HomeProvider>(context, listen: true);
    homeProviderFalse = Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
              "${homeProviderTrue!.articles!.author==null?"":homeProviderTrue!.articles!.author}",
            style: GoogleFonts.merriweather(
                fontSize: 15.sp,
                fontWeight: FontWeight.w900,
                color: Color(0xFFFF3A44),
                textStyle: TextStyle(overflow: TextOverflow.ellipsis)
            ),
          ),
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back,color: Colors.red,size: 30,),
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            homeProviderTrue!.progress==1.0?Container():LinearProgressIndicator(color: Colors.red,backgroundColor: Colors.red.shade200,value: homeProviderTrue!.progress,),
            Expanded(
                child: InAppWebView(
                  initialUrlRequest: URLRequest(
                    url: Uri.parse("${homeProviderTrue!.articles!.url}"),
                  ),
                  onProgressChanged: (controller, progress) {
                    homeProviderFalse!.ChnageProgress(progress/100);
                  },
                )
            )
          ],
        )
      ),
    );
  }
}
