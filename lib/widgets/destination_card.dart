import 'package:flutter/material.dart';
import '../models/destination.dart';
import '../pages/detail_page.dart';
import '../theme/app_theme.dart';
import 'destination_thumb.dart';

/// Kartu destinasi horizontal (dipakai di Beranda & Daftar).
class DestinationCard extends StatelessWidget {
  final Destination d;
  const DestinationCard(this.d, {super.key});

  void _open(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (_) => DetailPage(destination: d)));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 112,
      child: Card(
        elevation: 1,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => _open(context),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: DestinationThumb(d, width: 84, height: 92),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(d.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      Text('${d.category} • ${d.location}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 12, color: Colors.grey.shade600)),
                      Row(
                        children: [
                          const Icon(Icons.star,
                              size: 16, color: AppColors.accent),
                          const SizedBox(width: 2),
                          Text('${d.rating}',
                              style: const TextStyle(fontSize: 12)),
                          const Spacer(),
                          FilledButton(
                            onPressed: () => _open(context),
                            style: FilledButton.styleFrom(
                              backgroundColor: AppColors.accent,
                              foregroundColor: Colors.white,
                              minimumSize: const Size(0, 30),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                            ),
                            child: const Text('Lihat Info',
                                style: TextStyle(fontSize: 11)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
