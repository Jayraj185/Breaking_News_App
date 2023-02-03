import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/Screens/CategoryScreen/view/CategoryPage.dart';
import 'package:news_app/Screens/HomeScreen/model/NewsModel.dart';
import 'package:news_app/Screens/HomeScreen/model/SelectModel.dart';
import 'package:news_app/Screens/HomeScreen/view/HomePage.dart';
import 'package:news_app/Utils/api_http.dart';

class HomeProvider extends ChangeNotifier
{
  //Only's Variable's
  List<SelectModel> DataList = [
    SelectModel(condition: true,nameList: "All",width: 21),
    SelectModel(condition: false,nameList: "Politics",width: 30),
    SelectModel(condition: false,nameList: "Sports",width: 30),
    SelectModel(condition: false,nameList: "Disease",width: 35),
    SelectModel(condition: false,nameList: "Healthy",width: 35),
    SelectModel(condition: false,nameList: "Technology",width: 43),
    SelectModel(condition: false,nameList: "Finance",width: 35),
  ];
  List<SelectModel> CompanyDataList = [
    SelectModel(condition: true,nameList: "Google",width: 30),
    SelectModel(condition: false,nameList: "Apple",width: 33),
    SelectModel(condition: false,nameList: "Microsoft",width: 40),
    SelectModel(condition: false,nameList: "Amazon",width: 36),
    SelectModel(condition: false,nameList: "Tesla",width: 35),
    SelectModel(condition: false,nameList: "Reliance",width: 43),
    SelectModel(condition: false,nameList: "TATA",width: 35),
  ];
  List countrys = [
    "India",
    "Pakistan",
    "Australia",
    "China",
    "United States of America",
    "United Arab Emirates",
    "New Zealand",
    "Bangladesh",
    "Japan",
    "Russia",
    "Korea",
    "France",
  ];
  List Screens = [
    HomePage(),
    CategoryPage(),
    HomePage(),
  ];
  int ind=0;
  int ind2=0;
  int index=0;
  int index2=0;
  String? CetegoryName;
  Articles? articles;
  double? progress;
  //double? height=double.infinity,width=double.infinity;


  //Only's Function's
  void ChnageBoolValue(int index)
  {
    ind=index;
    print("=============== $ind");
    for(int i=0; i<DataList.length; i++)
      {
        if(i==index)
          {
            DataList[i].condition=true;
          }
        else
          {
            DataList[i].condition=false;
          }
      }
    notifyListeners();
  }
  void ChnageBoolValue2(int index)
  {
    ind2=index;
    print("=============== $ind2");
    for(int i=0; i<CompanyDataList.length; i++)
    {
      if(i==index)
      {
        CompanyDataList[i].condition=true;
      }
      else
      {
        CompanyDataList[i].condition=false;
      }
    }
    notifyListeners();
  }

  Future<NewsModel?> SelectedNews(String country)
  {
    if(ind==0)
      {
        return NewsData().getNewsData("$country", "all");
      }
    else if(ind==1)
      {
        return NewsData().getNewsData("$country", "politics");
      }
    else if(ind==2)
      {
        return NewsData().getNewsData("$country", "sports");
      }
    else if(ind==3)
      {
        return NewsData().getNewsData("$country", "disease");
      }
    else if(ind==4)
      {
        return NewsData().getNewsData("$country", "health");
      }
    else if(ind==5)
      {
        return NewsData().getNewsData("$country", "technology");
      }
    else
      {
        return NewsData().getNewsData("$country", "finance");
      }
    notifyListeners();
  }

  void ChnageIndex(i)
  {
    index=i;
    print("====== $index");
    notifyListeners();
  }
  void ChnageIndex2(newindex)
  {
    index2=newindex;
    print("====== $index2");
    notifyListeners();
  }
  void ChnageName(name)
  {
    CetegoryName=name;
    print("====== $CetegoryName");
    notifyListeners();
  }
  void AddData(newsdata)
  {
    articles = newsdata;
    notifyListeners();
  }
  void ChnageProgress(progre)
  {
    progress=progre;
    print("====== $progress");
    notifyListeners();
  }

}