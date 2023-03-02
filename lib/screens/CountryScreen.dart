import 'package:covidtrak/Services/CountryService.dart';
import 'package:covidtrak/screens/SCountryScreen.dart';
import 'package:flutter/material.dart';
import 'package:covidtrak/Models/Countrymodel.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../viewmodel/countrylistviewmodel.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen>
    with TickerProviderStateMixin {
  CountryListViewModel cl = CountryListViewModel();
  CountryService countryService = CountryService();
  TextEditingController SearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 3, 3, 3)),
              onPressed: () {
                Navigator.pop(context);
              }),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Consumer<CountryListViewModel>(builder: (context, value, child) {
          return (value.conected == true)
              ? SafeArea(
                  child: Center(
                      child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Listener(
                        child: TextField(
                          controller: SearchController,
                          onChanged: (val) {
                            value.searchstrng(val);
                          },
                          decoration: InputDecoration(
                              hintText: "Search Country",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 20)),
                        ),
                      ),
                    ),
                    Container(
                      child: Expanded(
                        child: (value.Countrylist.isNotEmpty)
                            ? ListView.builder(
                                itemCount: value.Countrylist.length,
                                itemBuilder: (context, index) {
                                  ContryModel cm = value.Countrylist[index];
                                  if (SearchController.text.isEmpty) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ScountryScreen(cm: cm)));
                                      },
                                      child: ListTile(
                                        subtitle: Text(
                                            "Cases - " + cm.cases.toString()),
                                        title: Text(cm.country.toString()),
                                        leading: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              cm.countryInfo!.flag.toString()),
                                        ),
                                      ),
                                    );
                                  } else if (cm.country!.toLowerCase().contains(
                                      SearchController.text.toLowerCase())) {
                                    return InkWell(
                                      onTap: () {
                                        value.csbtn(cm, context);
                                      },
                                      child: ListTile(
                                        subtitle: Text(
                                            "Cases - " + cm.cases.toString()),
                                        title: Text(cm.country.toString()),
                                        leading: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              cm.countryInfo!.flag.toString()),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Container();
                                  }
                                })
                            : ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: 10,
                                itemBuilder: (BuildContext context, int index) {
                                  return Shimmer.fromColors(
                                      child: ListTile(
                                        title: Container(
                                          height: 10,
                                          width: 80,
                                          color: Colors.white,
                                        ),
                                        subtitle: Container(
                                          height: 10,
                                          width: 80,
                                          color: Colors.white,
                                        ),
                                        leading: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                        ),
                                      ),
                                      baseColor:
                                          Color.fromARGB(255, 94, 94, 94),
                                      highlightColor:
                                          Color.fromARGB(255, 185, 184, 184));
                                }),
                      ),
                    ),
                  ],
                )))
              : Center(
                  child: Container(
                      child: Center(
                    child: Text(
                      "No Internet Connection!",
                      style: TextStyle(
                          color: Color.fromARGB(255, 76, 76, 76), fontSize: 20),
                    ),
                  )),
                );
        }));
  }
}
