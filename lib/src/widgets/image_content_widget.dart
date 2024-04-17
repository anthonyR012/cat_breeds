import 'package:catbreeds/config/constant/assets_constant.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ImageContent extends StatelessWidget {
  const ImageContent(
      {super.key,
      required this.height,
      required this.width,
      required this.url});
  final double height;
  final double width;
  final String url;

  @override
  Widget build(BuildContext context) {
    Widget loadWidget = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset(
          "$pathManagementJson$animationLoad",
          width: 90,
          height: 90,
          errorBuilder: (context, error, stackTrace) {
            return const SizedBox();
          },
          fit: BoxFit.fill,
        ),
      ],
    );
    return SizedBox(
        height: height,
        width: width,
        child: url.isNotEmpty
            ? Image.network(
                url,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  return loadingProgress != null ? loadWidget : child;
                },
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    '$pathManagementImages$imageNoFound',
                    fit: BoxFit.scaleDown,
                  );
                },
              )
            : loadWidget);
  }
}
