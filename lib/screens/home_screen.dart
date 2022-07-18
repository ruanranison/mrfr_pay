import 'package:flutter/material.dart';
import 'package:mrfr_pay/screens/boleto_screen.dart';
import 'package:mrfr_pay/screens/extrato_screen.dart';
import 'package:mrfr_pay/style/app_colors.dart';
import 'package:mrfr_pay/style/app_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = HomeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(152), 
        child: Container(
         
          height: 152,
          color: AppColors.primary, 
          child: Center( 
            child: ListTile( 
              title: Text.rich( 
                TextSpan(
                  text: 'Olá, ',
                  style: AppTextStyles.titleRegular,
                  children: [
                    TextSpan(
                      text: 'Nome', 
                      style: AppTextStyles.titleBoldBackground,
                    ),
                  ],
                ),
              ),
              subtitle: Text(
                'Mantenha suas contas em dia',
                style: AppTextStyles.captionShape,
              ),
            ),
          ),
        ),
      ),
      body: [
        const BoletoScreen(),
        const ExtratoScreen(),
      ][controller.currentPage],
      bottomNavigationBar: SizedBox(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
          children: [
            IconButton(
              onPressed: () { 
                setState(() => controller.setPage(0)); 
              },
              icon: Icon( 
                Icons.home, 
                color: controller.currentPage == 0 
                    ? AppColors.primary : AppColors.body,
              ),
            ),
            InkWell(
              onTap: () async {
                await Navigator.pushNamed(context, '/scanner');
                setState(() {});
              },
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(
                  Icons.add_box_outlined,
                  color: AppColors.background,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() => controller.setPage(1));
              },
              icon: Icon(
                Icons.description_outlined, 
                color: controller.currentPage == 1 
                    ? AppColors.primary : AppColors.body,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
class HomeController {
  int currentPage = 0;

  void setPage(int index) {
    currentPage = index;
  }
}