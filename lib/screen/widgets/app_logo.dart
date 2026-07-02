import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class AppLogo extends StatelessWidget {
  final double size;
  final bool future;

  const AppLogo({super.key, this.size = 64, this.future = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: future ? AppGradients.future : AppGradients.brand,
        borderRadius: BorderRadius.circular(size * .28),
      ),
      alignment: Alignment.center,
      child: Text(
        'e',
        style: TextStyle(
          color: future ? AppColors.futureBg : AppColors.buttonText,
          fontSize: size * .47,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
