import 'package:flutter/material.dart';

const List<String> kCategories = ['Alam', 'Budaya', 'Kuliner', 'Rekreasi'];

/// Model data. fromJson/toJson dibuat agar siap dipakai untuk respons API.
class Destination {
  final int id;
  final String name;
  final String category;
  final String location;
  final double rating;
  final int price;
  final bool popular;
  final String openHours;
  final String? imageUrl;
  final List<String> facilities;
  final String description;

  const Destination({
    required this.id,
    required this.name,
    required this.category,
    required this.location,
    required this.rating,
    required this.price,
    required this.popular,
    required this.openHours,
    required this.facilities,
    required this.description,
    this.imageUrl,
  });

  factory Destination.fromJson(Map<String, dynamic> j) => Destination(
        id: j['id'] as int,
        name: j['name'] as String,
        category: j['category'] as String,
        location: j['location'] as String,
        rating: (j['rating'] as num).toDouble(),
        price: j['price'] as int,
        popular: j['popular'] as bool? ?? false,
        openHours: j['openHours'] as String,
        imageUrl: j['imageUrl'] as String?,
        facilities: List<String>.from(j['facilities'] as List),
        description: j['description'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'category': category,
        'location': location,
        'rating': rating,
        'price': price,
        'popular': popular,
        'openHours': openHours,
        'imageUrl': imageUrl,
        'facilities': facilities,
        'description': description,
      };

  IconData get icon => categoryIcon(category);
  Color get color => categoryColor(category);

  String get priceText {
    if (price == 0) return 'Gratis';
    final s = price
        .toString()
        .replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (_) => '.');
    return 'Rp $s';
  }
}

Color categoryColor(String c) => switch (c) {
      'Alam' => const Color(0xFF16A34A),
      'Budaya' => const Color(0xFF9A3412),
      'Kuliner' => const Color(0xFFDC2626),
      _ => const Color(0xFF2563EB),
    };

IconData categoryIcon(String c) => switch (c) {
      'Alam' => Icons.terrain,
      'Budaya' => Icons.account_balance,
      'Kuliner' => Icons.restaurant,
      _ => Icons.attractions,
    };
