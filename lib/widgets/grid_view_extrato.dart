import 'package:flutter/material.dart';
import 'package:mrfr_pay/data/ExtratoDao.dart';
import 'package:mrfr_pay/domain/extrato.dart';
import 'package:mrfr_pay/widgets/extrato_grid.dart';

class GridViewExtratoScreen extends StatefulWidget {
  const GridViewExtratoScreen({Key? key}) : super(key: key);

  @override
  State<GridViewExtratoScreen> createState() => _GridViewExtratoScreenState();
}

class _GridViewExtratoScreenState extends State<GridViewExtratoScreen> {
  Future<List<Extrato>> extratos = ExtratoDao().pegarExtratoBD();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Extrato>>(
      future: extratos,
      builder: (context, snapshot) {

        if(snapshot.hasData){
          List<Extrato> listaExtrato = snapshot.data ?? [];

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2,
            ),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: listaExtrato.length,
            itemBuilder: (context, index) {
              return ExtratoGridWidget(
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
