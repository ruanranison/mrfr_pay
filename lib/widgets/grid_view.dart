import 'package:flutter/material.dart';
import 'package:mrfr_pay/data/BD.dart';
import 'package:mrfr_pay/domain/boleto.dart';
import 'package:mrfr_pay/widgets/boleto_tile.dart';

class GridViewScreen extends StatefulWidget {
  const GridViewScreen({Key? key}) : super(key: key);

  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  List<Boleto> list = BD.lista;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.4,
      ),
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return BoletoTileWidget(
          boleto: list[index],
        );
      },
    );
  }
}