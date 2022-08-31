import 'package:flutter/material.dart';
import 'package:mrfr_pay/style/app_colors.dart';
import 'package:mrfr_pay/style/app_fonts.dart';
import 'package:mrfr_pay/widgets/divider_widget.dart';
import 'package:mrfr_pay/widgets/grid_view.dart';
import 'package:mrfr_pay/widgets/list_view.dart';

class ExtratoScreen extends StatefulWidget {
  const ExtratoScreen({Key? key}) : super(key: key);

  @override
  _ExtratoScreenState createState() => _ExtratoScreenState();
}

class _ExtratoScreenState extends State<ExtratoScreen> {
  bool isGridView = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Meus extratos', style: AppTextStyles.titleBoldHeading),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isGridView = !isGridView;  
                    });
                  },
                  child: isGridView == true ? const Icon(Icons.view_agenda_rounded, color: Color(0xFF585666),) : const Icon(Icons.grid_view_rounded, color:  Color(0xFF585666)),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: DividerWidget(
              height: 1,
              width: 368,
              color: AppColors.stroke),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: isGridView ? const GridViewScreen() : const ListViewScreen() ,
          ),
        ],
      ),
    );
  }
}