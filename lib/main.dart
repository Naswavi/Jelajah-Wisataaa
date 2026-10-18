import 'package:flutter/material.dart';
import 'pages/main_shell.dart';
import 'theme/app_theme.dart';

void main() => runApp(const JelajahWisataApp());

class JelajahWisataApp extends StatelessWidget {
  const JelajahWisataApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jelajah Wisata Malang',
      debugShowCheckedModeBanner: false,
      theme: buildTheme(),
      home: const MainShell(),
    );
  }
}
