import 'package:flutter/material.dart';
import 'package:mrfr_pay/domain/boleto.dart';
import 'package:mrfr_pay/widgets/list_view.dart';
import 'boleto_grid.dart';
import 'package:mrfr_pay/data/BoletoDao.dart';

class GridViewScreen extends StatefulWidget {
  const GridViewScreen({Key? key}) : super(key: key);

  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  List<Boleto> list = getListaBoleto();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2,
      ),
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return BoletoGridWidget(
          boleto: list[index],
        );
      },
    );
  }
}
