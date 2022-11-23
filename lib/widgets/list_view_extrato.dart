import 'package:flutter/material.dart';
import 'package:mrfr_pay/data/ExtratoDao.dart';
import 'package:mrfr_pay/domain/extrato.dart';
import 'package:mrfr_pay/widgets/extrato_tile.dart';

class ListViewExtratoScreen extends StatefulWidget {
  const ListViewExtratoScreen({Key? key}) : super(key: key);

  @override
  State<ListViewExtratoScreen> createState() => _ListViewExtratoScreenState();
}

class _ListViewExtratoScreenState extends State<ListViewExtratoScreen> {
  Future<List<Extrato>> extratos = ExtratoDao().pegarExtratoBD();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Extrato>>(
      future: extratos,
      builder: (context, snapshot) {

        if(snapshot.hasData){
          List<Extrato> listaExtrato = snapshot.data ?? [];

          return ListView.builder(
            shrinkWrap: true,
            itemCount: listaExtrato.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return ExtratoTileWidget(
                extrato: listaExtrato[index],
              );
            },
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}