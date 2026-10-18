import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/destination.dart';

/// Satu-satunya sumber data aplikasi.
/// Tahap sekarang: membaca JSON lokal (assets/data/destinations.json).
/// Tahap berikutnya: ganti isi fetchAll() dengan http.get(...) ke API;
/// model & halaman tidak perlu diubah karena memakai Destination.fromJson.
class DestinationRepository {
  Future<List<Destination>> fetchAll() async {
    final raw = await rootBundle.loadString('assets/data/destinations.json');
    final list = json.decode(raw) as List<dynamic>;
    return list
        .map((e) => Destination.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
