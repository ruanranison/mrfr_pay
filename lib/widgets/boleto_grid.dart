import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:mrfr_pay/domain/boleto.dart';
import 'package:mrfr_pay/style/app_colors.dart';
import 'package:mrfr_pay/style/app_fonts.dart';

class BoletoGridWidget extends StatelessWidget {
  final Boleto boleto;

  const BoletoGridWidget({Key? key, required this.boleto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.top,
      child: InkWell(
          splashColor: AppColors.stroke,
          highlightColor: AppColors.grey,
          borderRadius: BorderRadius.circular(5),
          onTap: () {
            boletoModal(context, boleto);
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
                    Text(boleto.nome, style: AppTextStyles.titleListTile),
                    // Text(
                    //   boleto.subtitle,
                    //   style: AppTextStyles.captionBody,
                    // ),
                    Text.rich( 
                      TextSpan(
                        text: 'R\$ ',
                        style: AppTextStyles.trailingRegular,
                        children: [
                        // TextSpan(
                        //   text: boleto.trailing,
                        //   style: AppTextStyles.trailingBold,
                        //   ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ),

          )
      );

  }
}

boletoModal(context, Boleto boleto){
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
                  SizedBox(height: constraints.maxHeight * .05),
                  Text.rich(
                    TextSpan(
                      text: 'O boleto ',
                      style: AppTextStyles.textModal,
                      children: [
                        TextSpan(text: "${boleto.nome} \n", style: AppTextStyles.titleBoldHeading),
                        TextSpan(text: 'no valor de ', style: AppTextStyles.textModal),
                        TextSpan(
                          text: 'R\$ ', 
                          style: AppTextStyles.titleBoldHeading, 
                          // children: [
                          //   TextSpan(text: boleto.trailing)
                          //   ]
                        ),
                        TextSpan(text: ' foi pago?', style: AppTextStyles.textModal),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: constraints.maxHeight * .06),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * .06),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: (() => Navigator.pop(context)),
                            child: Text('Ainda não', style: AppTextStyles.buttonGrey),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(double.maxFinite, constraints.maxHeight * .12),
                              onPrimary: AppColors.delete,
                              primary: AppColors.background,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(
                                  color: AppColors.stroke,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: constraints.maxWidth * .04),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: (() => Navigator.pop(context)),
                            child: Text('Sim', style: AppTextStyles.buttonBackground),
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              fixedSize: Size(double.maxFinite, constraints.maxHeight * .12),
                              onPrimary: AppColors.delete,
                              primary: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(
                                  color: AppColors.stroke,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * .04),
                  const Divider(thickness: 1),
                  SizedBox(height: constraints.maxHeight * .01),
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
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
                          'Deletar Boleto',
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