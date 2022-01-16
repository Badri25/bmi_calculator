import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({ required this.ic, required this.onP});
  final IconData ic;
  final VoidCallback onP;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(ic),
      onPressed: onP,
      elevation: 6.0,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
