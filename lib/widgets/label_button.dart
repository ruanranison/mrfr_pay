import 'package:flutter/material.dart';

class LabelButton extends StatelessWidget {

  final String label;
  final VoidCallback onPressed;
  final TextStyle style;
  
  const LabelButton({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
      height: 56,
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            label, 
            style: style
          ),
        ),
      ),
    );
  }
}