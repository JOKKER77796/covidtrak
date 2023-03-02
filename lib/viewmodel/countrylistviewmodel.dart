import 'package:connectivity/connectivity.dart';
import 'package:covidtrak/Services/CountryService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Models/Countrymodel.dart';
import '../screens/SCountryScreen.dart';

class CountryListViewModel with ChangeNotifier {
  ConnectivityResult _crc = ConnectivityResult.none;
  bool _conected = true;
  String ab = "";

  List<ContryModel> Countrylist = [];

  bool get conected => _conected;
  CountryListViewModel() {
    print("cnstrctr");
    GetList();
    Connectivity().onConnectivityChanged.listen((even) {
      resulthandlerc(even);
      print(even);
    });
  }

  void searchstrng(String a) {
    ab = a.toLowerCase();

    notifyListeners();
  }

  void GetList() async {
    print('imcalled');
    List<dynamic> acl = await CountryService.Countrydata();
    List<ContryModel> temp = [];

    for (var a in acl) {
      ContryModel cn = ContryModel.fromJson(a);
      temp.add(cn);
    }

    Countrylist = temp;

    notifyListeners();
  }

  Future<void> resulthandlerc(ConnectivityResult result) async {
    _crc = result;
    if (_crc == ConnectivityResult.none) {
      _conected = false;
    } else {
      _conected = true;
    }
    notifyListeners();
  }

  void INIconecc() async {
    ConnectivityResult cr = await (Connectivity().checkConnectivity());
    resulthandlerc(cr);
  }

  void csbtn(ContryModel cm, BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ScountryScreen(
                  cm: cm,
                )));
  }
}
