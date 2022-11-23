import 'package:flutter/material.dart';
import 'package:mrfr_pay/data/BoletoDao.dart';
import 'package:mrfr_pay/data/string_utils.dart';
import 'package:mrfr_pay/domain/boleto.dart';
import 'package:mrfr_pay/style/app_colors.dart';
import 'package:mrfr_pay/style/app_fonts.dart';
import 'package:mrfr_pay/widgets/input_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mrfr_pay/widgets/set_label_buttons.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class InsertBoletoScreen extends StatefulWidget {
  const InsertBoletoScreen({
    Key? key,
  }) : super(key: key);

  @override
  _InsertBoletoScreenState createState() => _InsertBoletoScreenState();
}

class _InsertBoletoScreenState extends State<InsertBoletoScreen> {
  final _formKey = GlobalKey<FormState>();
  final moneyInputTextController = MoneyMaskedTextController(
      leftSymbol: "R\$", initialValue: 0, decimalSeparator: ",");
  final vencimentoInputTextController =
      MaskedTextController(mask: "00/00/0000");
  final codigoInputTextController = TextEditingController();
  final nomeDoBoletoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        leading: BackButton(
          color: AppColors.heading,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 93, vertical: 24),
                child: Text(
                  "Preencha os dados do boleto",
                  style: AppTextStyles.titleBoldHeading,
                  textAlign: TextAlign.center,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    InputTextWidget(
                      controller: nomeDoBoletoController,
                      label: "Nome do boleto",
                      icon: Icons.description_outlined,
                    ),
                    InputTextWidget(
                      controller: vencimentoInputTextController,
                      label: "Vencimento",
                      icon: FontAwesomeIcons.circleXmark,
                    ),
                    InputTextWidget(
                      controller: moneyInputTextController,
                      label: "Valor",
                      icon: FontAwesomeIcons.wallet,
                    ),
                    InputTextWidget(
                      controller: codigoInputTextController,
                      label: "Código",
                      icon: FontAwesomeIcons.barcode,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            height: 1,
            thickness: 1,
            color: AppColors.stroke,
          ),
          SetLabelButtons(
            enableSecondaryColor: true,
            labelPrimary: "Cancelar",
            onTapPrimary: () {
              Navigator.pop(context);
            },
            labelSecondary: "Cadastrar",
            onTapSecondary: () async {
              if (_formKey.currentState!.validate()) {
                String nomeDigitado = nomeDoBoletoController.text;
                String codigoDigitado = codigoInputTextController.text;
                String valorDigitado = moneyInputTextController.text;
                String vencimentoDigitado = formatDateToBD(vencimentoInputTextController.text);
                
                Boleto boletoDigitado = Boleto(
                    nome: nomeDigitado,
                    valor: valorDigitado,
                    codigo: codigoDigitado,
                    vencimento: vencimentoDigitado);
                await BoletoDao().cadastrarBoleto(boleto: boletoDigitado);
              }
              Navigator.pushReplacementNamed(context,"/home");
            },
          ),
        ],
      ),
    );
  }
}
