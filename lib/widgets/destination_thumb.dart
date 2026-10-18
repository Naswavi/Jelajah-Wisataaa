
import 'package:flutter/material.dart';

class DestinationThumb extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final double iconSize;
  final BoxFit fit;

  const DestinationThumb(
      this.destination, {
        super.key,
        this.imageUrl,
        this.width,
        this.height,
        this.iconSize = 40,
        this.fit = BoxFit.cover,
      });

  final dynamic destination;

  @override
  Widget build(BuildContext context) {
    // Ambil path gambar dari imageUrl atau data destinasi.
    String imagePath = imageUrl ?? '';

    if (imagePath.isEmpty && destination != null) {
      try {
        imagePath = destination.imageUrl?.toString() ?? '';
      } catch (_) {
        imagePath = '';
      }
    }

    if (imagePath.isEmpty) {
      return _buildFallback();
    }

    return Image.asset(
      imagePath,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        return _buildFallback();
      },
    );
  }

  Widget _buildFallback() {
    return Container(
      width: width,
      height: height,
      color: Colors.grey.shade200,
      child: Center(
        child: Icon(
          Icons.image_not_supported_outlined,
          size: iconSize,
          color: Colors.grey,
        ),
      ),
    );
  }
}
