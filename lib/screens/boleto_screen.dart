import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:mrfr_pay/style/app_colors.dart';
import 'package:mrfr_pay/style/app_fonts.dart';
import 'package:mrfr_pay/widgets/boleto_info.dart';
import 'package:mrfr_pay/widgets/divider_widget.dart';
import 'package:mrfr_pay/widgets/grid_view.dart';
import 'package:mrfr_pay/widgets/list_view.dart';

class BoletoScreen extends StatefulWidget {
  const BoletoScreen({Key? key}) : super(key: key);

  @override
  _BoletoScreenState createState() => _BoletoScreenState();
}

class _BoletoScreenState extends State<BoletoScreen> {
  bool isGridView = false;

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Meus boletos', style: AppTextStyles.titleBoldHeading),
                GestureDetector(
                  onTap: (() {
                    setState(() {
                      isGridView = !isGridView;
                    });
                  }),
                  child: isGridView == true 
                  ? const Icon(Icons.view_agenda_rounded, color: Color(0xFF585666),) 
                  : const Icon(Icons.grid_view_rounded, color: Color(0xFF585666),), 

                ),
              ],
            ),
          ),
          DividerWidget(
            height: 1, 
            width: 368, 
            color: AppColors.stroke,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: isGridView == true ? const GridViewScreen() : const ListViewScreen(),
          ),  
        ],
      ),
    );
  }
}