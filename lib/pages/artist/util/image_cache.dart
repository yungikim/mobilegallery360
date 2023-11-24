import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';


class ImageLoadCache extends StatelessWidget {
  final double width;
  final double height;
  final String url;
  const ImageLoadCache({super.key, required this.width, required this.height, required this.url});

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      url,
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
  }
}

