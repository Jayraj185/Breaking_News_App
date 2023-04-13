import 'dart:convert';

import 'package:news_app/Screens/HomeScreen/model/NewsModel.dart';
import 'package:http/http.dart' as http;

class NewsData
{
  Future<NewsModel?> getNewsData(country,cat)async
  {
    var response = await http.get(
        Uri.parse("https://newsapi.org/v2/everything?q=$country($cat)&from=${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day - 1}&to=${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}&sortBy=popularity&apiKey=dd639a0a034f4c77b0fde97fb5ea581d")
    );
    if(response.statusCode==200)
    {
      var json = jsonDecode(response.body);
      return NewsModel.fromJson(json);
    }
    else
    {
      return null;
    }
  }
}