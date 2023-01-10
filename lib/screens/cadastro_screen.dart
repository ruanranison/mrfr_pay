import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mrfr_pay/data/UserDao.dart';
import 'package:mrfr_pay/data/address_api.dart';
import 'package:mrfr_pay/domain/address.dart';
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
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usercontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _cepController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColors.background,
        body: Padding(
          padding: const EdgeInsets.only(left: 35, right: 35),
          child: SingleChildScrollView(
            child: SizedBox(
              width: size.width,
              height: size.height,
              child: Column(children: [
                SizedBox(
                  height: size.height * 0.13,
                ),
                Image.asset(AppImages.mrfrpay, width: 303, height: 75),
                Image.asset(
                  AppImages.logomini2,
                  width: 82.5,
                  height: 60,
                ),
                const SizedBox(
                  height: 42,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      InputTextWidget(
                        controller: _usercontroller,
                        icon: FontAwesomeIcons.user,
                        label: "Usuário",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo e-mail obrigatório';
                          }
                          return null;
                        },
                      ),
                      InputTextWidget(
                        controller: _passwordcontroller,
                        icon: Icons.lock,
                        label: "Senha",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo senha obrigatório';
                          } else if (value.length < 6) {
                            return 'Senha deve possuir no mínimo 8 digitos';
                          }
                          return null;
                        },
                      ),
                      InputTextWidget(
                        icon: Icons.mail,
                        label: "CEP",
                        controller: _cepController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo obrigatório';
                          }

                          return null;
                        },
                        onEditingComplete: onEditingComplete,
                      ),
                      InputTextWidget(
                        label: "Endereço",
                        icon: Icons.home,
                        controller: _addressController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo obrigatório';
                          }

                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Container(
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
                                User user = User(
                                    username: userDigitado,
                                    password: senhaDigitada);
                                await UserDao().cadastrarUser(user: user);
                                Navigator.pushReplacementNamed(
                                    context, '/login');
                              },
                              style: AppTextStyles.buttonBackground,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ));
  }

  Future<void> onEditingComplete() async {
    Address address = await AddressApi().findAddressByCep(_cepController.text);

    _addressController.text = address.logradouro;
  }
}
