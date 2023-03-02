import 'package:covidtrak/viewmodel/countrylistviewmodel.dart';
import 'package:covidtrak/viewmodel/homeviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:covidtrak/screens/SplashScreen.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => HomeViewModel()),
          ChangeNotifierProvider(create: (context) => CountryListViewModel()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ));
  }
}
