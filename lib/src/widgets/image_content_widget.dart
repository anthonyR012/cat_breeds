import 'package:catbreeds/config/constant/assets_constant.dart';
import 'package:catbreeds/config/constant/end_point_constant.dart';
import 'package:flutter/material.dart';

class ImageContent extends StatelessWidget {
  const ImageContent(
      {super.key,
      required this.height,
      required this.width,
      required this.reference});
  final double height;
  final double width;
  final String reference;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Image.network(
          getImageUrl.replaceAll("[referenceImage]", reference),
          fit: BoxFit.cover, loadingBuilder: (context, child, loadingProgress) {
        return loadingProgress != null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : child;
      }, errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          '$pathManagementImages$imageNoFound',
          fit: BoxFit.scaleDown,
        );
      },
      ),
    );
  }
}
