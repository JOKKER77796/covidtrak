import 'dart:convert';
import 'dart:io';

import 'package:covidtrak/Models/Countrymodel.dart';
import 'package:covidtrak/Services/util/Appurl.dart';
import 'package:covidtrak/screens/SplashScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class CountryService {
  static Future<List<dynamic>> Countrydata() async {
    try {
      final responce = await http.get(Uri.parse(AppUrl.Countryurl));
      var data = jsonDecode(responce.body);
      List<dynamic> cl = data as List<dynamic>;

      return cl;
    } on SocketException {
      throw SplashScreen();
    }
  }
}
