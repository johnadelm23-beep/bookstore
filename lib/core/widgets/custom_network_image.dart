import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.hight,
    this.fit,
  });
  final String imageUrl;
  final double width;
  final double hight;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: hight,
      fit: fit,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(image: DecorationImage(image: imageProvider)),
      ),
      placeholder: (context, url) => Skeletonizer(
        enabled: true,
        child: Container(
          width: width,
          height: hight,
          color: Colors.grey.shade300,
        ),
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
