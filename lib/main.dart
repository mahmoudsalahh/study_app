import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salahh/layout/home_layout.dart';
import 'package:salahh/modules//counterscreen/counter_screen.dart';
import 'package:salahh/modules//designmessanger/desginmessanger.dart';
import 'package:salahh/modules//home_screen/home_screen.dart';
import 'package:salahh/modules/ibm_calculator/ibmcalculator.dart';
import 'package:salahh/modules/login_screen/loginscreen.dart';
import 'package:salahh/modules/settings/settings.dart';
import 'package:salahh/shared/app_provider/provider.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
        create: (context)=> AppProvider()..createDatabae()
          ,)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
      home : HomeLayout(),

      ),
    );

  }
}
