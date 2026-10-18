import 'package:flutter/material.dart';
import '../models/destination.dart';
import '../theme/app_theme.dart';
import '../widgets/destination_card.dart';
import '../widgets/destination_thumb.dart';
import 'detail_page.dart';

/// Halaman 1 - Beranda: sapaan, pencarian, kategori, populer, terbaru.
class HomePage extends StatelessWidget {
  final List<Destination> data;
  final void Function(String category) onCategoryTap;
  final VoidCallback onSearchTap;
  const HomePage(
      {super.key,
      required this.data,
      required this.onCategoryTap,
      required this.onSearchTap});

  @override
  Widget build(BuildContext context) {
    final popular = data.where((d) => d.popular).toList();
    final latest = data.reversed.take(3).toList();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).padding.top + 20, 20, 24),
            decoration: const BoxDecoration(
              color: AppColors.dark,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Selamat Datang',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('Mau jelajah wisata apa hari ini?',
                    style: TextStyle(color: Colors.white.withOpacity(0.7))),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: onSearchTap,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 14),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(14)),
                    child: const Row(children: [
                      Icon(Icons.search, color: AppColors.accent),
                      SizedBox(width: 8),
                      Text('Cari nama destinasi',
                          style: TextStyle(color: Colors.white70)),
                    ]),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: kCategories
                  .map((c) => InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () => onCategoryTap(c),
                        child: Column(children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                color: categoryColor(c),
                                borderRadius: BorderRadius.circular(18)),
                            child: Icon(categoryIcon(c), color: Colors.white),
                          ),
                          const SizedBox(height: 6),
                          Text(c, style: const TextStyle(fontSize: 12)),
                        ]),
                      ))
                  .toList(),
            ),
          ),
          _title('Destinasi Populer'),
          SizedBox(
            height: 180,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: popular.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, i) {
                final d = popular[i];
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => DetailPage(destination: d))),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: SizedBox(
                      width: 230,
                      child: Stack(fit: StackFit.expand, children: [
                        DestinationThumb(d, iconSize: 56),
                        Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.7)
                              ])),
                        ),
                        Positioned(
                          left: 12,
                          right: 12,
                          bottom: 12,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(d.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                              Row(children: [
                                const Icon(Icons.star,
                                    size: 14, color: AppColors.accent),
                                Text(' ${d.rating}  •  ${d.category}',
                                    style: const TextStyle(
                                        color: Colors.white70, fontSize: 12)),
                              ]),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ),
                );
              },
            ),
          ),
          _title('Destinasi Terbaru'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: latest
                  .map((d) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: DestinationCard(d)))
                  .toList(),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _title(String t) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 22, 16, 12),
        child: Text(t,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
      );
}
