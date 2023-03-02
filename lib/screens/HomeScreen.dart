import 'package:connectivity/connectivity.dart';
import 'package:covidtrak/screens/CountryScreen.dart';
import 'package:covidtrak/viewmodel/homeviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:covidtrak/wids/Reusble.dart';
import 'package:covidtrak/Models/Homemodel.dart';
import 'package:covidtrak/Services/HomeService.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  HomeService homeService = HomeService();

  final colorlist = <Color>[
    Color.fromARGB(255, 96, 153, 245),
    Color.fromARGB(255, 80, 211, 80),
    Color.fromARGB(255, 255, 1, 13)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<HomeViewModel>(
      builder: (context, value, child) {
        if (value.conected == true) {
          if (value.bm != null) {
            HomeModel hm = value.bm;
            return SingleChildScrollView(
              child: SafeArea(
                  child: Center(
                child: Column(children: [
                  const SizedBox(
                    height: 40,
                  ),
                  PieChart(
                    dataMap: {
                      "Total": double.parse(hm.cases.toString()),
                      "Recovered": double.parse(hm.recovered.toString()),
                      "Deth": double.parse(hm.deaths.toString()),
                    },
                    colorList: colorlist,
                    chartValuesOptions: const ChartValuesOptions(
                        showChartValuesInPercentage: true),
                    chartType: ChartType.ring,
                    chartRadius: MediaQuery.of(context).size.width / 3.2,
                    legendOptions:
                        LegendOptions(legendPosition: LegendPosition.left),
                    animationDuration: Duration(seconds: 2),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Rrow(Title: "Overall Cases", Value: hm.cases.toString()),
                  Rrow(
                      Title: "Overall Recovered",
                      Value: hm.recovered.toString()),
                  Rrow(Title: "Overall Deaths", Value: hm.deaths.toString()),
                  Rrow(
                      Title: "Overall Creitical",
                      Value: hm.critical.toString()),
                  Rrow(Title: "Today Cases", Value: hm.todayCases.toString()),
                  Rrow(Title: "Today Recovered", Value: hm.critical.toString()),
                  Rrow(Title: "Today Deaths", Value: hm.todayDeaths.toString()),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: InkWell(
                      onTap: () {
                        value.contrytrcr(context);
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text(
                            "Country Tracker",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  )
                ]),
              )),
            );
          } else {
            return SpinKitCircle(
              color: Colors.black,
              size: 100,
              controller: AnimationController(
                  vsync: this, duration: Duration(seconds: 5)),
            );
          }
        } else {
          return Center(
            child: Container(
                child: Center(
              child: Text(
                "No Internet Connection!",
                style: TextStyle(
                    color: Color.fromARGB(255, 76, 76, 76), fontSize: 20),
              ),
            )),
          );
        }
      },
    ));
  }
}
