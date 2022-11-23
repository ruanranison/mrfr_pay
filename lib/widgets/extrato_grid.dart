import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:mrfr_pay/data/ExtratoDao.dart';
import 'package:mrfr_pay/data/string_utils.dart';
import 'package:mrfr_pay/domain/extrato.dart';
import 'package:mrfr_pay/style/app_colors.dart';
import 'package:mrfr_pay/style/app_fonts.dart';

class ExtratoGridWidget extends StatelessWidget {
  final Extrato extrato;

  const ExtratoGridWidget({Key? key, required this.extrato}) : super(key: key);

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
          child: Card(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: AppColors.stroke
                )
              ),
              width: 250,
              height: 200,
              padding: const EdgeInsets.only(top: 2, left: 2, right: 2, bottom: 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(extrato.nome, style: AppTextStyles.titleListTile),
                    Text(
                      formatDate(extrato.vencimento),
                      style: AppTextStyles.captionBody,
                    ),
                    Text(extrato.valor, style: AppTextStyles.trailingBold,)
                  ],
                ),
              ),
          ),

          )
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