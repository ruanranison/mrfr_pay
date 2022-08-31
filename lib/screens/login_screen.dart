import 'package:flutter/material.dart';
import 'package:mrfr_pay/style/app_colors.dart';
import 'package:mrfr_pay/style/app_fonts.dart';
import 'package:mrfr_pay/style/app_images.dart';
import 'package:mrfr_pay/widgets/social_login_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.25), 
              child: Image.asset(
                AppImages.mrfrpay, 
                width: 303, 
                height: 75
              )
            ),
            Image.asset(AppImages.logomini2, width: 82.5, height: 60,),
            Padding(
              padding: const EdgeInsets.only(top: 70, left: 70, right: 70),
              child: Text(
                'Organize seus boletos em um só lugar', 
                style: AppTextStyles.titleHome,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
              child: SocialLoginButton(
                onTap: () => 
                Navigator.pushNamed(context, '/home'),
              ),
            ),
          ]
        ),
      )
    );
  }
}