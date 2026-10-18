import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Halaman 4 - Tentang aplikasi.
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: AppColors.primary,
                  child: Icon(Icons.explore, size: 44, color: Colors.white),
                ),
                const SizedBox(height: 16),
                const Text('Jelajah Wisata Malang',
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                const Text('Versi 1.0.0'),
                const SizedBox(height: 16),
                const Text(
                  'Aplikasi katalog destinasi wisata Malang Raya yang dibuat '
                  'untuk UTS Mobile Programming. Data masih berupa data dummy '
                  '(JSON lokal) dan disiapkan untuk integrasi API.',
                  textAlign: TextAlign.center,
                  style: TextStyle(height: 1.5),
                ),
                const SizedBox(height: 16),
                const Text('Nama: Naswa Vifda Zalianti  •  NIM: 240605110047',
                    style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
