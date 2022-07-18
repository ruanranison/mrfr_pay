import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  final double height;
  final double width;
  final Color color;

  const DividerWidget({Key? key, required this.height, required this.width, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color, 
      height: height, 
      width: width,
    );
    
  }
}