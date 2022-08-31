import 'package:flutter/material.dart';
import 'package:mrfr_pay/style/app_colors.dart';
import 'package:mrfr_pay/style/app_images.dart';

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
      const Duration(seconds: 5), () {
        Navigator.pushNamed(context, '/login');
      }
    );
  }
}