import 'package:flutter/material.dart';

/// Palet warna aplikasi (konsisten di semua halaman).
class AppColors {
  static const primary = Color(0xFF0F766E);
  static const dark = Color(0xFF134E4A);
  static const bg = Color(0xFFF0FDFA);
  static const accent = Color(0xFFF59E0B);
}

ThemeData buildTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    scaffoldBackgroundColor: AppColors.bg,
    fontFamily: 'Roboto',
  );
}
