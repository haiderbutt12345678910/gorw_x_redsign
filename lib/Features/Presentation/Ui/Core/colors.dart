import 'package:flutter/material.dart';

MaterialColor themeBlue = MaterialColor(
  0xFF00898D,
  <int, Color>{
    50: const Color(0xFF00898D).withOpacity(0.1),
    100: const Color(0xFF00898D).withOpacity(0.2),
    200: const Color(0xFF00898D).withOpacity(0.3),
    300: const Color(0xFF00898D).withOpacity(0.4),
    400: const Color(0xFF00898D).withOpacity(0.5),
    500: const Color(0xFF00898D).withOpacity(0.6),
    600: const Color(0xFF00898D).withOpacity(0.7),
    700: const Color(0xFF00898D).withOpacity(0.8),
    800: const Color(0xFF00898D).withOpacity(0.9),
    900: const Color(0xFF00898D).withOpacity(1.0),
  },
);
Color blue = themeBlue[900]!;
Color bluleDark = const Color(0xFF002C31);
