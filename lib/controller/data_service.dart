import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

String apikey = dotenv.get('api');

class DataService {
  Future<NewsModel> fetchNewsList(String info, String ctry) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=$ctry&category=$info&pageSize=60&apiKey=$apikey";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // print(response.body);
      return NewsModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load news');
    }
  }
}
