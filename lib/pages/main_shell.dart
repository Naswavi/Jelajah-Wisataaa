import 'package:flutter/material.dart';
import '../data/destination_repository.dart';
import '../models/destination.dart';
import '../theme/app_theme.dart';
import 'about_page.dart';
import 'home_page.dart';
import 'list_page.dart';

/// Kerangka utama: BottomNavigationBar untuk berpindah antar halaman.
class MainShell extends StatefulWidget {
  const MainShell({super.key});
  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  final _repo = DestinationRepository();
  late Future<List<Destination>> _future;
  int _index = 0;
  String _category = 'Semua';

  @override
  void initState() {
    super.initState();
    _future = _repo.fetchAll();
  }

  void _goToList(String category) => setState(() {
        _category = category;
        _index = 1;
      });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Destination>>(
      future: _future,
      builder: (context, snap) {
        if (snap.connectionState != ConnectionState.done) {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        }
        if (snap.hasError || snap.data == null) {
          return Scaffold(
            body: Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                const Text('Gagal memuat data'),
                TextButton(
                    onPressed: () => setState(() => _future = _repo.fetchAll()),
                    child: const Text('Coba lagi')),
              ]),
            ),
          );
        }
        final data = snap.data!;
        final pages = [
          HomePage(
              data: data,
              onCategoryTap: _goToList,
              onSearchTap: () => _goToList('Semua')),
          ListPage(
              data: data,
              category: _category,
              onCategoryChanged: (c) => setState(() => _category = c)),
          const AboutPage(),
        ];
        return Scaffold(
          body: pages[_index],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _index,
            selectedItemColor: AppColors.primary,
            onTap: (i) => setState(() => _index = i),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded), label: 'Beranda'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list_alt_rounded), label: 'Daftar'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.info_outline_rounded), label: 'Tentang'),
            ],
          ),
        );
      },
    );
  }
}
