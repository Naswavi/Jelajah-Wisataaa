import 'package:flutter/material.dart';
import '../models/destination.dart';
import '../theme/app_theme.dart';
import '../widgets/destination_card.dart';

/// Halaman 2 - Daftar destinasi berdasarkan kategori + pencarian.
/// Grid memakai maxCrossAxisExtent sehingga otomatis 1 kolom (HP) atau
/// beberapa kolom (tablet/landscape) -> responsive.
class ListPage extends StatefulWidget {
  final List<Destination> data;
  final String category;
  final ValueChanged<String> onCategoryChanged;
  const ListPage(
      {super.key,
      required this.data,
      required this.category,
      required this.onCategoryChanged});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final cats = ['Semua', ...kCategories];
    final items = widget.data.where((d) {
      final okCat = widget.category == 'Semua' || d.category == widget.category;
      final okQ = d.name.toLowerCase().contains(_query.toLowerCase());
      return okCat && okQ;
    }).toList();

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(
              16, MediaQuery.of(context).padding.top + 16, 16, 16),
          decoration: const BoxDecoration(
            color: AppColors.dark,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Daftar Destinasi',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              TextField(
                onChanged: (v) => setState(() => _query = v),
                decoration: InputDecoration(
                  hintText: 'Cari nama destinasi',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: cats
                      .map((c) => Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ChoiceChip(
                              label: Text(c),
                              selected: widget.category == c,
                              selectedColor: AppColors.accent,
                              onSelected: (_) => widget.onCategoryChanged(c),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: items.isEmpty
              ? const Center(child: Text('Destinasi tidak ditemukan'))
              : GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 480,
                    mainAxisExtent: 112,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: items.length,
                  itemBuilder: (_, i) => DestinationCard(items[i]),
                ),
        ),
      ],
    );
  }
}
