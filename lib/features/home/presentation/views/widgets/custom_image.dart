import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.imaheUrl});
  final String imaheUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: AspectRatio(
            aspectRatio: 3 / 4,
            child: CachedNetworkImage(
              imageUrl: imaheUrl,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.fill,
            )));
  }
}
