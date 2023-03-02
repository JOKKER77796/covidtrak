import 'dart:convert';

import 'package:covidtrak/Models/Homemodel.dart';
import 'package:covidtrak/Services/util/Appurl.dart';
import 'package:http/http.dart' as http;

class HomeService {
  static Future<HomeModel> HomeData() async {
    try {
      var responce = await http.get(Uri.parse(AppUrl.Homeurl));
      var data = jsonDecode(responce.body);

      HomeModel homelist = HomeModel.fromJson(data);

      return homelist;
    } catch (e) {
      print(e);
      var data = "";
      HomeModel homelist = data as HomeModel;
      return homelist;
    }
  }
}
