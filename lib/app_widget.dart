//Ruan Ranison

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mrfr_pay/screens/boleto_screen.dart';
import 'package:mrfr_pay/screens/extrato_screen.dart';
import 'package:mrfr_pay/screens/home_screen.dart';
import 'package:mrfr_pay/screens/insert_boleto_screen.dart';
import 'package:mrfr_pay/screens/scanner_screen.dart';
import 'package:mrfr_pay/style/app_colors.dart';

class AppWidget extends StatelessWidget {
  AppWidget({Key? key}) : super(key: key) {
    // 
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: AppColors.primary),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PayFlow',
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: AppColors.primary,
      ),
      initialRoute: '/home',
      routes: {
        //'/splash': (context) => SplashPage(),
        '/home': (context) => const HomeScreen(),
        //'/login': (context) => LoginPage(),
        '/insert_boleto': (context) => const InsertBoletoScreen(),
        '/scanner': (context) => const ScannerScreen(),
        '/boleto': (context) => const BoletoScreen(),
        '/extrato': (context) => const ExtratoScreen(),
      },
    );
  }
}