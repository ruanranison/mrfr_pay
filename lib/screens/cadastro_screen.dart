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

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({Key? key}) : super(key: key);

  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
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
                        label: "CADASTRAR",
                        onPressed: () async {
                          String userDigitado = _usercontroller.text;
                          String senhaDigitada = _passwordcontroller.text;
                          User user = User(username: userDigitado, password: senhaDigitada);
                          await UserDao().cadastrarUser(user: user);
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        style: AppTextStyles.buttonBackground,
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}
