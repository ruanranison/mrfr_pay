import 'package:flutter/material.dart';
import 'package:mrfr_pay/style/app_colors.dart';
import 'package:mrfr_pay/style/app_fonts.dart';
import 'package:mrfr_pay/widgets/divider_widget.dart';
import 'package:mrfr_pay/widgets/label_button.dart';

class SetLabelButtons extends StatelessWidget {
  final String labelPrimary;
  final VoidCallback onTapPrimary;
  final String labelSecondary;
  final VoidCallback onTapSecondary;
  final bool enablePrimaryColor;
  final bool enableSecondaryColor;

  const SetLabelButtons({
    Key? key,
    required this.labelPrimary,
    required this.onTapPrimary,
    required this.labelSecondary,
    required this.onTapSecondary,
    this.enablePrimaryColor = false,
    this.enableSecondaryColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      height: 56,
      child: Row(
        children: [
          if (enablePrimaryColor) ...[
            LabelButton(
              label: labelPrimary,
              onPressed: onTapPrimary, 
              style: AppTextStyles.buttonPrimary,
            ),
          ] else ...[
            LabelButton(
              label: labelPrimary,
              onPressed: onTapPrimary,
              style: AppTextStyles.buttonHeading,
            ),
          ],
          DividerWidget(
            height: 56, 
            width: 1, 
            color: AppColors.stroke,
          ),
          if (enableSecondaryColor) ...[
            LabelButton(
              label: labelSecondary,
              onPressed: onTapSecondary, 
              style: AppTextStyles.buttonPrimary,
            ),
          ] else ...[
            LabelButton(
              label: labelSecondary,
              onPressed: onTapSecondary,
              style: AppTextStyles.buttonHeading,
            ),
          ],
        ],
      ),
    );
  }
}

