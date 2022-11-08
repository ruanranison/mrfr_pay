import 'package:flutter/material.dart';
import 'package:mrfr_pay/domain/boleto.dart';
import 'package:mrfr_pay/widgets/boleto_tile.dart';
import 'package:mrfr_pay/data/BoletoDao.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  Future<List<Boleto>> boletos = BoletoDao().pegarBoletoBD();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Boleto>>(
      future: boletos,
      builder: (context, snapshot) {

        if(snapshot.hasData){
          List<Boleto> listaBoleto = snapshot.data ?? [];

          return ListView.builder(
            shrinkWrap: true,
            itemCount: listaBoleto.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return BoletoTileWidget(
                boleto: listaBoleto[index],
              );
            },
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
// List<Boleto> pegarListaBoleto (Future<List<Map<String, Object?>>> result) {
//   List<Boleto> listaBoleto = [];
//   result.then((value) {
//     value.forEach((element) {
//       Boleto boleto = Boleto.fromJson(element);
//       listaBoleto.add(boleto);
//     });
//     return listaBoleto; 
//   });
//   return listaBoleto;

