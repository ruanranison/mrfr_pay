import 'package:flutter/material.dart';
import 'package:mrfr_pay/style/app_colors.dart';
import 'package:mrfr_pay/style/app_fonts.dart';
import 'package:mrfr_pay/widgets/divider_widget.dart';

class ExtratoScreen extends StatefulWidget {
  const ExtratoScreen({Key? key}) : super(key: key);

  @override
  _ExtratoScreenState createState() => _ExtratoScreenState();
}

class _ExtratoScreenState extends State<ExtratoScreen> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
      
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            child: Row(
              children: [
                Text('Meus extratos', style: AppTextStyles.titleBoldHeading),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: DividerWidget(
              height: 1,
              width: 368,
              color: AppColors.stroke),
          ),
        ],
      ),
    );
  }
}