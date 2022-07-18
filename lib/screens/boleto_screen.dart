import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:mrfr_pay/style/app_colors.dart';
import 'package:mrfr_pay/style/app_fonts.dart';
import 'package:mrfr_pay/widgets/boleto_info.dart';
import 'package:mrfr_pay/widgets/boleto_tile.dart';
import 'package:mrfr_pay/widgets/divider_widget.dart';

class BoletoScreen extends StatefulWidget {
  const BoletoScreen({Key? key}) : super(key: key);

  @override
  _BoletoScreenState createState() => _BoletoScreenState();
}

class _BoletoScreenState extends State<BoletoScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 80,
            child: Stack(
              children: [
                Container(
                  height: 40, 
                  color: AppColors.primary
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24), 
                  child: AnimatedCard(
                    direction: AnimatedCardDirection.top,
                    child: const BoletoInfoWidget(
                        num_boletos: 14,
                    ),  
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Row(
              children: [
                Text('Meus boletos', style: AppTextStyles.titleBoldHeading),
              ],
            ),
          ),
          DividerWidget(
            height: 1, 
            width: 368, 
            color: AppColors.stroke,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: BoletoTileWidget(
              title: "Tia Maria", 
              subtitle: "Vence em 16/03/22", 
              trailing: "2.131,33",
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: BoletoTileWidget(
              title: "Tia Maria", 
              subtitle: "Vence em 16/03/22", 
              trailing: "2.131,33",
            ),
          ),
        ],
      ),
    );
  }
}