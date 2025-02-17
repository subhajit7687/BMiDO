import 'package:flutter/material.dart';

import '../values/colors.dart';

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      highlightColor: Colors.transparent,
      highlightElevation: 0,
      fillColor: kIconButtonColor,
      constraints: const BoxConstraints.tightFor(
        width: 34.0,
        height: 34.0,
      ),
      shape: CircleBorder(),
      elevation: 0,
      child: Icon(
        icon,
        color: kIconButtonIconColor,
      ),
    );
  }
}
