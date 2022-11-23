import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:mrfr_pay/data/ExtratoDao.dart';
import 'package:mrfr_pay/data/string_utils.dart';
import 'package:mrfr_pay/domain/extrato.dart';
import 'package:mrfr_pay/style/app_colors.dart';
import 'package:mrfr_pay/style/app_fonts.dart';

class ExtratoTileWidget extends StatelessWidget {
  final Extrato extrato;

  const ExtratoTileWidget({Key? key, required this.extrato}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.top,
      child: InkWell(
          splashColor: AppColors.stroke,
          highlightColor: AppColors.grey,
          borderRadius: BorderRadius.circular(5),
          onTap: () {
            extratoModal(context, extrato);
          },
          child: ListTile(
            title: Text(extrato.nome, style: AppTextStyles.titleListTile),
            subtitle: Text(
              "Vence em ${formatDate(extrato.vencimento)}",
              style: AppTextStyles.captionBody,
            ),
            trailing: Text.rich( 
              TextSpan(
                text: extrato.valor,
                style: AppTextStyles.trailingBold,
              ),
            ),
          ),
        ),
      );

  }
}

extratoModal(context, Extrato extrato){
  return showModalBottomSheet(
      context: context,
      builder: (_) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              color: AppColors.background,
              child: Column(
                mainAxisSize: MainAxisSize.min, 
                children: [
                  SizedBox(
                    height: constraints.maxHeight * .03
                  ),
                  Container(
                    height: 2,
                    width: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.stroke,
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * .01),
                  const Divider(thickness: 1),
                  SizedBox(height: constraints.maxHeight * .01),
                  InkWell(
                    onTap: () async {
                      await ExtratoDao().deletarExtrato(extrato: extrato);
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.delete_forever, 
                          color: AppColors.primary
                        ),
                        SizedBox(
                          width: constraints.maxWidth * .03
                        ),
                        Text(
                          'Deletar Extrato',
                          style: AppTextStyles.buttonBoldPrimary),
                      ],
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * .04),
                ],
              ),
            );
          },
        );
      },
  );
}