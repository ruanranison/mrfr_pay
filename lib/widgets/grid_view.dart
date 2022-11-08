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
  Future<List<Boleto>> boletos = BoletoDao().pegarBoletoBD();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Boleto>>(
      future: boletos,
      builder: (context, snapshot) {

        if(snapshot.hasData){
          List<Boleto> listaBoleto = snapshot.data ?? [];

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2,
            ),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: listaBoleto.length,
            itemBuilder: (context, index) {
              return BoletoGridWidget(
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
// List<Boleto> pegarListaBoleto(result) {
//   List<Boleto> listaBoleto = [];
//   result.then((value) {
//     value.forEach((element) {
//       Boleto boleto = Boleto.fromJson(element);
//       listaBoleto.add(boleto);
//       print("foreach");
//       print(listaBoleto.length);
//     });
//     return listaBoleto; 
//   });
//   return listaBoleto;
// }
