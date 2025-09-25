import 'package:flutter/material.dart';

class CustomImageWidget extends StatelessWidget {
  final String assetPath;
  final double size;
  final bool circular;
  const CustomImageWidget({
    Key? key,
    required this.assetPath,
    this.size = 96,
    this.circular = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final child =
        Image.asset(assetPath, width: size, height: size, fit: BoxFit.cover);
    return circular
        ? ClipRRect(borderRadius: BorderRadius.circular(size / 2), child: child)
        : child;
  }
}
