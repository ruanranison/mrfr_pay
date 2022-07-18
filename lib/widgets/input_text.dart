import 'package:flutter/material.dart';
import 'package:mrfr_pay/style/app_colors.dart';
import 'package:mrfr_pay/style/app_fonts.dart';
import 'package:animated_card/animated_card.dart';

class InputTextWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const InputTextWidget({
    Key? key,
    required this.icon,
    
    this.validator,
    this.controller, required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.top,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          children: [
            TextFormField(
              controller: controller,
              style: AppTextStyles.input,
              decoration: InputDecoration(
                labelText: label,
                labelStyle: AppTextStyles.input,
                icon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Icon(icon, color: AppColors.primary),
                    ),
                    Container(width: 1, height: 48, color: AppColors.stroke),
                  ],
                ),
              ),
            ),
            Divider(height: 1, thickness: 1, color: AppColors.stroke),
          ],
        ),
      ),
    );
  }
}

