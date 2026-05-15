import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ExamOptionalRemoteImage extends StatelessWidget {
  const ExamOptionalRemoteImage({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.contain,
      errorWidget: (_, _, _) => const SizedBox.shrink(),
      placeholder: (_, _) => const SizedBox.shrink(),
    );
  }
}
