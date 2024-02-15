import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String imagePath;
  const ImageWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(imagePath,
        fit: BoxFit.cover, width: double.infinity, height: double.infinity);
  }
}
