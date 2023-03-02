import 'package:connectivity/connectivity.dart';
import 'package:covidtrak/Models/Countrymodel.dart';
import 'package:covidtrak/Models/Homemodel.dart';
import 'package:covidtrak/Services/HomeService.dart';
import 'package:covidtrak/screens/CountryScreen.dart';
import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  var bm;
  ConnectivityResult _cr = ConnectivityResult.none;
  bool _conectedh = false;

  bool get conected => _conectedh;

  HomeViewModel() {
    Connectivity().onConnectivityChanged.listen((event) {
      resulthandler(event);
      print(event);
    });
    getlist();
  }

  void getlist() async {
    HomeModel hm = await HomeService.HomeData();
    bm = hm;
    notifyListeners();
  }

  Future<void> resulthandler(ConnectivityResult result) async {
    _cr = result;
    if (_cr == ConnectivityResult.none) {
      _conectedh = false;
    } else {
      _conectedh = true;
    }
    notifyListeners();
  }

  void contrytrcr(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CountryScreen()));
  }
}
