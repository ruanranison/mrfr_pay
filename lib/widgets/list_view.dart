import 'package:flutter/material.dart';
import 'package:mrfr_pay/data/BD.dart';
import 'package:mrfr_pay/domain/boleto.dart';
import 'package:mrfr_pay/widgets/boleto_tile.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<Boleto> list = BD.lista;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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