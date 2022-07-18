import 'package:flutter/material.dart';
import 'package:mrfr_pay/style/app_colors.dart';
import 'package:mrfr_pay/style/app_fonts.dart';
import 'package:mrfr_pay/widgets/set_label_buttons.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({Key? key}) : super(key: key);

  @override
  _ScannerScreenState createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.black,
                centerTitle: true,
                title: Text(
                  'Escaneie o código de barras do boleto',
                  style: AppTextStyles.buttonBackground,
                ),
                leading: BackButton(
                  color: AppColors.background
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: Container(color: Colors.black),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(color: Colors.transparent),
                  ),
                  Expanded(
                    child: Container(color: Colors.black87),
                  )
                ],
              ),
              bottomNavigationBar: SetLabelButtons(
                enablePrimaryColor: true,
                labelPrimary: 'Inserir código de barras',
                onTapPrimary: () {
                  Navigator.pushReplacementNamed(context, "/insert_boleto");
                },
                labelSecondary: 'Adicione da sua galeria',
                onTapSecondary: (){
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}