import 'package:flutter/material.dart';
import 'package:mrfr_pay/data/DBHelper.dart';
import 'package:mrfr_pay/style/app_colors.dart';
import 'package:mrfr_pay/style/app_images.dart';
import 'package:sqflite/sqflite.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({ Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    navigatorHome(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Center(child: Image.asset(AppImages.union)),
          Center(child: Image.asset(AppImages.logofull, width: 250, height: 250,),),
        ],
      ),
    );
  }
  Future<void> navigatorHome(BuildContext context) {
    return Future.delayed(
      const Duration(seconds: 5), () async {
        DBHelper dbHelper = DBHelper();
        Database database = await dbHelper.initDB();
        Navigator.pushReplacementNamed(context, '/login');
      }
    );
  }
}