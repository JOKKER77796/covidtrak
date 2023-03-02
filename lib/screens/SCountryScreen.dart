import 'package:covidtrak/Models/Countrymodel.dart';
import 'package:covidtrak/wids/Reusble.dart';
import 'package:flutter/material.dart';

class ScountryScreen extends StatelessWidget {
  ContryModel cm;
  ScountryScreen({required this.cm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Center(
                      child: Text(
                    cm.country!,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )),
                ),
                Card(
                  elevation: 0,
                  child: Stack(children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 60),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * .57,
                                width: MediaQuery.of(context).size.width * .85,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromARGB(255, 244, 244, 244)),
                                child: SingleChildScrollView(
                                  child: Column(children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .09,
                                    ),
                                    Rrow(
                                        Title: "Total Population",
                                        Value: cm.population.toString()),
                                    Rrow(
                                        Title: "Overall Cases",
                                        Value: cm.cases.toString()),
                                    Rrow(
                                        Title: "Overall Recovered",
                                        Value: cm.recovered.toString()),
                                    Rrow(
                                        Title: "Overall Deths",
                                        Value: cm.deaths.toString()),
                                    Rrow(
                                        Title: "Total Tested ",
                                        Value: cm.tests.toString()),
                                    Rrow(
                                        Title: "Today Active cases",
                                        Value: cm.active.toString()),
                                  ]),
                                ),
                              )
                            ])),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.black,
                                    spreadRadius: 2)
                              ]),
                          child: CircleAvatar(
                            radius: MediaQuery.of(context).size.width * .18,
                            backgroundImage:
                                NetworkImage(cm.countryInfo!.flag.toString()),
                          ),
                        )
                      ],
                    )
                  ]),
                ),
              ],
            ),
          ),
        ));
  }
}
