import 'package:flutter/material.dart';
import '../models/destination.dart';
import '../theme/app_theme.dart';
import '../widgets/destination_thumb.dart';

/// Halaman 3 - Detail informasi destinasi (dibuka via Navigator.push).
class DetailPage extends StatelessWidget {
  final Destination destination;
  const DetailPage({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    final d = destination;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 240,
            backgroundColor: AppColors.dark,
            foregroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(

              title: Text(
                d.name,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black87,
                      blurRadius: 8,
                      offset: Offset(1, 2),
                    ),
                  ],
                ),
              ),

              background: DestinationThumb(d, iconSize: 90),
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 700),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Chip(
                              avatar:
                                  Icon(d.icon, size: 16, color: Colors.white),
                              label: Text(d.category,
                                  style: const TextStyle(color: Colors.white)),
                              backgroundColor: d.color,
                              side: BorderSide.none,
                            ),
                            const Spacer(),
                            const Icon(Icons.star, color: AppColors.accent),
                            Text(' ${d.rating}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ]),
                          const SizedBox(height: 8),
                          _row(Icons.place, 'Lokasi', d.location),
                          _row(Icons.confirmation_number, 'Tiket', d.priceText),
                          _row(Icons.schedule, 'Jam Buka', d.openHours),
                          const Divider(height: 28),
                          const Text('Deskripsi',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          const SizedBox(height: 6),
                          Text(d.description,
                              style: const TextStyle(height: 1.5)),
                          const SizedBox(height: 16),
                          const Text('Fasilitas',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 8,
                            runSpacing: 4,
                            children: d.facilities
                                .map((f) => Chip(label: Text(f)))
                                .toList(),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            child: FilledButton.icon(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(Icons.arrow_back),
                              label: const Text('Kembali ke Daftar'),
                              style: FilledButton.styleFrom(
                                  backgroundColor: AppColors.primary),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _row(IconData icon, String label, String value) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(children: [
          Icon(icon, size: 18, color: AppColors.primary),
          const SizedBox(width: 8),
          SizedBox(
              width: 72,
              child:
                  Text(label, style: TextStyle(color: Colors.grey.shade600))),
          Expanded(child: Text(value)),
        ]),
      );
}
