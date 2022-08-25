import 'package:mrfr_pay/domain/boleto.dart';

class BD{

  static List<Boleto> lista = [
    Boleto(
      title: "Tia Maria",
      subtitle: "Vence em 16/03/22",
      trailing: "2.131,33"
    ),
    Boleto(
      title: "Monitor Dell",
      subtitle: "Vence em 02/05/22",
      trailing: "1.764,90"
    ),
    Boleto(
      title: "League of Legends",
      subtitle: "Vence em 09/08/22",
      trailing: "64,00"
    ),
    Boleto(
      title: "Aluguel de Julho",
      subtitle: "Vence em 14/09/22",
      trailing: "5.531,00"
    ),
  ];
}