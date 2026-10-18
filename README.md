# Jelajah Wisata Malang

Aplikasi mobile Flutter untuk UTS Mobile Programming (Ganjil 2026/2027).

## Tema dan Tujuan
Katalog destinasi wisata Malang Raya (alam, budaya, kuliner, rekreasi) agar pengguna
mudah mencari dan melihat informasi destinasi. Data masih **dummy** (JSON lokal).

## Daftar Halaman dan Fungsinya
| Halaman | File | Fungsi |
|---|---|---|
| Beranda | `lib/pages/home_page.dart` | Sapaan, kolom cari, kategori, destinasi populer & terbaru |
| Daftar | `lib/pages/list_page.dart` | Daftar destinasi, filter kategori, pencarian |
| Detail | `lib/pages/detail_page.dart` | Informasi lengkap destinasi (dibuka dengan `Navigator.push`) |
| Tentang | `lib/pages/about_page.dart` | Info aplikasi |

Navigasi: `BottomNavigationBar` (Beranda/Daftar/Tentang) + `Navigator.push/pop` (ke Detail).

## Struktur Proyek
```
lib/
  main.dart
  theme/app_theme.dart            # warna & tema
  models/destination.dart         # model + fromJson/toJson (siap API)
  data/destination_repository.dart# sumber data (JSON lokal -> nanti API)
  pages/                          # halaman
  widgets/                        # widget reusable
assets/data/destinations.json     # data dummy
```

## Data dan Rencana Integrasi API
Data dibaca dari `assets/data/destinations.json` melalui `DestinationRepository.fetchAll()`.
Untuk beralih ke API, cukup ganti isi `fetchAll()` dengan `http.get(...)` lalu
`Destination.fromJson(...)`. Halaman tidak perlu diubah.

## Cara Menjalankan
1. Pasang Flutter SDK (>= 3.x) dan emulator/perangkat.
2. `git clone <[link-repo](https://github.com/Naswavi/Jelajah-Wisataaa.git)>` lalu `cd jelajah_wisata`
3. Jika folder platform belum ada: `flutter create .`
4. `flutter pub get`
5. `flutter run`

## Desain
Gaya *clean interface* dengan warna teal gelap, latar mint, aksen amber, ikon Material,
tipografi Roboto. Responsif: grid otomatis menyesuaikan lebar layar.
