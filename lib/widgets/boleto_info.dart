import 'package:flutter/material.dart';
import 'package:mrfr_pay/style/app_colors.dart';
import 'package:mrfr_pay/style/app_fonts.dart';
import 'package:mrfr_pay/style/app_images.dart';
import 'package:mrfr_pay/widgets/divider_widget.dart';

class BoletoInfoWidget extends StatelessWidget {
  final int num_boletos;
  const BoletoInfoWidget({Key? key, required this.num_boletos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              AppImages.logomini,
              color: AppColors.background,
              width: 56,
              height: 34,
            ),
            DividerWidget(
              width: 1,
              height: 32,
              color: AppColors.background,
            ),
            Text.rich(TextSpan(
              text: 'Você tem ',
              style: AppTextStyles.captionBackground,
              children: [
                TextSpan(
                  text: '$num_boletos boletos\n',
                  style: AppTextStyles.captionBoldBackground,
                ),
                TextSpan(
                  text: 'cadastrados para pagar',
                  style: AppTextStyles.captionBackground,
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}