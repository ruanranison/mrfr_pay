import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mrfr_pay/data/UserDao.dart';
import 'package:mrfr_pay/domain/user.dart';
import 'package:mrfr_pay/style/app_colors.dart';
import 'package:mrfr_pay/style/app_fonts.dart';
import 'package:mrfr_pay/style/app_images.dart';
import 'package:mrfr_pay/widgets/input_text.dart';
import 'package:mrfr_pay/widgets/label_button.dart';
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
    TextEditingController _usercontroller = TextEditingController();
    TextEditingController _passwordcontroller = TextEditingController();

    return Scaffold(
        backgroundColor: AppColors.background,
        body: SingleChildScrollView(
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: Column(children: [
              Padding(
                  padding: EdgeInsets.only(top: size.height * 0.15),
                  child: Image.asset(AppImages.mrfrpay, width: 303, height: 75)),
              Image.asset(
                AppImages.logomini2,
                width: 82.5,
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70, left: 35, right: 35),
                child: Column(
                  children: [
                    InputTextWidget(
                      controller: _usercontroller,
                      icon: FontAwesomeIcons.user,
                      label: "Usuário",
                    ),
                    InputTextWidget(
                      controller: _passwordcontroller,
                      icon: Icons.lock,
                      label: "Senha",
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.fromBorderSide(
                        BorderSide(color: AppColors.stroke)),
                  ),
                  height: 56,
                  width: 112,
                  child: Column(
                    children: [
                      LabelButton(
                        label: "ENTRAR",
                        onPressed: () async{
                          String user = _usercontroller.text;
                          String senha = _passwordcontroller.text;
                          bool login = await UserDao().autenticar(user, senha);
                          if(login==true) {
                            Navigator.pushReplacementNamed(context, '/home');
                          }
                        },
                        style: AppTextStyles.buttonBackground,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(fontSize: 16),
                    text: 'Ainda não possui uma conta? ',
                    children: [
                      TextSpan(
                        text: 'Cadastre-se',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary),
                        recognizer: TapGestureRecognizer()..onTap = () {
                          Navigator.pushNamed(context, '/cadastro');
                        },
                      )
                    ]
                  )
                ),
              ),
            ]),
          ),
        ));
  }
}
